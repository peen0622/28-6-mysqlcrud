<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<h1>employListAboveAvg</h1>
		<%
			EmployScoreDao esdao = new EmployScoreDao();
			int scoreAvg = esdao.selectScoreAvg();
	
			ArrayList<EmployAndScore> list = new ArrayList<EmployAndScore>();
			list = esdao.selectEmployListAboveAvg();
		%>
		<div class = "col1"><a href="<%=request.getContextPath()%>/Employ/employAndScoreList.jsp">전체 점수 리스트</a></div>
		<div>평균 : <%=scoreAvg%></div>
		<table>
			<thead>
				<tr>
					<th>EMPLOY_NO</th>
					<th>EMPLOY_NAME</th>
					<th>EMPLOY_SCORE</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td class = "col1"><%=list.get(i).getEmploy().getEmployNo()%></td>
					<td class = "col1"><%=list.get(i).getEmploy().getEmployName()%></td>
					<td class = "col1"><%=list.get(i).getEmployScore().getScore()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</body>
</html>