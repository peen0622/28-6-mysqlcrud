<!-- ��ȣ�� 2018.7.10 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="service.StudentAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>deleteStudentAddrAction</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	//����ȯ�Ͽ� int(������) ����ŸŸ������ �Ҵ�
			int addrNo = Integer.parseInt(request.getParameter("addrNo"));
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			studentAddrDao.deleteStudentAddr(addrNo);
	
			response.sendRedirect(request.getContextPath()+"/Student/studentAddrList.jsp?no="+no);	// ������ �л� ����Ʈ�� �̵�
		%>
	</body>
</html>