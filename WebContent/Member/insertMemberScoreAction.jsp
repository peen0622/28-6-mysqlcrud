<!-- 2018.07.09 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScore" %> 
<%@ page import = "service.MemberScoreDao" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int score = Integer.parseInt(request.getParameter("memberScore"));
	System.out.println(no+"<--no : action");
	
	MemberScore memberScore = new MemberScore();
	memberScore.setScore(score);
	memberScore.setMemberNo(no);
	
	MemberScoreDao msdao = new MemberScoreDao();
	msdao.insertMemberScore(memberScore,no);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberAndScoreList.jsp?no="+no);
%>
</body>
</html>