<!-- 2018-06-26 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherForm</title>
	</head>
	
	<body>
		<form action="<%=request.getContextPath() %>/Teacher/insertTeacherAction.jsp" method="post">
		<!-- submit을 클릭하였을 때 post 방식으로  insertTeacherAction.jsp 이동 -->
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="teacherName" size="20"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="teacherAge" size="20"></td>
				</tr>
				<tr>
					<td><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</body>
</html>