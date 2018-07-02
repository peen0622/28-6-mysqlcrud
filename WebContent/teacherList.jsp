<!-- 2018-07-02 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherList</title>
		<link rel = "stylesheet" type = "text/css" href = "./css/teachList.css">
	</head>
	<body>
		<table border="1">
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
				TeacherDao teacherDao = new TeacherDao();
				ArrayList<Teacher> list = teacherDao.selectTeacherByPage(currentPage, 5);
				
				for(int i=0; i<list.size(); i++) {
					Teacher teacher = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=teacher.getTeacherNo()%></td>
					<td class = "col1"><%=teacher.getTeacherName()%></td>
					<td class = "col1"><%=teacher.getTeacherAge()%></td>
				</tr>
				
			<%
				}
			%>
		</table>
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./teacherList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				Teacher teacher = list.get(0);
				if(currentPage < teacher.getLastPage())	{
			%>
					<a href="./teacherList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
	</body>
</html>