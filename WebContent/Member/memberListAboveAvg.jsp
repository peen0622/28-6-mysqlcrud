<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
</head>
<body>
	<h1>memberListAboveAvg</h1>
	<%
		MemberScoreDao msdao = new MemberScoreDao();
		int scoreAvg = msdao.selectScoreAvg();
		
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
		list = msdao.selectMemberListAboveAvg();
	%>
	
	<h3><a href="<%= request.getContextPath() %>/Member/memberAndScoreList.jsp">SCORE LIST -></a></h3>
				
	<div>
		<h4>평균 : <%=scoreAvg %></h4>
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>MEMBER_NO</th>
				<th>MEMBER_NAME</th>
				<th>MEMBER_SCORE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<list.size(); i++){
			%>
					<tr>
						<td><%=list.get(i).getMember().getMemberNo() %></td>
						<td><%=list.get(i).getMember().getMemberName() %></td>
						<td><%=list.get(i).getMemberScore().getScore() %></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</body>
</html>