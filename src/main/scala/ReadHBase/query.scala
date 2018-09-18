package  ReadHBase
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client._
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.sql.{SQLContext, SaveMode}
import org.apache.spark.{SparkConf, SparkContext}

object query {
  //查询搜索的功能，以及排序显示
  def main(IString: String): Unit = {

    val sparkConf = new SparkConf().setAppName("ReadHBase").setMaster("local")
    val sc = new SparkContext(sparkConf)
    val sqlContext = new SQLContext(sc)
    val tablename = "bigdata"
    val conf = HBaseConfiguration.create()
    //设置zooKeeper集群地址，也可以通过将hbase-site.xml导入classpath，但是建议在程序里这样设置
    conf set("hbase.zookeeper.quorum", "master")
    //设置zookeeper连接端口，默认2181
    conf.set("hbase.zookeeper.property.clientPort", "2181")
    conf.set(TableInputFormat.INPUT_TABLE, tablename)
    // 如果表不存在则创建表
    val admin = new HBaseAdmin(conf)
    //    if (!admin.isTableAvailable(tablename)) {
    //      val tableDesc = new HTableDescriptor(TableName.valueOf(tablename))
    //      admin.createTable(tableDesc)
    //    }
    val hBaseConf = HBaseConfiguration.create()
    hBaseConf.set(TableInputFormat.INPUT_TABLE, "bigdata")

    //读取数据并转化成rdd
    val hBaseRDD = sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])


    val rdd1 = hBaseRDD.map(r => (
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_name"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_link"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_fkl"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_desc"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_name"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_link"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala_low"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala_high"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_sala"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("job_desc"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_adr"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("create_time"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_prop"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("com_gm"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("self_jy"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("self_xl"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("rowkey"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("weight")))
    ))

    val instance1 = CLibrary.getInstance("nlplib/libNLPIR.so"); //传入NLPIR库所在的路径

    // val Instance = Native.loadLibrary("nlplib/NLPIR", classOf[CLibrary]).asInstanceOf[CLibrary]
    //初始化
    val init_flag = instance1.NLPIR_Init(".", 1, "0")

    var resultString: String = null;

    if (0 == init_flag) {
      resultString = instance1.NLPIR_GetLastErrorMsg;
      Console.err.println("初始化失败！\n" + resultString)
      return
    }
    import sqlContext.implicits._

    val UserDictPath="/home/hhh/user_dic1.txt"
    instance1.NLPIR_ImportUserDict(UserDictPath,false)
    val str1=instance1.NLPIR_ParagraphProcess(IString.trim,0)
    print(str1)
    val arr:Array[String]=str1.split(" ")
var rdd2=rdd1

    for(i<-0 to arr.length-1){
       rdd2=rdd2.filter(x=>x._1.toString.contains(arr(i)))
    }

    val df1=rdd2.map(x=>(x._1,x._2,x._3,x._4,x._5,x._6,x._7,x._8,x._9,x._10,x._11,x._12,x._13,x._14,x._15,x._16,x._17,x._18)).toDF("job_name", "job_link", "job_fkl","com_desc", "com_name", "com_link", "job_sala_low", "job_sala_high", "job_sala", "job_desc","com_adr", "create_time", "com_prop", "com_gm", "self_jy", "self_xl","rowkey", "weight")
    df1.registerTempTable("df1")
    val df2 = sqlContext.sql("SELECT * FROM df1")
    val prop = new java.util.Properties//操作权值，直接得到所有rowkey然后修改hbase的数据
    prop.setProperty("user","root")
    prop.setProperty("password","root")
    val url="jdbc:mysql://localhost:3306/bigdata"
    df2.write.mode(SaveMode.Overwrite).jdbc(url,"queryRS",prop)
    sc.stop()
    admin.close()
  }


}

