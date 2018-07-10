<!-- 2018-07-10 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>index</title>
	</head>
	<body>
		<h1>index</h1>
		<ul>
			<li><a href="<%= request.getContextPath() %>/Member/memberList.jsp">memberList</a></li>
			<li><a href="<%= request.getContextPath() %>/Student/studentList.jsp">studentList</a></li>
			<li><a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList</a></li>
			<li><a href="<%= request.getContextPath() %>/Employ/employList.jsp">employList</a></li>
		</ul>
		
		<ul>
			<li><a href="<%= request.getContextPath() %>/Member/memberListAboveAvg.jsp">memberListAboveAvg</a></li>
			<li><a href="<%= request.getContextPath() %>/Student/studentListAboveAvg.jsp">studentListAboveAvg</a></li>
			<li><a href="<%= request.getContextPath() %>/Teacher/teacherListAboveAvg.jsp">teacherListAboveAvg</a></li>
			<li><a href="<%= request.getContextPath() %>/Employ/employListAboveAvg.jsp">employListAboveAvg</a></li>
		</ul>
	</body>
</html>