<!--  2018-06-26 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao" %>
<%@ page import = "service.Teacher" %>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAction</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			Teacher teacher = new Teacher();
			teacher.setTeacherName(request.getParameter("teacherName"));
			teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
			
			TeacherDao teacherDao = new TeacherDao();
			teacherDao.insertTeacher(teacher);
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		%>
	</body>
</html>