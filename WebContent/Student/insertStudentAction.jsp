<!--  2018-06-26 ��ȣ�� -->
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
			
			StudentDao studentDao = new StudentDao(); //StudentDao data type���� studentDao ��ü���������� �����ϰ� StduentDao ������ �޼���� ��ü��(�ּҰ�) �����ϰ� �Ҵ��մϴ�.
			studentDao.insertStudent(student); //studentDao ��ü���������� �ּҰ��� ã�ư��� insertStudent �޼��带 student ��ü���������� �ּҰ��� �����Ͽ� ȣ���մϴ�.
			response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		%>
	</body>
</html>