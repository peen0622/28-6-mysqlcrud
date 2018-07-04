<!-- 2018-07-04 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<%request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("employName");
	int age = Integer.parseInt(request.getParameter("employAge"));

	Employ e = new Employ();
	e.setEmployNo(no);
	e.setEmployName(name);
	e.setEmployAge(age);
	
	EmployDao ea = new EmployDao();
	ea.updateEmploy(e);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employList.jsp");

%>
</body>
</html>