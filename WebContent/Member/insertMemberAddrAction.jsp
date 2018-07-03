<!-- 2018-07-03 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAddr" %> 
<%@ page import = "service.MemberAddrDao" %> 
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
	String addr = request.getParameter("memberAddrContent");
	System.out.println(no+"<--no : action");
	
	MemberAddr ma = new MemberAddr();
	ma.setMemberAddrContent(addr);
	
	MemberAddrDao mad = new MemberAddrDao();
	mad.insertMemberAddr(ma,no);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>
</body>
</html>