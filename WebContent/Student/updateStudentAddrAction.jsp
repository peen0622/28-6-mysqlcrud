<!-- 김호순 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="service.StudentAddrDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentAddrAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			String studentAddrContent = request.getParameter("studentAddrContent");
		
			StudentAddr studentAddr = new StudentAddr();
			studentAddr.setStudentAddrContent(studentAddrContent);
			studentAddr.setStudentAddrNo(no);
			
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			studentAddrDao.updateStudentAddr(studentAddr);
			
			response.sendRedirect(request.getContextPath()+"/Student/studentAddrList.jsp?no="+no);
		%>
	</body>
</html>