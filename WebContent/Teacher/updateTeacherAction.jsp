<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateTeacherAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			String name = request.getParameter("teacherName");
			int age = Integer.parseInt(request.getParameter("teacherAge"));
		
			Teacher t = new Teacher();
			t.setTeacherNo(no);
			t.setTeacherName(name);
			t.setTeacherAge(age);
			
			TeacherDao teacherDao = new TeacherDao();
			teacherDao.updateTeacher(t);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		%>
	</body>
</html>