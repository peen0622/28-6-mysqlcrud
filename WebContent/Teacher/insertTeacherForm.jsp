<!-- 2018-06-26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherForm</title>
	</head>
	
	<body>
		<form action="<%=request.getContextPath() %>/Teacher/insertTeacherAction.jsp" method="post">
		<!-- submit�� Ŭ���Ͽ��� �� post �������  insertTeacherAction.jsp �̵� -->
			<table border="1">
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="teacherName" size="20"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="teacherAge" size="20"></td>
				</tr>
				<tr>
					<td><input type="submit" value="ȸ������"></td>
				</tr>
			</table>
		</form>
	</body>
</html>