<!-- ��ȣ�� 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentForm</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			StudentDao studentDao = new StudentDao();
			Student student = studentDao.updateStudentForm(no);
		%>
		<form action="<%=request.getContextPath() %>/Student/updateStudentAction.jsp?no=<%=no %>" method="post">
		<!-- submit�� Ŭ���Ͽ��� �� post �������  insertTeacherAction.jsp �̵� -->
			<table border="1">
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="studentName" size="20" value="<%=student.getStudentName()%>"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="studentAge" size="20" value="<%=student.getStudentAge()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>