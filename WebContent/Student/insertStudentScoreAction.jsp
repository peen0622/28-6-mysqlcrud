<!-- 28�� ��ȣ�� 2018.7.9(������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDao" %>	<!-- service ��Ű���� StudentScoreDao Ŭ���� ����Ʈ -->
<%@ page import="service.StudentScore" %>	<!-- service ��Ű���� StudentScore Ŭ���� ����Ʈ -->	
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