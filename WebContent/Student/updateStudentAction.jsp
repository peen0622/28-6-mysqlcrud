<!-- ��ȣ�� 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	// ����ȯ �Ͽ� int ����Ÿ Ÿ������ �Ҵ�
			String name = request.getParameter("studentName");
			
			int age = Integer.parseInt(request.getParameter("studentAge"));
		
			Student student = new Student();
			student.setStudentNo(no);
			student.setStudentName(name);
			student.setStudentAge(age);
			
			StudentDao studentDao = new StudentDao();
			studentDao.updateStudent(student);
			
			response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		%>
	</body>
</html>