<!-- 2018.07.09 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="service.MemberAddrDao"%>
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
	String memberAddrContent = request.getParameter("memberAddrContent");
	System.out.println(memberAddrContent +" : �ּ�");
	System.out.println(no +" : ��ȣ");

	MemberAddr ma = new MemberAddr();
	ma.setMemberAddrNo(no);
	ma.setMemberAddrContent(memberAddrContent);
	
	MemberAddrDao madao = new MemberAddrDao();
	madao.updateAddrMember(ma,no);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberAddrList.jsp?no="+no);
%>
</body>
</html>