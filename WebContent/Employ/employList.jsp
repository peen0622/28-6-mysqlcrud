<!-- 2018-07-02 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>employList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<table>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
			</tr>
			<%
				int currentPage = 1; //���� ������
				if(request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
				EmployDao employDao = new EmployDao();
				ArrayList<Employ> list = employDao.selectEmployByPage(currentPage, 10);
				
				for(int i=0; i<list.size(); i++) {
					Employ employ = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=employ.getEmployNo()%></td>
					<td class = "col1"><%=employ.getEmployName()%></td>
					<td class = "col1"><%=employ.getEmployAge()%></td>
				</tr>
				
			<%
				}
			%>
		</table>
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./employList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				Employ employ = list.get(0);
				if(currentPage < employ.getLastPage())	{
			%>
					<a href="./employList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
	</body>
</html>