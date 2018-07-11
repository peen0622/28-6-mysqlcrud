<!-- 김호순 2018.7.10 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentScoreDao" %>
<%@ page import="service.StudentAndScore" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
</head>
<body>
	<h1>studentListAboveAvg</h1>
	<%
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		int scoreAvg = studentScoreDao.selectScoreAvg();
		
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		list = studentScoreDao.selectStudentListAboveAvg();
	%>
	<div>
		평균 : <%=scoreAvg %>
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>학생번호</th>
				<th>학생이름</th>
				<th>점수</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<list.size(); i++){
					
			%>
					<tr>
						<td class="col1"><%=list.get(i).getStudent().getStudentNo() %></td>
						<td class="col1"><%=list.get(i).getStudent().getStudentName() %></td>
						<td class="col1"><%=list.get(i).getStudentScore().getScore() %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>