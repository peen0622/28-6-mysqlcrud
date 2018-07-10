<!-- ��ȣ�� 2018. 7. 9(��) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>studentList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
	
		<table>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>�ּ� �Է�</th>
				<th>���� �Է�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				request.setCharacterEncoding("euc-kr");
				int currentPage = 1; //���� ������
				if(request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
				String word = "";
				if(request.getParameter("word") != null) { //�޾� ���� word�� ���� null�� �ƴ� �� ����˴ϴ�.
					word = request.getParameter("word"); //String word�� ����ȯ �Ͽ� �����մϴ�.
				}
				StudentDao studentDao = new StudentDao();
				ArrayList<Student> list = studentDao.selectStudentByPage(currentPage, 5, word);
				
				for(int i=0; i<list.size(); i++) {
					Student student = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=student.getStudentNo()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/studentAddrList.jsp?no=<%=student.getStudentNo()%>"><%=student.getStudentName()%></a></td>
					<td class = "col1"><%=student.getStudentAge()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/insertStudentAddrForm.jsp?no=<%=student.getStudentNo()%>">�ּ� �Է�</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/insertStudentScoreForm.jsp?no=<%=student.getStudentNo()%>">�����Է�</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/deleteStudentAction.jsp?no=<%=student.getStudentNo()%>">����</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/updateStudentForm.jsp?no=<%=student.getStudentNo()%>">����</a></td>
				</tr>
			<%
				}
			%>
		</table>
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./studentList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				Student student = list.get(0);
				if(currentPage < student.getLastPage())	{
			%>
					<a href="./studentList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
		<form action = "<%= request.getContextPath() %>/Student/studentList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="word">
				<button type="submit">�˻�</button>
			</div>
		</form>
	</body>
</html>