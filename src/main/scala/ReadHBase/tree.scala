package ReadHBase
import breeze.linalg.sum
import org.apache.spark.SparkContext
import org.apache.spark.mllib.linalg.Vectors
import org.apache.spark.mllib.regression.LabeledPoint
import org.apache.spark.mllib.tree.DecisionTree
import org.apache.spark.rdd.RDD

/**
  * Created by luo on 12/18/15.
  */
object Tree {

  def main(rdd: RDD[Array[String]],sc:SparkContext,job_name:Int,xl:Int,jy:Int,C:Int) {

    val str="大数据开发".hashCode.toString
    val records=rdd
    val mappings=for(i<-Range(1,3))yield get_mapping(records,i)

    val cat_len=sum(mappings.map(_.size))
    val total_len=cat_len
    //decision tree data
    val data=records.map{record=>
      val features=record.slice(1,3).map(_.toDouble)
      val label=record(record.size-1).toDouble
      LabeledPoint(label,Vectors.dense(features))

    }.randomSplit(Array(0.8,0.2),11L)
    val train_data=data(0)
    val test_data=data(1)

    val categoricalFeaturesInfo = Map[Int, Int]()
    val tree_model=DecisionTree.trainRegressor(train_data,categoricalFeaturesInfo,"variance",1,32)
    //    val linear_model=LinearRegressionWithSGD.train(data,10,0.5)
    val true_vs_predicted=test_data.map(p=>(p.label,tree_model.predict(p.features)))
    val v0 = Vectors.dense(job_name,xl,jy,C)
    val true_vs_predicted1=tree_model.predict(v0)
    println(true_vs_predicted1)

    println( true_vs_predicted.take(30).toVector.toString())

    val MSE=true_vs_predicted.map(value=>
    {
      (value._1-value._2)*(value._1-value._2)
    }).mean()

    val MAE=true_vs_predicted.map(value=>
    {
      math.abs(value._1-value._2)
    }).mean()

    val RMSLE=true_vs_predicted.map(value=>
    {
      math.pow(math.log(value._1+1)-math.log(value._2+1),2)
    }).mean()
    println(MSE)
    println(MAE)
    println(RMSLE)
      print(true_vs_predicted1.toString)
    Operators.add(Operators.Yuce(job_name,true_vs_predicted1.toInt.toString))

  }

  def get_mapping(rdd:RDD[Array[String]], idx:Int)=
  {
    rdd.map(filed=>filed(idx)).distinct().zipWithIndex().collectAsMap()
  }

}