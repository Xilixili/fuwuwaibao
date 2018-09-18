import ReadHBase.HBase_Con
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.ConnectionFactory
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.SparkContext
import org.apache.spark.sql.{SQLContext, SaveMode}
//公司界面的mysql表建立，建立的临时的mysql表
object get_job {
  def main(job_row: String, job_name: String, sc: SparkContext): Unit = {
    val config = HBaseConfiguration.create()
    val conn = ConnectionFactory.createConnection(config)
    HBase_Con.Hbase_create(conn, job_name.hashCode.toString, "cf1", "cf2")


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
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf1"), Bytes.toBytes("rowkey"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("job_name"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("sala"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("renshu"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("self_jy"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("nianling"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("com_adr"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("dianhua"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("lianxiren"))),
      Bytes.toString(r._2.getValue(Bytes.toBytes("cf2"), Bytes.toBytes("self_xl")))
    )).toDF("id", "job_name", "salary","renshu","jingyan","nianling","didian","dianhua","lianxiren","xueli")

    shop.registerTempTable("shop")
    // 测试
    val df2 = sqlContext.sql("SELECT * FROM shop")
    df2.show()

    val prop = new java.util.Properties
    prop.setProperty("user", "root")
    prop.setProperty("password", "root")
    val url = "jdbc:mysql://localhost:3306/bigdata"
    df2.write.mode(SaveMode.Overwrite).jdbc(url,"job",prop)


    sc.stop()
  }
}



