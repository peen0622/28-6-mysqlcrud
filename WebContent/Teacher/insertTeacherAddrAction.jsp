<!--  2018-07-03 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherAddrDao" %>
<%@ page import = "service.TeacherAddr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAddrAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			TeacherAddr teacherAddr = new TeacherAddr();
			teacherAddr.setTeacherAddrContent(request.getParameter("teacherAddrContent"));
			
			TeacherAddrDao t = new TeacherAddrDao(); //TeacherDao data type으로 t 객체참조변수를 선언하고 TeacherDao 생성자 메서드로 객체를(주소값) 생성하고 할당합니다.
			t.insertTeacherAddr(teacherAddr, no); //t 객체참조변수의 주소값을 찾아가서 insertTeacher 메서드를 teacher 객체참조변수의 주소값을 대입하여 호출합니다.
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		%>
	</body>
</html>