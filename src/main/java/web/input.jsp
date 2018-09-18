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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>简历提交</title>
<link href="css/form.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">

<style type="text/css">
#bottom_info {
	position: relative;
	top: -3.8em;
	margin: 0 0.5em;
	padding: .8em 0;
	text-align: center;
	background-color: #18c178;
	color: #ffffff;
	border: medium hidden;
	border-radius: 0.1em;
	box-sizing: border-box;
	display: none;
}

#bottom_info a {
	color: #adadad;
	width: 100%;
	text-decoration: none;
	outline: none;
}

#bottom_jump {
	position: relative;
	top: -3em;
	margin: 0 0.5em;
	padding: .8em 0;
	text-align: center;
	background-color: #62A9E3;
	color: #ffffff;
	border: medium hidden;
	border-radius: 0.1em;
	box-sizing: border-box;
	display: none;
}
</style>





</head>
<body onload="setCookie()">


	<%
		request.setCharacterEncoding("utf-8");
		String user_name = "";
		//String password = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("user_name")) {
					user_name = c.getValue();
				}//保持用户登录状态
				/* if (c.getName().equals("password")) {
					password = URLDecoder.decode(c.getValue(), "utf-8");
				} */
			}
		}
	%>



	<!-- SIDEBAR -->
	<div class="sidebar-menu hidden-xs hidden-sm">
		<div class="top-section">
			<div class="profile-image">
				<img src="img/profile.jpg" alt="Volton">
			</div>
			<h3 class="profile-title"><%=user_name%></h3>
			<p class="profile-description">VIP用户</p>
		</div>
		<!-- top-section -->
		<div class="main-navigation">
			<ul class="navigation">
				<li><a href="#top"><i class="fa fa-globe"></i>简历填写</a></li>
				
			</ul>
		</div>
		<!-- .main-navigation -->
		<!-- <div class="social-icons">
			<ul>
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-youtube"></i></a></li>
				<li><a href="#"><i class="fa fa-rss"></i></a></li>
			</ul>
		</div> -->
		<!-- .social-icons -->
	</div>
	<!-- .sidebar-menu -->


	<!-- <div class="menu">
		<ul>
			<li style="border-style: none"></li>
			<li><span style="font-size: 16px">主菜单</span></li>
			<li class="hoverchange"><span>用户简历</span></li>
			<li class="hoverchange"><span>智能推荐</span></li>
			<li class="hoverchange"><span>推荐结果</span></li>
			<li class="hoverchange"><span>推荐结果</span></li>
			<li class="hoverchange"><span>推荐结果</span></li>
			<li class="hoverchange"><span>推荐结果</span></li>
			<li style="border-style: none"></li>
		</ul>

	</div> -->
<!--简历填写界面-->
	<div class="main-content">

		<div id="subjects">
			<form id="main_form" action="input_req.jsp" method="post"
				accept-charset="utf-8" style="padding-bottom: 4em;">
				<div class="form_ctrl page_head" id="1" title="简历提交">
					<h2>简历提交</h2>

				</div>


				<div>
					你好,<span name="user_name"><%=user_name%></span>
				</div>

				<br>

				<div class="form_ctrl page_text" id="2" title="">
					<p>小型智能职业分析系统:根据您的简历为您自动匹配合适的职位，您填写的越详细，结果会更准确哦！</p>
				</div>
				<div class="form_ctrl input_text" id="3" title="姓名">
					<label class="ctrl_title">姓名</label> <input type="text"
						name="real_name" value="" placeholder="请输入您的姓名">
				</div>
				<div class="form_ctrl input_text" id="5" title="年龄">
					<label class="ctrl_title">年龄</label> <input type="text" name="age"
						value="" placeholder="请输入您的年龄">
				</div>
				<div class="form_ctrl input_text" id="4" title="学校">
					<label class="ctrl_title">学校</label> <input type="text"
						name="school" value="" placeholder="请输入您的毕业学校">
				</div>
				<div class="form_ctrl input_text" id="7" title="手机">
					<label class="ctrl_title">手机</label> <input type="text"
						name="mobile" value="" placeholder="请输入您的手机号码">
				</div>
				<div class="form_ctrl input_text" id="8" title="邮箱">
					<label class="ctrl_title">邮箱</label> <input type="text"
						name="email" value="" placeholder="请输入您的邮箱">
				</div>
				<div class="form_ctrl form_select" id="9" title="性别">
					<label class="ctrl_title">性别</label> <select name="gender" num="1"><option
							value="男" selected="selected">男</option>
						<option value="女">女</option></select>
					<div></div>
				</div>
				<div class="form_ctrl input_text" id="6" title="专业">
					<label class="ctrl_title">专业</label> <input type="text"
						name="zhuanye" value="" placeholder="请输入您的专业">
				</div>
				<div class="form_ctrl form_radio" id="10" title="学历">
					<label class="ctrl_title">学历</label>
					<div id="form_radio_options" num="1" class="">
						<p>
							<input type="radio" name="xueli" id="10-4" placeholder="radio"
								value="高中"> <label for="10-4">高中</label> <em
								class="progress_bar"> <em class="pb_con"> <em
									class="pb_thumb" style="width: 1.92%; background-color: green;"></em></em>
								<em class="pb_perc" style="color: green">1.92%</em> <em
								class="pb_count">(1)</em></em>
						</p>
						<p>
							<input type="radio" name="xueli" checked="" id="10-3"
								placeholder="radio" value="专科"> <label for="10-3">专科</label>
							<em class="progress_bar"> <em class="pb_con"> <em
									class="pb_thumb" style="width: 75%; background-color: red;"></em></em>
								<em class="pb_perc" style="color: red">75%</em> <em
								class="pb_count">(39)</em></em>
						</p>
						<p>
							<input type="radio" name="xueli" id="10-2" placeholder="radio"
								value="本科"> <label for="10-2">本科</label> <em
								class="progress_bar"><em class="pb_con"> <em
									class="pb_thumb" style="width: 13.46%; background-color: blue;"></em></em>
								<em class="pb_perc" style="color: blue">13.46%</em> <em
								class="pb_count">(7)</em></em>
						</p>
						<p>
							<input type="radio" name="xueli" id="10-1" placeholder="radio"
								value="硕士"> <label for="10-1">硕士</label> <em
								class="progress_bar"> <em class="pb_con"> <em
									class="pb_thumb"
									style="width: 9.62%; background-color: #2793D3;"></em></em> <em
								class="pb_perc" style="color: #2793D3">9.62%</em> <em
								class="pb_count">(5)</em></em>
						</p>
					</div>
				</div>
				<!--新加的  -->
				<div class="form_ctrl input_text" id="4" title="能力">
					<label class="ctrl_title">能力</label> <input type="text"
						name="nengli" value="" placeholder="请输入您的能力">
				</div>
				<div class="form_ctrl input_text" id="4" title="职位">
					<label class="ctrl_title">岗位</label> <input type="text"
						name="zhiwei" value="" placeholder="请输入您的期望工作">
				</div>
				
				<div class="form_ctrl input_text" id="4" title="工资">
					<label class="ctrl_title">期望工资</label> <input type="text"
						name="gongzi" value="" placeholder="请输入您的期望工资">
				</div>
				<div class="form_ctrl input_text" id="4" title="地点">
					<label class="ctrl_title">工作地点</label> <input type="text"
						name="didian" value="" placeholder="请输入您的工作地点">
				</div>
				<div class="form_ctrl input_text" id="4" title="经验">
					<label class="ctrl_title">工作经验</label> <input type="text"
						name="jingyan" value="" placeholder="请输入您的工作经验">
				</div>

				<div class="form_ctrl form_submit" id="12" title="点击下述按钮，提交简历。">
					<label class="ctrl_title">点击下述按钮，提交简历。</label> <input type="submit"
						name="submit" value="提交">
				</div>
			</form>

			<a href="w.jsp">
				<div id="bottom_info" style="display: block;">跳过此步骤</div>
			</a>
			<div id="bottom_jump">点击查看</div>
			<div id="logo">
				<div style="margin-bottom: 5px;"></div>
			</div>
		</div>
</body>
</html>