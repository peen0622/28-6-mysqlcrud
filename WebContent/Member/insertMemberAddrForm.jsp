<!-- 2018-07-03 박원우 -->
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
System.out.println(no+"<--no : form");
%>
<form action="<%= request.getContextPath() %>/Member/insertMemberAddrAction.jsp?no=<%=no %>" method="post">
			<table border="1">
				<tr>
					<td>주소 입력</td>
					<td><input type="text" name="memberAddrContent" size="20"></td>
				<tr>
				<tr>
					<td><input type="submit" value="주소 입력"></td>
				</tr>
			</table>
		</form>
</body>
</html>