<!--  2018-07-03 ������ -->
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
			
			TeacherAddrDao t = new TeacherAddrDao(); //TeacherDao data type���� t ��ü���������� �����ϰ� TeacherDao ������ �޼���� ��ü��(�ּҰ�) �����ϰ� �Ҵ��մϴ�.
			t.insertTeacherAddr(teacherAddr, no); //t ��ü���������� �ּҰ��� ã�ư��� insertTeacher �޼��带 teacher ��ü���������� �ּҰ��� �����Ͽ� ȣ���մϴ�.
			
			response.sendRedirect(request.getContextPath()+"/Teacher/teacherList.jsp");
		%>
	</body>
</html>