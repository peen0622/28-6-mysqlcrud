<!-- 김호순 2018.7.10 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.StudentAndScore" %>
<%@ page import="service.StudentScoreDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>studentListAboveAvg</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
	<%@ include file = "/module/top.jsp" %>
		<h1>studentListAboveAvg</h1>
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
			
			StudentScoreDao studentScoreDao = new StudentScoreDao();
			int scoreAvg = studentScoreDao.selectScoreAvg();
			
			ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
			list = studentScoreDao.selectStudentListAboveAvg(currentPage, 5, word);
		%>
		<div class = "col1"><a href="<%= request.getContextPath() %>/Student/studentAndScoreList.jsp">전체 점수 리스트</a></div>
		<div>
			평균 : <%=scoreAvg%>
		</div>
		<table>
			<thead>
				<tr>
					<th>STUDENT_NO</th>
					<th>STUDENT_NAME</th>
					<th>STUDENT_SCORE</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<list.size(); i++) {
				%>
						<tr>
							<td class = "col1"><%=list.get(i).getStudent().getStudentNo()%></td>
							<td class = "col1"><%=list.get(i).getStudent().getStudentName()%></td>
							<td class = "col1"><%=list.get(i).getStudentScore().getScore()%></td>
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
					<a href="<%= request.getContextPath() %>/Student/studentListAboveAvg.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
			
				StudentAndScore studentAndScore= list.get(0);
				if(currentPage < studentAndScore.getStudent().getLastPage())	{
			%>
					<a href="<%= request.getContextPath() %>/Student/studentListAboveAvg.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
		<form action="<%= request.getContextPath() %>/Student/studentListAboveAvg.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="word">
				<button type="submit">검색</button>
			</div>
		</form>
	</body>
</html>