<!-- 2018-07-10 ��ȣ�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>deleteStudentAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	//����ȯ�Ͽ� int(������) ����ŸŸ������ �Ҵ�
			StudentDao studentDao = new StudentDao();
			studentDao.deleteStudent(no);
			
			response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		%>
	</body>
</html>