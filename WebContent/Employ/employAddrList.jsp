<!-- 2018-07-04 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.EmployAddr"%>
<%@ page import="service.EmployAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>employList</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<table border="1">
			<tr>
				<th>�ּ�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				int no = Integer.parseInt(request.getParameter("no"));
				System.out.println(no + "<--no : form");
	
				EmployAddrDao ead = new EmployAddrDao();
				EmployAddr ea = ead.selectEmployAddr(no);
			%>
			<tr>
				<td class="col1"><%=ea.getEmployAddrContent()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/deleteAddrEmploy.jsp?no=<%=no%>">����</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/updateAddrEmployForm.jsp?no=<%=no%>">����</a></td>
			</tr>
		</table>
	</body>
</html>