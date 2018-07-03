<!-- 28기 김호순 2018.6.26(화) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insertStudentFrom</title>
</head>
<body>
	<form action = "<%= request.getContextPath() %>/Student/insertStudentAction.jsp" method = "post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="studentName" size="20">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="studentAge" size="20"></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>