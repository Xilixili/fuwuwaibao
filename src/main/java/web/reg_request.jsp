<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.DaoUser"%>
<%@ page import="util.DBHelper"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'reg_request.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
 
	<%
		//注册
		User u=new User();
		u.setUser_name(request.getParameter("Name"));
		u.setPassword(request.getParameter("Password")); 
		u.setMobile(request.getParameter("Mobile")); 
		u.setEmail(request.getParameter("Email"));

		DaoUser dao=new DaoUser();
		dao.addUser(u);
		out.print("注册成功!!!!<br>三秒后将跳转到登录页面 <br> <br> 如果没有跳转,请按 <a href=\"login.jsp\">这里</a>!!!");
		response.setHeader("refresh", "3;URL=login.jsp");
	%>
 
	
	<br>
</body>
</html>
