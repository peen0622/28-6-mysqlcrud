<!-- 28�� ��ȣ�� 2018.7.9(������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDao" %>	<!-- service ��Ű���� StudentScoreDao Ŭ���� ����Ʈ -->
<%@ page import="service.StudentScore" %>	<!-- service ��Ű���� StudentScore Ŭ���� ����Ʈ -->	
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