//提供公司的画像
package ReadHBase

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.ConnectionFactory
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.SparkContext
import org.apache.spark.sql.{SQLContext, SaveMode}
//
object com_imag{
  def main(com_name: String,rowkey:String,sc:SparkContext): Unit = {
    val sqlContext = new SQLContext(sc)
    val rdd1=Utils.ReadtoRDD("bigdata",sc)
    val rdd2=rdd1.filter(x=>x._1.equals(rowkey))//用rowkey进行唯一筛选
    rdd2.foreach(x=>print(x))


    import sqlContext.implicits._
    val shop1=rdd1.toDF("rowkey","job_name","weight","job_link","job_fkl", "com_desc", "com_name", "com_link", "job_sala_low", "job_sala_high", "job_sala", "job_desc", "com_adr", "create_time", "com_prop", "com_gm", "self_jy", "self_xl")
    shop1.registerTempTable("shop1")

    val df2 = sqlContext.sql("SELECT * FROM shop1")
    val prop = new java.util.Properties
            prop.setProperty("user","root")
            prop.setProperty("password","root")
            val url="jdbc:mysql://localhost:3306/bigdata"
        df2.write.mode(SaveMode.Append).jdbc(url,"job",prop)//最终结果存到mysql,临时的数据

    rdd2.map(x=>(x._7,x._8,((x._11.toInt+x._12.toInt)/2).toString,x._15,x._16,x._17)).saveAsTextFile("/home/hhh/com_imag/com_imag")

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
    val UserDictPath="/home/hhh/user_dic3.txt"
    val dict=instance.NLPIR_ImportUserDict(UserDictPath,false)
  instance.NLPIR_FileProcess("/home/hhh/com_imag/com_image/part-00000","/home/hhh/com_imag/com_imag/part-00001",1)
    val str=Utils.filetostring("/home/hhh/com_imag/com_imag/part-00001")
    resultString=instance.NLPIR_GetKeyWords(str,5,false)

    val a=resultString.split("#").toList.toArray[String]

    val config = HBaseConfiguration.create()
    val conn = ConnectionFactory.createConnection(config)
    HBase_Con.Hbase_create(conn,com_name.hashCode.toString,"cf1","cf2")
    val a1 =instance.NLPIR_GetKeyWords(str,5,true)
    val a11=a1.split("#").toList.toArray[String]
    for (i<-0 to (a.length-1)){
      val b=a11(i).split("/")
      HBase_Con.Hbase_insert(conn,com_name.hashCode.toString,i.toString,"cf1","label",b(0))
      HBase_Con.Hbase_insert(conn,com_name.hashCode.toString,i.toString,"cf2","weight",b(2))
      HBase_Con.Hbase_insert(conn,com_name.hashCode.toString,i.toString,"cf2","mun",b(3))
    }
    val tablename = com_name.hashCode.toString
    val hBaseConf = HBaseConfiguration.create()
    hBaseConf.set(TableInputFormat.INPUT_TABLE, com_name.hashCode.toString)

    //读取数据并转化成rdd
    val hBaseRDD1= sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])




    val shop2 = hBaseRDD1.map(r => (
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf1"), Bytes.toBytes("label"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("weight"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("num")))
    )).toDF("label", "weight","num")

    shop2.registerTempTable("shop2")
    // 测试
    val df3 = sqlContext.sql("SELECT * FROM shop2")
    df3.show()


    df3.write.mode(SaveMode.Overwrite).jdbc(url,"company",prop)
    sc.stop()


  }
}