<!-- 2018-07-08 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateTeacherAction</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int no = Integer.parseInt(request.getParameter("no"));
			int age = Integer.parseInt(request.getParameter("teacherAge"));
			String name = request.getParameter("teacherName");
			
		
			Teacher teacher = new Teacher();
			teacher.setTeacherNo(no);
			teacher.setTeacherName(name);
			teacher.setTeacherAge(age);
			
			TeacherDao teacherDao = new TeacherDao();
			teacherDao.updateTeacher(teacher);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		%>
	</body>
</html>