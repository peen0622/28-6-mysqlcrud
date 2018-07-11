<!-- 김호순 2018.7.9(월) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.StudentScoreDao"%>
<%@ page import="service.StudentAndScore"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentScore"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>studentAndScorerList</title>
<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
</head>
<body>
	<table border="1">
		<tr>
			<th>학생번호</th>
			<th>학생이름</th>
			<th>학생나이</th>
			<th>학생점수</th>
		</tr>
		<%
			request.setCharacterEncoding("euc-kr");
			StudentScoreDao studentScoreDao = new StudentScoreDao();
			ArrayList<StudentAndScore> list = studentScoreDao.selectStudentAndScore();
			
			for(int i=0; i<list.size(); i++) {
				StudentAndScore studentAndScore = list.get(i);
		%>
	<tr>
		<td class="col1"><%=studentAndScore.getStudent().getStudentNo()%></td>
		<td class="col1"><%=studentAndScore.getStudent().getStudentName()%></td>
		<td class="col1"><%=studentAndScore.getStudent().getStudentAge()%></td>
		<td class="col1"><%=studentAndScore.getStudentScore().getScore()%></td>
	</tr>
		<%
			}
		%>
	</table>
</body>
</html>