<!--2018.07.10 ¹Ú¿ø¿ì  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	EmployAddrDao eadao = new EmployAddrDao();
	eadao.deleteAddrEmploy(no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employList.jsp");
%>