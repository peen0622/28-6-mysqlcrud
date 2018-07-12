<!-- 2018.07.09 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="service.MemberAddrDao"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int addrno = Integer.parseInt(request.getParameter("addrno"));
	
	MemberAddrDao mdao = new MemberAddrDao();
	mdao.deleteAddrMember(addrno);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberAddrList.jsp?no="+no);
%>