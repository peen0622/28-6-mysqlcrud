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
				<td>학생번호</td>
				<td>학생이름</td>
				<td>점수</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<list.size(); i++){
					
			%>
					<tr>
						<td><%=list.get(i).getStudent().getStudentNo() %></td>
						<td><%=list.get(i).getStudent().getStudentName() %></td>
						<td><%=list.get(i).getStudentScore().getScore() %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>