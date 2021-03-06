package ReadHBase
//参数转换,1指对公司，2指对求职者的简历数据
object transform {

  def ZY2(zy1:String): Int = {
    var a = 0
    val url = "/home/hhh/major.txt"
    val b = Utils.filetostring(url)

    if (b.contains(zy1)){
      a = 1
    }
    a
  }


  def ZY1(zy1: String): Int = {
    var a = 0
    if (zy1.contains("相关专业")) {
      a = 1
    }
    a
  }

  def JY1(jy: String): Int = jy match {
    case "1-3年" => 1
    case "3-5年" => 2
    case "5-10年" => 3
    case "10年以上" => 4
    case _ => 0
  }

  def JY_1(jy1:Int):String =jy1 match{
    case 1=>"1-3年"
    case 2=>"3-5年"
    case 3=>"5-10年"
    case 4=>"10年以上"
    case 0=>"无要求"
  }


  def XL1(xl: String): Int = xl match {
    case "专科" => 1
    case "本科" => 2
    case "硕士" => 3
    case _ => 0
  }

  def XL_1(jy1:Int):String =jy1 match{
    case 1=>"专科"
    case 2=>"本科"
    case 3=>"硕士"
    case 0=>"其他"
  }


  def City(city:String): Int={
    var a=0
    val a1=Utils.filetostring("/home/hhh/city/n1.txt")
    val a2=Utils.filetostring("/home/hhh/city/1.txt")
    val a3=Utils.filetostring("/home/hhh/city/2.txt")
    val a4=Utils.filetostring("/home/hhh/city/3.txt")
    val a5=Utils.filetostring("/home/hhh/city/4.txt")
    val a6=Utils.filetostring("/home/hhh/city/5.txt")
    if(a1.contains(city)){
      a=1
    }
    else if(a2.contains(city)){
      a=2
    }
    else if(a3.contains(city)){
      a=3
    }
    else if(a4.contains(city)){
      a=4
    }
    else if(a5.contains(city)){
      a=5
    }
    else if(a6.contains(city)){
      a=6
    }
    a
  }
  def School(school:String): String={
    var a=""

    val a2=Utils.filetostring("/home/hhh/school/1.txt")
    val a3=Utils.filetostring("/home/hhh/school/2.txt")

    if(a2.contains(school)){
      a="985高校大学生"
    }
    else if(a2.contains(school)){
      a="211高校大学生"
    }
    a
  }


  def nengli(nengli:String): String={
    var a=""

    val a2=Utils.filetostring("/home/hhh/nengli/1.txt")
    val a3=Utils.filetostring("/home/hhh/nengli/2.txt")

    if(a2.contains(nengli)){
      a="985高校大学生"
    }
    else if(a2.contains(nengli)){
      a="211高校大学生"
    }
    a
  }
}