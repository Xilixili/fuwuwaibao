package ReadHBase

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client._
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.sql.SQLContext
import org.apache.spark.{SparkConf, SparkContext}
object PP {
  //个性化匹配

  def main(job_name:String,city:String,sala:Int,self_jy:String,self_xl:String): Unit = {

    val sparkConf = new SparkConf().setAppName("ZNPP").setMaster("local")
    val sc = new SparkContext(sparkConf)
    val sqlContext = new SQLContext(sc)
    val tablename = "bigdata1"
    val conf = HBaseConfiguration.create()
    //设置zooKeeper集群地址，也可以通过将hbase-site.xml导入classpath，但是建议在程序里这样设置
    conf.set("hbase.zookeeper.quorum", "master")
    //设置zookeeper连接端口，默认2181
    conf.set("hbase.zookeeper.property.clientPort", "2181")
    conf.set(TableInputFormat.INPUT_TABLE, tablename)

    val hBaseConf1 = HBaseConfiguration.create()
    hBaseConf1.set(TableInputFormat.INPUT_TABLE, "bigdata1")

    //读取数据并转化成rdd
    val hBaseRDD1 = sc.newAPIHadoopRDD(hBaseConf1, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])


    var rdd = hBaseRDD1.map(r => (
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("rowkey"))),//1
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_name"))),//2
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("weight"))),//3
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_link"))),//4
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_num"))),//5
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_fkl"))),//6
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_desc"))),//7
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_wel"))),//8
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_name"))),//9
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_link"))),//10
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala_low"))),//11
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala_high"))),//12
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala"))),//13
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_adr"))),//14
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("create_time"))),//15
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_prop"))),//16
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_gm"))),//17
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("self_jy"))),//18
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("self_xl"))),//19
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_desc")))//20
    ))
    rdd=rdd.map(x=>(x._1,x._2,0.toString,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))
    val instance = CLibrary.getInstance("nlplib/libNLPIR.so"); //传入NLPIR库所在的路径

    // val Instance = Native.loadLibrary("nlplib/NLPIR", classOf[CLibrary]).asInstanceOf[CLibrary]
    //初始化
    val init_flag = instance.NLPIR_Init(".", 1, "0")

    var resultString: String = null;

    if (0 == init_flag) {
      resultString = instance.NLPIR_GetLastErrorMsg;
      Console.err.println("初始化失败！\n" + resultString)
      return
    }
  
    val str = instance.NLPIR_ParagraphProcess(job_name, 0)
    val str1 = str.split(" ")//分词结果数组
    var rdd1=rdd
    for (i <- 0 to str1.length - 1) {
      rdd1 = rdd.filter(x => x._2.contains(str1(i)))
    }


    rdd1=rdd1.map(x=>(x._1,x._2,(x._3.toInt+1).toString,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))//第一次过滤加权重

    var rdd2=rdd.filter(x=>x._14.contains(city))
    rdd2=rdd2.map(x=>(x._1,x._2,(x._3.toInt+1).toString,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))//第二次过滤
    rdd2=rdd2.filter(x=>(!x._13.contains("面议"))&&(!x._13.contains("1000元以下")))

    var rdd0=rdd
    var rdd3=rdd0.filter(x=>(sala>x._11.toInt&&sala<x._12.toInt))
    rdd3=rdd.map(x=>(x._1,x._2,(x._3.toInt+1).toString,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))//第三次过滤

    var rdd4=rdd.filter(x=>transform.JY1(x._18)<transform.JY1(self_jy))
    rdd4=rdd4.map(x=>(x._1,x._2,(x._3.toInt+1).toString,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))//4

    var rdd5=rdd.filter(x=>transform.JY1(x._19)<transform.JY1(self_xl))
    rdd4=rdd4.map(x=>(x._1,x._2,(x._3.toInt+1).toString,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))//5

    var rdd6=rdd1.union(rdd2)
    rdd6=rdd6.union(rdd3)//合并所有集合
    rdd6=rdd6.union(rdd4)
    rdd6=rdd6.union(rdd5)
    rdd6=rdd6.filter(x=>(!x._13.contains("1000元以下")))
    var rdd7=rdd6.map(x=>(x._1,x._3.toInt))
    rdd7=rdd7.reduceByKey((x,y)=>x+y)


    val config = HBaseConfiguration.create()
    val conn = ConnectionFactory.createConnection(config)
 val A=rdd7.collect()
   print(A.length)
    A.foreach(x=>print(x))
    for (i<-0 to A.length-1){
      HBase_Con.Hbase_insert(conn,"bigdata1",A(i)._1,"cf","weight",A(i)._2.toString)
    }

//    while (I1.hasNext){
//      var i=0
//      val x=I1
//      HBase_Con.Hbase_deleteOne(conn,"bigdata",I2.apply(i)._1,"cf","weight")
//      print(i)
//      HBase_Con.Hbase_insert(conn,"bigdata",I2.apply(i)._1,"cf","weight",I2.apply(i)._2.toString)
//      i=i+1
//      I1.next()
//    }
    PP1.main(sc)
    //val rdd7=rdd6.map(x=>(x._1,x._2,x._3,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18,x._19,x._20))
    //    val shop1=rdd7.toDF("rowkey","job_name","weight","job_link","job_num","job_fkl", "com_desc","com_wel","com_name", "com_link", "job_sala_low", "job_sala_high", "job_sala", "com_adr", "create_time", "com_prop", "com_gm", "self_jy", "self_xl","job_desc")

    sc.stop()


  }

}

