package ReadHBase
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.HBaseAdmin
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD

import scala.io.Source

object Utils {
  def filetostring(url: String):String = {

    val source = Source.fromFile(url)
    val contents = source.mkString

    contents
  }


  def ReadtoRDD(table:String,sc: SparkContext):RDD[(String,String,String,String,String,String,String,String,String,String,String,String,String,String,String,String,String,String,String,String)] = {

    val tablename = table
    val conf = HBaseConfiguration.create()
    //设置zooKeeper集群地址，也可以通过将hbase-site.xml导入classpath，但是建议在程序里这样设置
    conf.set("hbase.zookeeper.quorum", "master")
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
    hBaseConf.set(TableInputFormat.INPUT_TABLE, table)

    //读取数据并转化成rdd
    val hBaseRDD = sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
      classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
      classOf[org.apache.hadoop.hbase.client.Result])

    val rdd1 = hBaseRDD.map(r => (
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

    rdd1
  }



}




