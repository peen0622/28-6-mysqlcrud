<!-- 2018.07.09 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
%>
<form action="<%= request.getContextPath() %>/Member/insertMemberScoreAction.jsp?no=<%=no %>" method="post">
			<table border="1">
				<tr>
					<td>���� �Է�</td>
					<td><input type="text" name="memberScore" size="20"></td>
				<tr>
				<tr>
					<td><input type="submit" value="���� �Է�"></td>
				</tr>
			</table>
		</form>
</body>
</html>