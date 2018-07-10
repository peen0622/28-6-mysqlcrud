<!-- 2018-07-09 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherScore"%>
<%@ page import="service.TeacherAndScore"%>
<%@ page import="service.TeacherScoreDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherAndScoreList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	
	<body>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>점수</th>
			</tr>
			<%
				request.setCharacterEncoding("euc-kr");

				TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
				ArrayList<TeacherAndScore> list = teacherScoreDao.selectTeacherAndScored();
				
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
	</body>
</html>