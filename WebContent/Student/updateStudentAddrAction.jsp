<!-- 김호순 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="service.StudentAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentAddrAction</title>
	</head>
	
	<body>
		<%
		request.setCharacterEncoding("euc-kr");
		
		int no = Integer.parseInt(request.getParameter("no"));
		int addrNo = Integer.parseInt(request.getParameter("addrNo"));
		String content = request.getParameter("studentAddrContent");
	
		StudentAddr studentAddr = new StudentAddr();
		studentAddr.setStudentAddrNo(addrNo);
		studentAddr.setStudentAddrContent(content);
		studentAddr.setStudentNo(no);
		
		StudentAddrDao studentDao = new StudentAddrDao();
		studentDao.updateStudentAddr(studentAddr);
		
		response.sendRedirect(request.getContextPath()+"/Student/studentAddrList.jsp?no="+no);
		%>
	</body>
</html>