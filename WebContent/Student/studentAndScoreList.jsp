<!-- ��ȣ�� 2018.7.9(��) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentScore"%>
<%@ page import="service.StudentScoreDao"%>
<%@ page import="service.StudentAndScore"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>studentAndScorerList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
	<%@ include file = "/module/top.jsp" %><br>
		<table border="1">
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

				StudentScoreDao studentScoreDao = new StudentScoreDao();
				ArrayList<StudentAndScore> list = studentScoreDao.selectStudentAndScore(currentPage, 5, word);
				
				for(int i=0; i<list.size(); i++) {
					StudentAndScore studentAndScore = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=studentAndScore.getStudent().getStudentNo()%></td>
					<td class = "col1"><%=studentAndScore.getStudent().getStudentName()%></td>
					<td class = "col1"><%=studentAndScore.getStudent().getStudentAge()%></td>
					<td class = "col1"><%=studentAndScore.getStudentScore().getScore()%></td>
				</tr>
			<%
				}
			%>
		</table>
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/Student/studentAndScoreList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				StudentAndScore studentAndScore = list.get(0);
				if(currentPage < studentAndScore.getStudent().getLastPage())	{
			%>
					<a href="<%= request.getContextPath() %>/Student/studentAndScoreList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
		<form action="<%= request.getContextPath() %>/Student/studentAndScoreList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="word">
				<button type="submit">�˻�</button>
			</div>
		</form>
	</body>
</html>