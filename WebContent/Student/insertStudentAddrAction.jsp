<!-- 28�� ��ȣ�� 2018.7.3(ȭ����) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddrDao" %>	<!-- service ��Ű���� StudentAddrDao Ŭ���� ����Ʈ -->
<%@ page import="service.StudentAddr" %>	<!-- service ��Ű���� StudentAddr Ŭ���� ����Ʈ -->	
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