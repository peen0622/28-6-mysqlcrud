<!-- ��ȣ�� 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentAction</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int no = Integer.parseInt(request.getParameter("no"));	// ����ȯ �Ͽ� int ����Ÿ Ÿ������ �Ҵ�
			int age = Integer.parseInt(request.getParameter("studentAge"));
			String name = request.getParameter("studentName");
			
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