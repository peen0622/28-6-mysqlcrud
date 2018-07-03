<!-- 2018-07-03 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int no = Integer.parseInt(request.getParameter("no"));

MemberDao mdao = new MemberDao();
mdao.deleteMember(no);

response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>
</body>
</html>