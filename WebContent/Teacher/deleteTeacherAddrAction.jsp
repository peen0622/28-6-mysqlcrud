<!-- 2018-07-09 이응빈 -->
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
			int no = Integer.parseInt(request.getParameter("no"));
			int Addrno = Integer.parseInt(request.getParameter("Addrno"));
			TeacherAddrDao t = new TeacherAddrDao();
			t.deleteTeacherAddr(Addrno);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherAddrList.jsp?no="+no);
		%>
	</body>
</html>