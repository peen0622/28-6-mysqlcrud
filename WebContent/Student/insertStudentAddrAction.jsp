<!-- 28기 김호순 2018.7.3(화요일) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddrDao" %>	<!-- service 패키지내 StudentAddrDao 클래스 임포트 -->
<%@ page import="service.StudentAddr" %>	<!-- service 패키지내 StudentAddr 클래스 임포트 -->	
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertStudentAction</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("euc-kr");
		int no = Integer.parseInt(request.getParameter("no"));
		StudentAddr studentAddr = new StudentAddr();
		studentAddr.setStudentAddrContent(request.getParameter("studentAddrContent"));
		
		StudentAddrDao studentAddrDao = new StudentAddrDao();
		studentAddrDao.insertStudentAddr(studentAddr, no);
		
		response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		%>
	
	</body>
</html>