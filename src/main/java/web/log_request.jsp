<%@ page language="java" import="java.util.*"
		 contentType="text/html; charset=utf-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.DaoUser"%>
<%@ page import="util.DBHelper"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
	//登录

	if (request.getParameter("Username").equals("root") && request.getParameter("Password").equals("root")) {
		out.print("<a href=\"Administrator.jsp\">进入管理员页面 </a>");
	}

	else {
		User u2 = new User();
		DaoUser dao2 = new DaoUser();

		//out.print(request.getParameter("Username"));

		List<User> result = dao2.query(request.getParameter("Username"));

		//out.print(result.size());

		if (result.size() > 0) {
			String password = null;
			for (int i = 0; i < result.size(); i++) {
				password = result.get(i).getPassword();
			}
			if (password.equals(request.getParameter("Password"))) {
				out.print("登陆成功<br>三秒后将跳转到登录页面 <br> <br> 如果没有跳转,请按 <a href=\"input.jsp\">这里</a>!!!");
				response.setHeader("refresh", "3;URL=input.jsp");
				//使用URLEncoder解决无法在Cookie当中保存中文字符串问题
				//String password = request.getParameter("password");
				//Cookie passwordCookie = new Cookie("password", password);
				//passwordCookie.setMaxAge(864000);
				//response.addCookie(passwordCookie);

				//设置Cookie失效
				Cookie[] cookies = request.getCookies();
				if (cookies != null && cookies.length > 0) {
					for (Cookie c : cookies) {
						if (c.getName().equals("user_name")) {
							c.setMaxAge(0); //设置Cookie失效
							response.addCookie(c); //重新保存。

						}
					}
				}

				//把用户名保存在Cookie对象里面
				String user_name = request.getParameter("Username");

				Cookie user_nameCookie = new Cookie("user_name", user_name);

				user_nameCookie.setMaxAge(864000);//设置最大生存期限为10天

				response.addCookie(user_nameCookie);

				out.print("<a href=\"input.jsp\">进入简历填写页面 </a>");

			} else {
				out.print("密码错误");
			}
		} else {
			out.print("用户不存在");
		}
	}
%>

<%

%>




<a name="" href="input.html"></a>


<br>
</body>
</html>
