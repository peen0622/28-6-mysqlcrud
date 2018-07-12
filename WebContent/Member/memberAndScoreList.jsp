<!-- 2018.07.09 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberScore"%>
<%@ page import="service.MemberScoreDao"%>
<%@ page import="service.MemberAndScore"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberAndScoreList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<h1>MemberAndScoreList</h1>
		<div><h3><a href="<%= request.getContextPath() %>/index.jsp">HOME으로..</a></h3></div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>점수</th>
			</tr>
			<%	
				request.setCharacterEncoding("euc-kr");
				int currentPage = 1; //현재 페이지
				if(request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
				}
				
				String word = "";
				if(request.getParameter("word") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					word =request.getParameter("word"); //String currentPage를 형변환 하여 대입합니다.
				}
				
				MemberScoreDao msdao = new MemberScoreDao();
				ArrayList<MemberAndScore> list = msdao.selectMemberAndScored(currentPage, 10, word);
				
				for(int i=0; i<list.size(); i++){
					MemberAndScore mas = list.get(i);
			%>
			<tr>
				<td class = "col1"><%=mas.getMember().getMemberNo()%></td>
				<td class = "col1"><%=mas.getMember().getMemberName()%></td>
				<td class = "col1"><%=mas.getMember().getMemberAge()%></td>
				<td class = "col1"><%=mas.getMemberScore().getScore()%></td>
			</tr>
			<%
				}
			%>
		</table>
		
		<form action="<%= request.getContextPath() %>/Member/memberAndScoreList.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="word">
				<button type="submit">검색</button>
			</div>
		</form>
		
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="./memberAndScoreList.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
				MemberAndScore mas = list.get(0);
				if(currentPage < mas.getMember().getLastPage())	{
			%>
					<a href="./memberAndScore List.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
	</body>
</html>