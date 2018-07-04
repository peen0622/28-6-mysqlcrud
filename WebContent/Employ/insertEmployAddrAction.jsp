<!-- 2018-07-04 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployAddr" %> 
<%@ page import = "service.EmployAddrDao" %> 
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
	String addr = request.getParameter("employAddrContent");
	System.out.println(no+"<--no : action");
	
	EmployAddr ea = new EmployAddr();
	ea.setEmployAddrContent(addr);
	
	EmployAddrDao ead = new EmployAddrDao();
	ead.insertEmployAddr(ea,no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employList.jsp");
%>
</body>
</html>