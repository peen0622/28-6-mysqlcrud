<!-- 2018-07-03 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAddrForm</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
		%>
		<form action="<%=request.getContextPath() %>/Teacher/insertTeacherAddrAction.jsp?no=<%=no %>" method="post">
		<!-- submit�� Ŭ���Ͽ��� �� post �������  insertTeacherAction.jsp �̵� -->
			<table border="1">
				<tr>
					<td>�ּ� �Է�</td>
					<td><input type="text" name="teacherAddrContent" size="20"></td>
				</tr>
				<tr>
					<td><input type="submit" value="�ּ� �Է�"></td>
				</tr>
			</table>
		</form>
	</body>
</html>