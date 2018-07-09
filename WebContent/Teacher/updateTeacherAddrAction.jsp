<!-- 2018-07-09 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.TeacherAddrDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateTeacherAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			String content = request.getParameter("teacherAddrContent");
		
			TeacherAddr t = new TeacherAddr();
			t.setTeacherAddrContent(content);
			t.setTeacherAddrNo(no);
			
			TeacherAddrDao teacherDao = new TeacherAddrDao();
			teacherDao.updateTeacherAddr(t);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherAddrList.jsp?no="+no);
		%>
	</body>
</html>