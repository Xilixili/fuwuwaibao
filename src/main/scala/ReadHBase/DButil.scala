package ReadHBase

/**
  * Created by GatsbyNewton on 2015/10/12.
  */
object Operators {

  case class Yuce(job_name: Int, sala: String)

  //Insert operator
  def add(yuce: Yuce): Boolean = {
    val conn = DBUtils.getConnection()
    try {
      val sql = new StringBuilder()
          .append("INSERT INTO yuce(job_name,sala)")
        .append("VALUES(?,?)")
      val pstm = conn.prepareStatement(sql.toString())
      pstm.setObject(1, yuce.job_name)
      pstm.setObject(2, yuce.sala)


      pstm.executeUpdate() > 0
    }
    finally {
      conn.close()
    }
  }

  //Delete operator
  //  def delete(id: String): Boolean ={
  //    val conn = DBUtils.getConnection()
  //    try{
  //      val sql = "DELETE FROM user WHERE id = ?"
  //      val pstm = conn.prepareStatement(sql)
  //      pstm.setObject(1, id)
  //
  //      pstm.executeUpdate() > 0
  //    }
  //    finally {
  //      DBUtils.close(conn)
  //    }
  //  }
  //
  //  //Update operator
  //  def modify(user: User): Boolean ={
  //    val conn = DBUtils.getConnection()
  //    try{
  //      val sql = "UPDATE user SET age = ? WHERE id = ?"
  //      val pstm = conn.prepareStatement(sql)
  //      pstm.setObject(1, user.age)
  //      pstm.setObject(2, user.id)
  //
  //      pstm.executeUpdate() > 0
  //    }
  //    finally {
  //      DBUtils.close(conn)
  //    }
  //  }
  //
  //  //Select operator
  //  def query(id: Int): ArrayBuffer[mutable.HashMap[String, Any]] = {
  //    val conn = DBUtils.getConnection()
  //    try{
  //      val sql = new StringBuilder()
  //        .append("SELECT name, age")
  //        .append("  FROM user")
  //        .append(" WHERE id >  ?")
  //      val pstm = conn.prepareStatement(sql.toString())
  //      pstm.setObject(1, id)
  //      val rs = pstm.executeQuery()
  //
  //      val rsmd = rs.getMetaData()
  //      val size = rsmd.getColumnCount()
  //      val buffer = new ArrayBuffer[mutable.HashMap[String, Any]]()
  //      while (rs.next()){
  //        val map = mutable.HashMap[String, Any]()
  //        for(i <- 1 to size) {
  //          map += (rsmd.getColumnLabel(i) -> rs.getString(i))
  //        }


}