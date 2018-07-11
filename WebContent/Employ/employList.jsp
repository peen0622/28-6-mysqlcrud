<!--2018.07.10 �ڿ���  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>employList</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<table>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>�ּ��Է�</th>
				<th>�����Է�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				request.setCharacterEncoding("euc_kr");
				int currentPage = 1; //���� ������
				if (request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
	
				String word = "";
				if (request.getParameter("word") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					word = request.getParameter("word"); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
	
				EmployDao employDao = new EmployDao();
				ArrayList<Employ> list = employDao.selectEmployByPage(currentPage, 10, word);
	
				for (int i = 0; i < list.size(); i++) {
					Employ employ = list.get(i);
			%>
			<tr>
				<td class="col1"><%=employ.getEmployNo()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/employAddrList.jsp?no=<%=employ.getEmployNo()%>"><%=employ.getEmployName()%></a></td>
				<td class="col1"><%=employ.getEmployAge()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/insertEmployAddrForm.jsp?no=<%=employ.getEmployNo()%>">�ּ��Է�</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/insertEmployScoreForm.jsp?no=<%=employ.getEmployNo()%>">�����Է�</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/deleteEmployAction.jsp?no=<%=employ.getEmployNo()%>">����</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/updateEmployForm.jsp?no=<%=employ.getEmployNo()%>">����</a></td>
			</tr>
			<%
				}
			%>
		</table>
	
		<form action="<%=request.getContextPath()%>/Employ/employList.jsp"
			method="post">
			<div>
				�̸� : <input type="text" name="word">
				<button type="submit">�˻�</button>
			</div>
		</form>
	
		<div class="col1">
			<%
				if (currentPage > 1) {
			%>
			<a href="./employList.jsp?currentPage=<%=currentPage - 1%>">������</a>
			<%
				}
				Employ employ = list.get(0);
				if (currentPage < employ.getLastPage()) {
			%>
			<a href="./employList.jsp?currentPage=<%=currentPage + 1%>">������</a>
			<%
				}
			%>
		</div>
	</body>
</html>