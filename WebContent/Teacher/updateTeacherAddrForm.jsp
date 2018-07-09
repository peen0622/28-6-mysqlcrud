<!-- 2018-07-09 이응빈 -->
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
		<!-- submit을 클릭하였을 때 post 방식으로  insertTeacherAction.jsp 이동 -->
			<table border="1">
				<tr>
					<td>주소 입력</td>
					<td><input type="text" name="teacherAddrContent" size="20" value="<%=t.getTeacherAddrContent()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>