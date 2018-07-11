<!--2018.07.10 ¹Ú¿ø¿ì  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int score = Integer.parseInt(request.getParameter("employScore"));
	System.out.println(no+"<--no : action");
	
	EmployScore employScore = new EmployScore();
	employScore.setScore(score);
	employScore.setEmployNo(no);
	
	EmployScoreDao esdao = new EmployScoreDao();
	esdao.insertEmployScore(employScore,no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employAndScoreList.jsp?no="+no);
%>