<!--  2018-06-26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao" %>
<%@ page import = "service.Teacher" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAction</title>
	</head>
	
	<body>
		<%
			Teacher teacher = new Teacher();
			teacher.setTeacherName(request.getParameter("teacherName"));
			teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
			
			TeacherDao t = new TeacherDao(); //TeacherDao data type���� t ��ü���������� �����ϰ� TeacherDao ������ �޼���� ��ü��(�ּҰ�) �����ϰ� �Ҵ��մϴ�.
			t.insertTeacher(teacher); //t ��ü���������� �ּҰ��� ã�ư��� insertTeacher �޼��带 teacher ��ü���������� �ּҰ��� �����Ͽ� ȣ���մϴ�.
		%>
	</body>
</html>