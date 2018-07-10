<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int no = Integer.parseInt(request.getParameter("no"));

EmployAddrDao edao = new EmployAddrDao();
EmployAddr ea = edao.updateAddrEmployForm(no);
%>
<form action="<%= request.getContextPath() %>/Employ/updateAddrEmployAction.jsp?no=<%=no %>" method="post">
	<table border="1">
		<tr>
			<td>주소</td>
			<td><input type="text" name="employAddrContent" size="20" value="<%=ea.getEmployAddrContent()%>"></td>
		<tr>
			<td><input type="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>