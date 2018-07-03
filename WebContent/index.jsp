<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>index.jsp</h1>
	<ul>
		<li><a href="<%= request.getContextPath() %>/Member/memberList.jsp">memberList</a></li>
		<li><a href="<%= request.getContextPath() %>/Student/studentList.jsp">studentList</a></li>
		<li><a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList</a></li>
		<li><a href="<%= request.getContextPath() %>/Employ/employList.jsp">employList</a></li>
	</ul>
</body>
</html>