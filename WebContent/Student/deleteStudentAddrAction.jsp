<!-- ��ȣ�� 2018.7.10 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="service.StudentAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>deleteTeacherAddrAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	//����ȯ�Ͽ� int(������) ����ŸŸ������ �Ҵ�
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			studentAddrDao.deleteStudentAddr(no);
			
			response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");	// ������ �л� ����Ʈ�� �̵�
		%>
	</body>
</html>