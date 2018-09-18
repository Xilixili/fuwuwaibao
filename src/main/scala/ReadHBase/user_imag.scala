package ReadHBase
object  user_imag{

  def main(user_name:String,school:String,ability:String,self_xl:String,sell_jy:String): Unit = {
    var xuexiao=transform.School(school)


    var jingyan=transform.JY1(sell_jy)
    var xueli=transform.XL1(self_xl)
    if(xueli>4){
      var xueli1="高学历"
    }
    if(jingyan>4){
      var jingyan1="丰富经验"
    }


  }
}