<!-- 2018.06.26 박원우 -->
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
					<td>이름</td>
					<td><input type="text" name="memberName" size="20"></td>
				<tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="memberAge" size="20"></td>
				<tr>
				<tr>
					<td><input type="submit" value="회원등록"></td>
				</tr>
			</table>
		</form>
	</body>
</html>