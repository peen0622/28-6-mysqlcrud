<!-- 2018-07-09 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.TeacherAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateTeacherAddrForm</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			TeacherAddr t = teacherAddrDao.updateTeacherAddrForm(no);
		%>
		<form action="<%=request.getContextPath() %>/Teacher/updateTeacherAddrAction.jsp?no=<%=no%>" method="post">
		<!-- submit�� Ŭ���Ͽ��� �� post �������  insertTeacherAction.jsp �̵� -->
			<table border="1">
				<tr>
					<td>�ּ� �Է�</td>
					<td><input type="text" name="teacherAddrContent" size="20" value="<%=t.getTeacherAddrContent()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>