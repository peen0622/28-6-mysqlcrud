<!-- 2018-07-09 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherScoreDao" %>
<%@ page import = "service.TeacherScore" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherScoreAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			TeacherScore teacherScore = new TeacherScore();
			teacherScore.setScore(Integer.parseInt(request.getParameter("score")));
			
			TeacherScoreDao t = new TeacherScoreDao();
			t.insertTeacherScore(teacherScore, no);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherAndScoreList.jsp?no="+no);
		%>
	</body>
</html>