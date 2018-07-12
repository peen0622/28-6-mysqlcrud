<!--2018.07.10 �ڿ���  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberListAboveAvg</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<h1>MemberListAboveAvg</h1>
		<div><h3><a href="<%= request.getContextPath() %>/index.jsp">HOME����..</a></h3></div>
		<%
			MemberScoreDao msdao = new MemberScoreDao();
			int scoreAvg = msdao.selectScoreAvg();
	
			ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
			list = msdao.selectMemberListAboveAvg();
		%>
		<div class = "col1"><a href="<%=request.getContextPath()%>/Member/memberAndScoreList.jsp">��ü ���� ����Ʈ</a></div>
		<div>��� :<%=scoreAvg%></div>
		<table>
			<thead>
				<tr>
					<th>MEMBER_NO</th>
					<th>MEMBER_NAME</th>
					<th>MEMBER_SCORE</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td class = "col1"><%=list.get(i).getMember().getMemberNo()%></td>
					<td class = "col1"><%=list.get(i).getMember().getMemberName()%></td>
					<td class = "col1"><%=list.get(i).getMemberScore().getScore()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</body>
</html>