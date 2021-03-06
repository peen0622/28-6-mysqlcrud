<!-- 2018.07.10 박원우-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<h1>MemberList</h1>
		<div><h3><a href="<%= request.getContextPath() %>/index.jsp">HOME으로..</a></h3></div>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소입력</th><!--다수 입력 -->
				<th>점수입력</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<%
				request.setCharacterEncoding("euc_kr");
				int currentPage = 1; //현재 페이지
				if(request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
				}
				
				String word = "";
				if(request.getParameter("word") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					word =request.getParameter("word"); //String currentPage를 형변환 하여 대입합니다.
				}
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, 10 , word);
				
				for(int i=0; i<list.size(); i++) {
					Member member = list.get(i);
			%>
			<tr>
				<td class = "col1"><%=member.getMemberNo()%></td>
				<td class = "col1"><a href="<%= request.getContextPath() %>/Member/memberAddrList.jsp?no=<%=member.getMemberNo()%>"><%=member.getMemberName()%></a></td>
				<td class = "col1"><%=member.getMemberAge()%></td>
				<td class = "col1"><a href="<%= request.getContextPath() %>/Member/insertMemberAddrForm.jsp?no=<%=member.getMemberNo()%>">주소입력</a></td>
				<td class = "col1"><a href="<%= request.getContextPath() %>/Member/insertMemberScoreForm.jsp?no=<%=member.getMemberNo()%>">점수입력</a></td>
				<td class = "col1"><a href="<%= request.getContextPath() %>/Member/deleteMemberAction.jsp?no=<%=member.getMemberNo()%>">삭제</a></td>
				<td class = "col1"><a href="<%= request.getContextPath() %>/Member/updateMemberForm.jsp?no=<%=member.getMemberNo()%>">수정</a></td>
			</tr>
			<%
				}
			%>
		</table>
		
		<form action="<%= request.getContextPath() %>/Member/memberList.jsp" method="post">
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