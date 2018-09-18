<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.DaoUser"%>
<%@ page import="util.DBHelper"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String s1 = request.getParameter("s1");
		String s2 = request.getParameter("s2");
		String s3 = request.getParameter("s3");
		String s4 = request.getParameter("s4");
		String s5 = request.getParameter("s5");
		String s6 = request.getParameter("s6");
		String s7 = request.getParameter("s7");

		/* PrintWriter out=new PrintWriter();
		out.print(s1); */
	%>

	<script type="text/javascript">
	
	document.write("以下数据已应用:<br>");
	document.write("已选网站有是&nbsp;<%=s1%>&nbsp;");
	document.write("<%=s2%>&nbsp;");
	document.write("<%=s3%>&nbsp;<br>");
	document.write("爬取频率:<%=s4%><br>");
	document.write("爬取速率:<%=s5%><br>");
	document.write("分析深度:<%=s6%><br>");
	document.write("交叉验证次数:<%=s7%><br>");
	
	$(document).ready(function() {

		
	$.ajax({
	
	
		//使用ajax提交数据

				type : "post",

				url : "DaoSpiderInfoServlet04",

				//返回数据形式为json
				dataType : "json",
				data : {
					s1 :"<%=s1%>"	,
					s2 :"<%=s2%>"	,
					s3 :"<%=s3%>"	,
					s4 :"<%=s4%>"	,
					s5 :"<%=s5%>"	,
					s6 :"<%=s6%>"	,
					s7 :"<%=s7%>"	},

				success : function(result) {
					//alert("连接servlet04成功");

				},

				error : function(errorMsg) {

				}
			})
		});
	</script>


</body>
</html>