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


<style type="text/css">
.job_window {
	width: 220px;
	height: 160px;
	border: 1px solid black;
}

.job_window span {
	font-size: 12px;
}

.job_window p {
	font-size: 12px;
}
</style>



</head>
<body>
	<%
		Job_Test job = new Job_Test();
		Dao dao = new Dao();
		ArrayList<Job_Test> list = dao.getAllJobs();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				job.setJob_name(list.get(i).getJob_name());
				job.setAbility01(list.get(i).getAbility01());
				job.setAbility02(list.get(i).getAbility02());
				job.setAbility03(list.get(i).getAbility03());
				job.setAbility04(list.get(i).getAbility04());
				job.setAbility05(list.get(i).getAbility05());
				job.setAbility06(list.get(i).getAbility06());
	%>

	<table>
		<tr>
			<td>
				<div class="job_window">
					<h3><%=job.getJob_name()%></h3>
					<hr>
					<div>
						<span>契合度:</span> <span>92%</span>
					</div>
					<p>
						能力需求:<%=job.getAbility01()%>,<%=job.getAbility02()%>,<%=job.getAbility03()%>...
					</p>
				</div>
			</td>
		</tr>
	</table>


	<%
			}
		}
		else{
			System.out.println("dao没有返回值！");
		}
	%>






	<table>
		<tr>
			<td>
				<div class="job_window">
					<h3>大数据工程师</h3>
					<hr>
					<div>
						<span>契合度:</span> <span>92%</span>
					</div>
					<p>能力需求:Hadoop,并发处理,hbase...</p>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>