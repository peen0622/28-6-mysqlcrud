<!-- 2018.07.09 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberScore" %> 
<%@ page import = "service.MemberScoreDao" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int score = Integer.parseInt(request.getParameter("memberScore"));
	
	MemberScore memberScore = new MemberScore();
	memberScore.setScore(score);
	memberScore.setMemberNo(no);
	
	MemberScoreDao msdao = new MemberScoreDao();
	msdao.insertMemberScore(memberScore,no);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberAndScoreList.jsp?no="+no);
%>