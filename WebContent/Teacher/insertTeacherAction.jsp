<!-- 2018-06-26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="teacher" class="service.Teacher"/> <!-- ��ü�������� teacher�� service.Teacher�� �ּҰ��� �Ҵ��մϴ�. -->
<jsp:setProperty name="teacher" property="*"/> <!-- insertTeacherForm.jsp���� �Է��� ���� teacher ��ü���������� �ּҰ��� ã�ư��� set �޼���鿡 ���� �����մϴ�. -->
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAction</title>
	</head>
	
	<body>
		<%
			TeacherDao t = new TeacherDao(); //TeacherDao data type���� t ��ü���������� �����ϰ� TeacherDao ������ �޼���� ��ü��(�ּҰ�) �����ϰ� �Ҵ��մϴ�.
			t.insertTeacher(teacher); //t ��ü���������� �ּҰ��� ã�ư��� insertTeacher �޼��带 teacher ��ü���������� �ּҰ��� �����Ͽ� ȣ���մϴ�.
		%>
	</body>
</html>