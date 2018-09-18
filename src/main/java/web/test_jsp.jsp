<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="entity.Job_Test"%>
<%@ page import="dao.Dao"%>
<%@ page import="java.util.ArrayList"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>


</head>
<body>
	<%-- <%

Job_Test job = new Job_Test();
Dao dao = new Dao();
ArrayList<Job_Test> list = dao.getAllJobs();

if (list != null && list.size() > 0) {
	for (int i = 0; i < list.size(); i++) {
		job.setJob_name(list.get(i).getJob_name());
		System.out.println(job.getJob_name());
	}
}
else{
	System.out.println("获取数据错误!");



	
%>
<span>获取数据错误</span>
<%
}
%>
 --%>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".job_href2").click(function() {
				
				$.post("zuihou.jsp", {
					name : "job_name",
					data : 大数据工程师
				}, function(data, status) {
					alert("数据: \n" + data + "\n状态: " + status);
				}

				);
			});
		});
	</script>

	<div class="col-md-4 col-sm-6">
		<div class="project-item">
			<img src="img/1.jpg" alt="">
			<div class="project-hover">
				<div class="inside">
					<a href="zuihou.jsp?username=<%=job.get %>" target="_blank">点击了解更多</a>
					<h5>
						<a>大数据工程师</a>
					</h5>
					<p>薪水：null</p>
				</div>
			</div>
		</div>
	</div>


</body>
</html>