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
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	
	<body>
		<%@ include file="/module/top.jsp" %><br>
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
				
				String word ="";
				if(request.getParameter("word") != null) {
					word = request.getParameter("word");
				}
				
				TeacherDao teacherDao = new TeacherDao();
				ArrayList<Teacher> list = teacherDao.selectTeacherByPage(currentPage, 5, word);
				
				for(int i=0; i<list.size(); i++) {
					Teacher teacher = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=teacher.getTeacherNo()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/teacherAddrList.jsp?no=<%=teacher.getTeacherNo()%>"><%=teacher.getTeacherName()%></a></td>
					<td class = "col1"><%=teacher.getTeacherAge()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/insertTeacherAddrForm.jsp?no=<%=teacher.getTeacherNo()%>">�ּ� �Է�</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/insertTeacherScoreForm.jsp?no=<%=teacher.getTeacherNo()%>">���� �Է�</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/updateTeacherForm.jsp?no=<%=teacher.getTeacherNo()%>">����</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/deleteTeacherAction.jsp?no=<%=teacher.getTeacherNo()%>">����</a></td>
				</tr>
			<%
				}
			%>
		</table>
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
			
				Teacher teacher = list.get(0);
				if(currentPage < teacher.getLastPage())	{
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
		<form action="<%= request.getContextPath() %>/Teacher/teacherList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="word">
				<button type="submit">�˻�</button>
			</div>
		</form>
	</body>
</html>