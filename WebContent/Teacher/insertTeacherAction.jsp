<!-- 2018-06-26 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="teacher" class="service.Teacher"/> <!-- 객체참조변수 teacher에 service.Teacher의 주소값을 할당합니다. -->
<jsp:setProperty name="teacher" property="*"/> <!-- insertTeacherForm.jsp에서 입력한 값을 teacher 객체참조변수의 주소값을 찾아가서 set 메서드들에 값을 대입합니다. -->
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAction</title>
	</head>
	
	<body>
		<%
			TeacherDao t = new TeacherDao(); //TeacherDao data type으로 t 객체참조변수를 선언하고 TeacherDao 생성자 메서드로 객체를(주소값) 생성하고 할당합니다.
			t.insertTeacher(teacher); //t 객체참조변수의 주소값을 찾아가서 insertTeacher 메서드를 teacher 객체참조변수의 주소값을 대입하여 호출합니다.
		%>
	</body>
</html>