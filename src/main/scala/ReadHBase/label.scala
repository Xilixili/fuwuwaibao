package ReadHBase

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.HBaseAdmin
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.rdd.RDD
import org.apache.spark.sql.SQLContext
import org.apache.spark.{SparkConf, SparkContext}

object label{
  def main(job_name:String,self_xl:String,self_jy:String,city:String): Unit = {

    val sparkConf = new SparkConf().setAppName("species").setMaster("local")
    val sc = new SparkContext(sparkConf)
    val sqlContext = new SQLContext(sc)
    val tablename ="bigdata1"
    val conf = HBaseConfiguration.create()
    //设置zooKeeper集群地址，也可以通过将hbase-site.xml导入classpath，但是建议在程序里这样设置
    conf set("hbase.zookeeper.quorum", "master")
    //设置zookeeper连接端口，默认2181
    conf.set("hbase.zookeeper.property.clientPort", "2181")
    conf.set(TableInputFormat.INPUT_TABLE, tablename)

    // 如果表不存在则创建表
    val admin = new HBaseAdmin(conf)
    val hBaseConf = HBaseConfiguration.create()
    hBaseConf.set(TableInputFormat.INPUT_TABLE, tablename)
    //读取数据并转化成rdd
    val hBaseRDD = sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])
      val xl=transform.XL1(self_xl)
      val jy=transform.XL1(self_jy)
      val C=transform.City(city)


    val rdd1 = hBaseRDD.map(r => (
      //      Bytes.toString(r._1.get
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_name"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("self_jy"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("self_xl"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_adr"))),
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala")))

//      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_desc")))
    ))
    rdd1.foreach(x=>print(x))
    val rdd2=rdd1.filter(x=>(!x._5.contains("面议"))&&(!x._5.contains("1000元")))
    val rdd3=rdd2.map(x=>(x._1,
      transform.JY1(x._2),
      transform.XL1(x._3),
      if(x._4.contains("-")) transform.City(x._4.split("-")(0))else transform.City(x._4),
      if (x._5.contains("-"))(x._5.split("-")(0).toInt+x._5.split("-")(1).toInt)/2 else 0))

    val rdd4=rdd3.filter(x=>(x._1.contains("大数据") && x._1.contains("开发")))
    rdd4.foreach(x=>print(x))
    val str=job_name.hashCode.toString
    val rdd5:RDD[Array[String]]=rdd4.map(x =>Array(x._1.hashCode.toString,x._2.toString,x._3.toString,x._4.toString,x._5.toString))
    Tree.main(rdd5,sc,job_name.hashCode,xl,jy,C)

  }

}