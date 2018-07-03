<!-- ��ȣ�� 2018. 7. 2(������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/teachList.css">
	</head>
	<body>
		<table border="1">
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>�ּ� �Է�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				int currentPage = 1; //���� ������
				if(request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
				StudentDao StudentDao = new StudentDao();
				ArrayList<Student> list = StudentDao.selectStudentByPage(currentPage, 5);
				
				for(int i=0; i<list.size(); i++) {
					Student student = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=student.getStudentNo()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/studentAddrList.jsp?no=<%=student.getStudentNo()%>"><%=student.getStudentName()%></a></td>
					<td class = "col1"><%=student.getStudentAge()%></td>
					<td><a href="<%= request.getContextPath() %>/Student/insertStudentAddrForm.jsp?no=<%=student.getStudentNo()%>">�ּ� �Է�</a></td>
					<td><a href="<%= request.getContextPath() %>/Student/deleteMemberAction.jsp?no=<%=student.getStudentNo()%>">����</a></td>
					<td><a href="<%= request.getContextPath() %>/Student/updateMemberForm.jsp?no=<%=student.getStudentNo()%>">����</a></td>
				</tr>
				
			<%
				}
			%>
		</table>
		<form>
			<div>
				�̸� : 
				<input type="text" name="searchWord">
				<button type="button">�˻�</button>
			</div>
		</form>
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
	</body>
</html>