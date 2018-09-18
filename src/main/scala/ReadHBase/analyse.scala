package ReadHBase

import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client._
import org.apache.hadoop.hbase.mapreduce.TableInputFormat
import org.apache.hadoop.hbase.util.Bytes
import org.apache.spark.sql.SQLContext
import org.apache.spark.{SparkConf, SparkContext}

object job {
//生成企业的分词文件
  def main(job_name:String): Unit = {

      val sparkConf = new SparkConf().setAppName("ReadHBase666").setMaster("local")
      val sc = new SparkContext(sparkConf)
      val sqlContext = new SQLContext(sc)
      //    val user=toemploee(args)

      //    var User =Array("大数据架构师","大数据工程师","大数据产品经理","大数据分析","大数据讲师","大数据助理","大数据实习生","算法工程师","数据挖掘师","","","","")
      val tablename = "bigdata1"
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
      hBaseConf.set(TableInputFormat.INPUT_TABLE, "bigdata1")

      //读取数据并转化成rdd
      val hBaseRDD = sc.newAPIHadoopRDD(hBaseConf, classOf[TableInputFormat],
          classOf[org.apache.hadoop.hbase.io.ImmutableBytesWritable],
          classOf[org.apache.hadoop.hbase.client.Result])

      import sqlContext.implicits._


      val shop = hBaseRDD.map(r => (
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
      )).toDF("job_name", "job_link", "job_fkl", "com_desc", "com_name", "com_link", "job_sala_low", "job_sala_high", "job_sala", "job_desc", "com_adr", "create_time", "com_prop", "com_gm", "self_jy", "self_xl", "rowkey", "weight")

      shop.registerTempTable("shop")
      // 测试
      val df = sqlContext.sql("SELECT * FROM shop")

      val df1 = df.filter($"job_name".rlike(job_name))
      val df2 = df1.select("job_desc")
      val rdd = df2.rdd
//        rdd.foreach(x=>print(x))
//      rdd.saveAsTextFile("/home/hhh/"+job_name.hashCode.toString+"/"+job_name.hashCode.toString)
      job_FX.main(job_name,sc)



  }

}