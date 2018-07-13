<!-- 2018-07-09 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherScoreDao" %>
<%@ page import = "service.TeacherScore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherScoreAction</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int no = Integer.parseInt(request.getParameter("no"));
			
			TeacherScore teacherScore = new TeacherScore();
			teacherScore.setScore(Integer.parseInt(request.getParameter("score")));
			
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			teacherScoreDao.insertTeacherScore(teacherScore, no);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		%>
	</body>
</html>