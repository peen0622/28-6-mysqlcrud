<!--2018.07.10 �ڿ���  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
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
	String employAddrContent = request.getParameter("employAddrContent");
	System.out.println(employAddrContent +" : �ּ�");
	System.out.println(no +" : ��ȣ");

	EmployAddr ea = new EmployAddr();
	ea.setEmployAddrNo(no);
	ea.setEmployAddrContent(employAddrContent);
	
	EmployAddrDao eadao = new EmployAddrDao();
	eadao.updateAddrEmploy(ea,no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employAddrList.jsp?no="+no);
%>
</body>
</html>