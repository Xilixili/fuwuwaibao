<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.DaoUser"%>
<%@ page import="util.DBHelper"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="ReadHBase.PP"%>
<%@ page import="util.Scalautil" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>

	<%
		//加载Cookies
		request.setCharacterEncoding("utf-8");//中文编码
		String user_name = "";

		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("user_name")) {
					user_name = c.getValue();
				}

			}
		}

		User u = new User();
		DaoUser dao = new DaoUser();
//		Scalautil su=new Scalautil();

		u.setUser_name(user_name);

		u.setReal_name(request.getParameter("real_name"));
		u.setAge(Integer.parseInt(request.getParameter("age")));
		u.setSchool(request.getParameter("school"));
		u.setMobile(request.getParameter("mobile"));
		u.setEmail(request.getParameter("email"));
		u.setGender(request.getParameter("gender"));
		u.setZhuanye(request.getParameter("zhuanye"));
		u.setXueli(request.getParameter("xueli"));
		u.setZhiwei(request.getParameter("zhiwei"));
		u.setNengli(request.getParameter("nengli"));
		u.setGongzi(request.getParameter("gongzi"));
		u.setDidian(request.getParameter("didian"));
		u.setJingyan(request.getParameter("jingyan"));//user to mysql
		String job_name = request.getParameter("zhiwei");
		String city = request.getParameter("didian");
		String gongzi = request.getParameter("gongzi");
		String sala=request.getParameter("gongzi");
//		ReadHBase.job.main(request.getParameter("zhiwei"));//ability
//		ReadHBase.PP.main(job_name,city,sala);//job
//		ReadHBase.sala_FX.main("zhiwei",Integer.parseInt(request.getParameter("gongzi")));//sala1
//Interger.parseInt error

		try {
			dao.updateUser(u);
			out.print("成功写入简历<br>三秒后将跳转到登录页面,如果没有跳转,请按 <a href=\"w.jsp\">这里</a>!!!");
					response.setHeader("refresh", "3;URL=w.jsp");

		} catch (Exception e) {
			out.print("写入失败");
		}
	%>
<script type="text/javascript">
    $(document).ready(function() {


    $.ajax({


        //使用ajax提交数据

        type : "post",

        url : "DaoScalaServlet05",

		async:false,
        //返回数据形式为json
        dataType : "json",
        data : {
            job_name :"<%=job_name%>"	,
            city :"<%=city%>"	,
            sala :"<%=sala%>"	,

            	},

        success : function(result) {

        },

        error : function(errorMsg) {
        }
    })
    });





</script>

</body>
</html>