<!-- 2018-07-04 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int no = Integer.parseInt(request.getParameter("no"));

EmployDao edao = new EmployDao();
edao.deleteEmploy(no);

response.sendRedirect(request.getContextPath()+"/Employ/employList.jsp");
%>
</body>
</html>