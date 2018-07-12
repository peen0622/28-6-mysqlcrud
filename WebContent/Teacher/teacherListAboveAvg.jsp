<!-- 2018-07-10 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherListAboveAvg</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	
	<body>
		<h1>teacherListAboveAvg</h1>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int currentPage = 1; //현재 페이지
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			String word ="";
			if(request.getParameter("word") != null) {
				word = request.getParameter("word");
			}
			
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			int scoreAvg = teacherScoreDao.selectScoreAvg();
			
			ArrayList<TeacherAndScore> list = new ArrayList<TeacherAndScore>();
			list = teacherScoreDao.selectTeacherListAboveAvg(currentPage, 10, word);
		%>
		<div class = "col1"><a href="<%= request.getContextPath() %>/Teacher/teacherAndScoreList.jsp">전체 점수 리스트</a></div>
		<div>
			평균 : <%=scoreAvg%>
		</div>
		<table>
			<thead>
				<tr>
					<th>TEACHER_NO</th>
					<th>TEACHER_NAME</th>
					<th>TEACHER_SCORE</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<list.size(); i++) {
				%>
						<tr>
							<td class = "col1"><%=list.get(i).getTeacher().getTeacherNo()%></td>
							<td class = "col1"><%=list.get(i).getTeacher().getTeacherName()%></td>
							<td class = "col1"><%=list.get(i).getTeacherScore().getScore()%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="./teacherListAboveAvg.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
				TeacherAndScore teacherAndScore= list.get(0);
				if(currentPage < teacherAndScore.getTeacher().getLastPage())	{
			%>
					<a href="./teacherListAboveAvg.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
		<form action="<%= request.getContextPath() %>/Teacher/teacherListAboveAvg.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="word">
				<button type="submit">검색</button>
			</div>
		</form>
	</body>
</html>