<!-- ��ȣ�� 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="service.StudentAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentAddrForm</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	// ����ȯ �Ͽ�  ���������� �Ҵ�
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			StudentAddr studentAddr = studentAddrDao.updateStudentAddrForm(no);
		%>
		<form action="<%=request.getContextPath() %>/Student/updateStudentAddrAction.jsp?no=<%=no%>" method="post">
			<table border="1">
				<tr>
					<td>�ּ� �Է�</td>
					<td><input type="text" name="studentAddrContent" size="40" value="<%=studentAddr.getStudentAddrContent()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>