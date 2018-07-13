<!-- 2018-07-02 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Teacher"%>
<%@ page import="service.TeacherDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	
	<body>
		<%@ include file="/module/top.jsp" %><br>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소 입력</th>
				<th>점수 입력</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				request.setCharacterEncoding("euc-kr");
			
				int currentPage = 1; //현재 페이지
				if(request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
				}
				
				String word ="";
				if(request.getParameter("word") != null) {
					word = request.getParameter("word");
				}
				
				TeacherDao teacherDao = new TeacherDao();
				ArrayList<Teacher> list = teacherDao.selectTeacherByPage(currentPage, 5, word);
				
				for(int i=0; i<list.size(); i++) {
					Teacher teacher = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=teacher.getTeacherNo()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/teacherAddrList.jsp?no=<%=teacher.getTeacherNo()%>"><%=teacher.getTeacherName()%></a></td>
					<td class = "col1"><%=teacher.getTeacherAge()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/insertTeacherAddrForm.jsp?no=<%=teacher.getTeacherNo()%>">주소 입력</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/insertTeacherScoreForm.jsp?no=<%=teacher.getTeacherNo()%>">점수 입력</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/updateTeacherForm.jsp?no=<%=teacher.getTeacherNo()%>">수정</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/deleteTeacherAction.jsp?no=<%=teacher.getTeacherNo()%>">삭제</a></td>
				</tr>
			<%
				}
			%>
		</table>
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
			
				Teacher teacher = list.get(0);
				if(currentPage < teacher.getLastPage())	{
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
		<form action="<%= request.getContextPath() %>/Teacher/teacherList.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="word">
				<button type="submit">검색</button>
			</div>
		</form>
	</body>
</html>