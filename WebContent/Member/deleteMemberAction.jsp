<!-- 2018-07-03 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	MemberDao mdao = new MemberDao();
	mdao.deleteMember(no);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>