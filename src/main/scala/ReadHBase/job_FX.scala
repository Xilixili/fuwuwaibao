package ReadHBase

import java.io.PrintWriter

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.ConnectionFactory
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.SparkContext
import org.apache.spark.sql.{SQLContext, SaveMode}

import scala.io.Source
import scala.util.matching.Regex

/**
  * Created by maplejaw on 2017/2/8.
  */

//分析工作必备能力
object job_FX {

  def main(job_name:String,sc:SparkContext): Unit = {

    //获取实例
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
    val str=str1+"|"+str2+"|"+str3+"|"+str4+"|"+str5+"|"+str6+"|"+str7+"|"+str8
    val pattern=new Regex(str)
    val result =pattern
    val source = Source.fromFile("/home/hhh/" +
      job_name.hashCode.toString +"/"+job_name.hashCode.toString+"/"+"part-00000","UTF-8")
    val contents = source.mkString
    val result1=(pattern findAllIn contents).mkString("\n")
    val writer = new PrintWriter("/home/hhh/" +job_name.hashCode.toString  +"/" + (job_name.hashCode+1).toString)

    writer.write(result1)
    writer.close()

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

    //以下开始测试分词

//


    try {
//      val sinput=Source.fromFile("/home/hhh/a1/part-00000","gb2312")
//      print(sinput)
//      resultString=instance.NLPIR_ParagraphProcess(sinput,1)
    val UserDictPath="/home/hhh/user_dic.txt"
     val dict=instance.NLPIR_ImportUserDict(UserDictPath,true)
    instance.NLPIR_DelUsrWord("实训生")
    //分词后文件存储
    instance.NLPIR_FileProcess("/home/hhh/" + job_name.hashCode.toString  + "/" +(job_name.hashCode+1).toString,
                               "/home/hhh/" + job_name.hashCode.toString  + "/" + job_name.hashCode.toString +"/"+"part-00001",1)




    //从分词文件提取关键词
    val Str=Utils.filetostring("/home/hhh/" + job_name.hashCode.toString  + "/" + job_name.hashCode.toString +"/"+"part-00001")
      resultString =instance.NLPIR_GetKeyWords(Str,5,false)
//      val  resultString8 =instance.NLPIR_GetFileNewWords("/home/hhh/a1/part1-00000",5,false)
//    println("新词结果为：\n " + resultString8)

     val a=resultString.split("#").toList.toArray[String]

    val config = HBaseConfiguration.create()
    val conn = ConnectionFactory.createConnection(config)
    HBase_Con.Hbase_create(conn,job_name.hashCode.toString,"cf1","cf2")
    println(a.length)
    val a1 =instance.NLPIR_GetKeyWords(Str,5,true)
    println(a1)
    val a11=a1.split("#").toList.toArray[String]
    for (i<-0 to (a.length-1)){
      val b=a11(i).split("/")
      HBase_Con.Hbase_insert(conn,job_name.hashCode.toString,i.toString,"cf1","ability",b(0))
      HBase_Con.Hbase_insert(conn,job_name.hashCode.toString,i.toString,"cf2","weight",b(2))
      HBase_Con.Hbase_insert(conn,job_name.hashCode.toString,i.toString,"cf2","num",b(3))
    }

    val sqlContext = new SQLContext(sc)
    val tablename = job_name.hashCode.toString
    val hBaseConf = HBaseConfiguration.create()
    hBaseConf.set(TableInputFormat.INPUT_TABLE, job_name.hashCode.toString)

    //读取数据并转化成rdd
    val hBaseRDD = sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])


    import sqlContext.implicits._

    val shop = hBaseRDD.map(r => (
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf1"), Bytes.toBytes("ability"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("weight"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("num")))
    )).toDF("ability", "weight","num")

    shop.registerTempTable("shop")
    // 测试
    val df2 = sqlContext.sql("SELECT * FROM shop")
    df2.show()

    val prop = new java.util.Properties
    prop.setProperty("user","root")
    prop.setProperty("password","root")
    val url="jdbc:mysql://localhost:3306/bigdata"
    df2.write.mode(SaveMode.Overwrite).jdbc(url,"ability",prop)
    sc.stop()
    } catch {
      case e: Exception => {
        println("错误信息：")
        e.printStackTrace()
      }
    } finally {
      //分词完毕后需要退出
      instance.NLPIR_Exit()
    }

  }

}