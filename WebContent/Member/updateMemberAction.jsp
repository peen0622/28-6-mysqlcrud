<!-- 2018-07-03 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
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
	String name = request.getParameter("memberName");
	int age = Integer.parseInt(request.getParameter("memberAge"));

	Member m = new Member();
	m.setMemberNo(no);
	m.setMemberName(name);
	m.setMemberAge(age);
	
	MemberDao ma = new MemberDao();
	ma.updateMember(m);
%>
</body>
</html>