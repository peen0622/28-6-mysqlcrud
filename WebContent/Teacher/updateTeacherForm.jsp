<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateTeacherForm</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			TeacherDao teacherDao = new TeacherDao();
			Teacher t = teacherDao.updateTeacherForm(no);
		%>
		<form action="<%=request.getContextPath() %>/Teacher/updateTeacherAction.jsp?no=<%=no %>" method="post">
		<!-- submit�� Ŭ���Ͽ��� �� post �������  insertTeacherAction.jsp �̵� -->
			<table border="1">
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="teacherName" size="20" value="<%=t.getTeacherName()%>"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="teacherAge" size="20" value="<%=t.getTeacherAge()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>