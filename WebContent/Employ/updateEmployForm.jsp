<!-- 2018-07-03 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<!DOCTYPE htm>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			
			EmployDao edao = new EmployDao();
			Employ e = edao.updateEmployForm(no);
		%>
		<form action="<%= request.getContextPath() %>/Employ/updateEmployAction.jsp?no=<%=no %>" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="employName" size="20" value="<%=e.getEmployName()%>"></td>
				<tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="employAge" size="20" value="<%=e.getEmployAge()%>"></td>
				<tr>
				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>