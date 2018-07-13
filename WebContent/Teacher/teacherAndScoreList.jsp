<!-- 2018-07-09 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherScore"%>
<%@ page import="service.TeacherScoreDao"%>
<%@ page import="service.TeacherAndScore"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherAndScoreList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	
	<body>
		<%@ include file="/module/top.jsp" %><br>
		<table>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				request.setCharacterEncoding("euc-kr");
				int currentPage = 1; //���� ������
				
				if(request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				String word ="";
				if(request.getParameter("word") != null) {
					word = request.getParameter("word");
				}

				TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
				ArrayList<TeacherAndScore> list = teacherScoreDao.selectTeacherAndScore(currentPage, 5, word);
				
				for(int i=0; i<list.size(); i++) {
					TeacherAndScore teacherAndScore = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=teacherAndScore.getTeacher().getTeacherNo()%></td>
					<td class = "col1"><%=teacherAndScore.getTeacher().getTeacherName()%></td>
					<td class = "col1"><%=teacherAndScore.getTeacher().getTeacherAge()%></td>
					<td class = "col1"><%=teacherAndScore.getTeacherScore().getScore()%></td>
				</tr>
			<%
				}
			%>
		</table>
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="./teacherAndScoreList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				TeacherAndScore teacherAndScore = list.get(0);
				if(currentPage < teacherAndScore.getTeacher().getLastPage())	{
			%>
					<a href="./teacherAndScoreList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
		<form action="<%= request.getContextPath() %>/Teacher/teacherAndScoreList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="word">
				<button type="submit">�˻�</button>
			</div>
		</form>
	</body>
</html>