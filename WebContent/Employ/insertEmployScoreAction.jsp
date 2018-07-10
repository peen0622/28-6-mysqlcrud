<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %> 
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
	int score = Integer.parseInt(request.getParameter("employScore"));
	System.out.println(no+"<--no : action");
	
	EmployScore employScore = new EmployScore();
	employScore.setScore(score);
	employScore.setEmployNo(no);
	
	EmployScoreDao esdao = new EmployScoreDao();
	esdao.insertEmployScore(employScore,no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employAndScoreList.jsp?no="+no);
%>
</body>
</html>