<!-- 2018-07-03 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAddr" %> 
<%@ page import = "service.MemberAddrDao" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String addr = request.getParameter("memberAddrContent");
	
	MemberAddr ma = new MemberAddr();
	ma.setMemberAddrContent(addr);
	
	MemberAddrDao mad = new MemberAddrDao();
	mad.insertMemberAddr(ma,no);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>