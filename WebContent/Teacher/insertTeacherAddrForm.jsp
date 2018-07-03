<!-- 2018-07-03 이응빈 -->
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
		<!-- submit을 클릭하였을 때 post 방식으로  insertTeacherAction.jsp 이동 -->
			<table border="1">
				<tr>
					<td>주소 입력</td>
					<td><input type="text" name="teacherAddrContent" size="20"></td>
				</tr>
				<tr>
					<td><input type="submit" value="주소 입력"></td>
				</tr>
			</table>
		</form>
	</body>
</html>