<!-- 2018-07-09 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.TeacherAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateTeacherAction</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int no = Integer.parseInt(request.getParameter("no"));
			int addrNo = Integer.parseInt(request.getParameter("addrNo"));
			String content = request.getParameter("teacherAddrContent");
		
			TeacherAddr teacherAddr = new TeacherAddr();
			teacherAddr.setTeacherAddrNo(addrNo);
			teacherAddr.setTeacherAddrContent(content);
			teacherAddr.setTeacherNo(no);
			
			TeacherAddrDao teacherDao = new TeacherAddrDao();
			teacherDao.updateTeacherAddr(teacherAddr);
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherAddrList.jsp?no="+no);
		%>
	</body>
</html>