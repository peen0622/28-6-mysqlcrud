<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>점수</th>
				<th>메인 화면</th>
			</tr>
			<%
				EmployScoreDao esdao = new EmployScoreDao();
				ArrayList<EmployAndScore> list = esdao.selectEmployAndScored();
	
				for (int i = 0; i < list.size(); i++) {
					EmployAndScore eas = list.get(i);
			%>
			<tr>
				<td class="col1"><%=eas.getEmploy().getEmployNo()%></td>
				<td class="col1"><%=eas.getEmploy().getEmployName()%></td>
				<td class="col1"><%=eas.getEmploy().getEmployAge()%></td>
				<td class="col1"><%=eas.getEmployScore().getScore()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/index.jsp">메인 화면</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>