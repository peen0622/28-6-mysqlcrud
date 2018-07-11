<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%request.setCharacterEncoding("euc-kr");%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String employAddrContent = request.getParameter("employAddrContent");
	System.out.println(employAddrContent +" : 주소");
	System.out.println(no +" : 번호");

	EmployAddr ea = new EmployAddr();
	ea.setEmployAddrNo(no);
	ea.setEmployAddrContent(employAddrContent);
	
	EmployAddrDao eadao = new EmployAddrDao();
	eadao.updateAddrEmploy(ea,no);
	
	response.sendRedirect(request.getContextPath()+"/Employ/employAddrList.jsp?no="+no);
%>