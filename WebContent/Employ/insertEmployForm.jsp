<!-- 2018.06.26 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertEmployForm</title>
	</head>
	<body>
		<form action="<%= request.getContextPath() %>/Employ/insertEmployAction.jsp" method="post">
			<table>
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="employName" size="20"></td>
				<tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="employAge" size="20"></td>
				<tr>
				<tr>
					<td><input type="submit" value="ȸ�����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>