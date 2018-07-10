<!-- 28기 김호순 2018.7.9(월요일) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDao" %>	<!-- service 패키지내 StudentScoreDao 클래스 임포트 -->
<%@ page import="service.StudentScore" %>	<!-- service 패키지내 StudentScore 클래스 임포트 -->	
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insertStudentAction</title>
</head>
<body>
<%
int no = Integer.parseInt(request.getParameter("no"));
int studentScoreContent = Integer.parseInt(request.getParameter("studentScoreContent"));
System.out.println("no--->" + no);
System.out.println("studentScoreContent--->" + studentScoreContent);

StudentScore studentScore = new StudentScore();
studentScore.setStudent_no(no);
studentScore.setScore(studentScoreContent);

StudentScoreDao studentScoreDao = new StudentScoreDao();
studentScoreDao.insertStudentScore(studentScore, no);

response.sendRedirect(request.getContextPath()+"/Student/studentAndScoreList.jsp");
%>

</body>
</html>