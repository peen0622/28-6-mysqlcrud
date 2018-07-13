<!-- 28기 김호순 2018.7.9(월요일) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDao" %>	<!-- service 패키지내 StudentScoreDao 클래스 임포트 -->
<%@ page import="service.StudentScore" %>	<!-- service 패키지내 StudentScore 클래스 임포트 -->	
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertStudentScoreAction</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("euc-kr");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		StudentScore studentScore = new StudentScore();
		studentScore.setScore(Integer.parseInt(request.getParameter("score")));
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		studentScoreDao.insertStudentScore(studentScore, no);
		
		response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		%>

	</body>
</html>