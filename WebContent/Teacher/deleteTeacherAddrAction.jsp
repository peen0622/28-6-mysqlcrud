<!-- 2018-07-09 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.TeacherAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>deleteTeacherAddrAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no")); //teacher_addr ���̺��� teacher_no
			int addrNo = Integer.parseInt(request.getParameter("addrNo")); ////teacher_addr ���̺��� teacher_addr_no
			TeacherAddrDao teacherDao = new TeacherAddrDao();
			teacherDao.deleteTeacherAddr(addrNo);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherAddrList.jsp?no="+no);
		%>
	</body>
</html>