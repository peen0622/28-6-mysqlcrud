<!-- 2018.06.26 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertmemberForm</title>
	</head>
	<body>
		<form
			action="<%=request.getContextPath()%>/Member/insertMemberAction.jsp"
			method="post">
			<table border="1">
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="memberName" size="20"></td>
				<tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="memberAge" size="20"></td>
				<tr>
				<tr>
					<td><input type="submit" value="ȸ�����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>