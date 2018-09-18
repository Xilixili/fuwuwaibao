package ReadHBase
import java.io.PrintWriter

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client._
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.sql.{SQLContext, SaveMode}
import org.apache.spark.{SparkConf, SparkContext}

import scala.io.Source
import scala.util.matching.Regex
object sala_FX {
  //查询搜索的功能，以及排序显示
  //生成薪水能力的分词文件
  //薪水影响的能力分析
  def main(job_name: String, sala_FX: Int): Unit = {
    //传入分析预测的工资分析，两种1、根据所有分析

    val sparkConf = new SparkConf().setAppName("Demo1").setMaster("local")
    val sc = new SparkContext(sparkConf)
    val sqlContext = new SQLContext(sc)
    val tablename = "bigdata1"
    val conf = HBaseConfiguration.create()
    //设置zooKeeper集群地址，也可以通过将hbase-site.xml导入classpath，但是建议在程序里这样设置
    conf.set("hbase.zookeeper.quorum", "master")
    //设置zookeeper连接端口，默认2181
    conf.set("hbase.zookeeper.property.clientPort", "2181")
    conf.set(TableInputFormat.INPUT_TABLE, tablename)
    // 如果表不存在则创建表
    val admin = new HBaseAdmin(conf)
    val hBaseConf = HBaseConfiguration.create()
    hBaseConf.set(TableInputFormat.INPUT_TABLE, "bigdata1")

    //读取数据并转化成rdd
    val hBaseRDD = sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])

    var rdd1 = Utils.ReadtoRDD("bigdata1", sc) //读取到rdd1


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
    val UserDictPath = "/home/hhh/user_dic.txt"
    val str = instance.NLPIR_ParagraphProcess(job_name, 0)
    val str0 = str.split(" ")
    for (i <- 0 to str0.length - 1) {
      rdd1 = rdd1.filter(x => x._2.contains(str0(i)))
    } //分词后判断是否同时含有这两个词语
    rdd1=rdd1.filter(x=>(!x._13.contains("1000元以下"))&&(!x._13.contains("面议")))
    var rdd3 = rdd1
    var rdd2 = rdd1.filter(x => (sala_FX < x._11.toInt))

    val rdd33=rdd3.map(x=>(x._20))
    val rdd22=rdd2.map(x=>(x._20))//2


    rdd22.saveAsTextFile("/home/hhh/sala/sala2") //2   用于起借鉴作用的工资影响因素
    rdd33.saveAsTextFile("/home/hhh/sala/sala1") //1   总的工资影响因素
    val Str1=Utils.filetostring("/home/hhh/sala/sala1/part-00000")
    val Str2=Utils.filetostring("/home/hhh/sala/sala2/part-00000")

    val str1="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"

    val str2="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"

    val str3="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"


    val str4="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"


    val str5="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"


    val str6="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"

    val str7="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"


    val str8="(\\任职要求|\\岗位要求)\\D\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n" +
      "\\d\\D[\\u4e00-\\u9fa5\\s\\d].{7,}\\n"
    val Str11=str1+"|"+str2+"|"+str3+"|"+str4+"|"+str5+"|"+str6+"|"+str7+"|"+str8
    val pattern=new Regex(Str11)
    val result =pattern
    val source = Source.fromFile("/home/hhh/sala/sala1/part-00000" ,"UTF-8")
    val source1 = Source.fromFile("/home/hhh/sala/sala2/part-00000" ,"UTF-8")
    val contents = source.mkString
    val contents1 = source1.mkString
    val result1=(pattern findAllIn contents).mkString("\n")
    val result2=(pattern findAllIn contents1).mkString("\n")
    val writer = new PrintWriter("/home/hhh/sala/sala1/part1-00000")
    val writer1 = new PrintWriter("/home/hhh/sala/sala2/part1-00000")

    writer.write(result1)
    writer1.write(result2)
    writer.close()
    writer1.close()


    val instance1 = CLibrary.getInstance("nlplib/libNLPIR.so"); //传入NLPIR库所在的路径
    val instance2 = CLibrary.getInstance("nlplib/libNLPIR.so"); //传入NLPIR库所在的路径

    // val Instance = Native.loadLibrary("nlplib/NLPIR", classOf[CLibrary]).asInstanceOf[CLibrary]
    //初始化
    val init_flag1 = instance1.NLPIR_Init(".", 1, "0")
    val init_flag2 = instance1.NLPIR_Init(".", 1, "0")

    var resultString1: String = null;
    var resultString2: String = null;

    if (0 == init_flag1) {
      resultString1 = instance1.NLPIR_GetLastErrorMsg;
      Console.err.println("初始化1失败！\n" + resultString1)
      return
    }
    if (0 == init_flag2) {
      resultString2 = instance1.NLPIR_GetLastErrorMsg;
      Console.err.println("初始化2失败！\n" + resultString2)
      return
    }


    //      val sinput=Source.fromFile("/home/hhh/a1/part-00000","gb2312")
      //      print(sinput)
      //      resultString=instance.NLPIR_ParagraphProcess(sinput,1)
      val dict1=instance1.NLPIR_ImportUserDict(UserDictPath,true)
      val dict2=instance1.NLPIR_ImportUserDict(UserDictPath,true)
      //分词后文件存储
      instance1.NLPIR_FileProcess("/home/hhh/sala/sala1/part1-00000","/home/hhh/sala/sala1/part-00001",1)
      instance1.NLPIR_FileProcess("/home/hhh/sala/sala2/part1-00000","/home/hhh/sala/sala2/part-00001",1)


      val Str=Utils.filetostring("/home/hhh/sala/sala1/part-00001")
      val Str22=Utils.filetostring("/home/hhh/sala/sala2/part-00001")
       resultString1 =instance1.NLPIR_GetKeyWords(Str,20,false)
       resultString2 =instance1.NLPIR_GetKeyWords(Str22,20,false)
      print(resultString1)
      print(resultString2)

      val c=resultString1.split("#").toList.toArray[String]
      val c3=resultString2.split("#").toList.toArray[String]

      val config = HBaseConfiguration.create()
      val conn = ConnectionFactory.createConnection(config)

      HBase_Con.Hbase_create(conn,"sala1","cf1","cf2")
      HBase_Con.Hbase_create(conn,"sala2","cf1","cf2")

      val c1 =instance1.NLPIR_GetKeyWords(Str,20,true)
      val c2 =instance2.NLPIR_GetKeyWords(Str22,20,true)

      val c11=c1.split("#").toList.toArray[String]
      val c22=c2.split("#").toList.toArray[String]

//插入
      for (i<-0 to (c.length-1)){
        var b=c11(i).split("/")
        print(b.length)
        HBase_Con.Hbase_insert(conn,"sala1",i.toString,"cf1","ability",b(0))
        HBase_Con.Hbase_insert(conn,"sala1",i.toString,"cf2","weight",b(2))
        HBase_Con.Hbase_insert(conn,"sala1",i.toString,"cf2","times",b(3))
      }
    for (i<-0 to (c3.length-1)){
        val c=c22(i).split("/")
      print(c.length)
        HBase_Con.Hbase_insert(conn,"sala2",i.toString,"cf1","ability",c(0))
        HBase_Con.Hbase_insert(conn,"sala2",i.toString,"cf2","weight",c(2))
        HBase_Con.Hbase_insert(conn,"sala2",i.toString,"cf2","times",c(3))
      }

      val tablename1 = "sala1"
      val tablename2 ="sala2"
      val hBaseConf1 = HBaseConfiguration.create()
      val hBaseConf2 = HBaseConfiguration.create()

      hBaseConf1.set(TableInputFormat.INPUT_TABLE, tablename1)
      hBaseConf2.set(TableInputFormat.INPUT_TABLE, tablename2)

      //读取数据并转化成rdd
      var hBaseRDD1 = sc.newAPIHadoopRDD(hBaseConf1, classOf[TableInputFormat],
        classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
        classOf[org.apache.hadoop.hbase.client.Result])
      var hBaseRDD2 = sc.newAPIHadoopRDD(hBaseConf2, classOf[TableInputFormat],
        classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
        classOf[org.apache.hadoop.hbase.client.Result])


      import sqlContext.implicits._

      val shop = hBaseRDD1.map(r => (
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf1"), Bytes.toBytes("ability"))),
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("weight"))),
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("times")))
      )).toDF("ability", "weight","times")

    val shop1 = hBaseRDD2.map(r => (
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf1"), Bytes.toBytes("ability"))),
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("weight"))),
        Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("times")))
      )).toDF("ability", "weight","times")

      shop.registerTempTable("shop")
      shop1.registerTempTable("shop1")
      // 测试
      val df2 = sqlContext.sql("SELECT * FROM shop")
      val df22 = sqlContext.sql("SELECT * FROM shop1")

      df2.show()
      df22.show()

      val prop = new java.util.Properties
      prop.setProperty("user","root")
      prop.setProperty("password","root")
      val url="jdbc:mysql://localhost:3306/bigdata"

      df2.write.mode(SaveMode.Overwrite).jdbc(url,"sala1",prop)
      df22.write.mode(SaveMode.Overwrite).jdbc(url,"sala2",prop)


    sc.stop()
    admin.close()

  }


}