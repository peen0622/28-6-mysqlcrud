<!--  2018-06-26 김호순 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAction</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			Student student = new Student();
			student.setStudentName(request.getParameter("studentName"));
			student.setStudentAge(Integer.parseInt(request.getParameter("studentAge")));
			
			StudentDao studentDao = new StudentDao(); //StudentDao data type으로 studentDao 객체참조변수를 선언하고 StduentDao 생성자 메서드로 객체를(주소값) 생성하고 할당합니다.
			studentDao.insertStudent(student); //studentDao 객체참조변수의 주소값을 찾아가서 insertStudent 메서드를 student 객체참조변수의 주소값을 대입하여 호출합니다.
			response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		%>
	</body>
</html>