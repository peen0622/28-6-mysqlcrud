<!-- 2018-07-02 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
			</tr>
			<%
				int currentPage = 1; //현재 페이지
				if(request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
				}
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, 5);
				
				for(int i=0; i<list.size(); i++) {
					Member member = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=member.getMemberNo()%></td>
					<td class = "col1"><%=member.getMemberName()%></td>
					<td class = "col1"><%=member.getMemberAge()%></td>
				</tr>
				
			<%
				}
			%>
		</table>
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./memberList.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
				Member member = list.get(0);
				if(currentPage < member.getLastPage())	{
			%>
					<a href="./memberList.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
	</body>
</html>