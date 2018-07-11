<!-- 2018-07-04 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	EmployDao edao = new EmployDao();
	edao.deleteEmploy(no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employList.jsp");
%>