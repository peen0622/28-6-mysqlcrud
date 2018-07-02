<!-- 2018-07-02 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>employList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<table>
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
				EmployDao employDao = new EmployDao();
				ArrayList<Employ> list = employDao.selectEmployByPage(currentPage, 10);
				
				for(int i=0; i<list.size(); i++) {
					Employ employ = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=employ.getEmployNo()%></td>
					<td class = "col1"><%=employ.getEmployName()%></td>
					<td class = "col1"><%=employ.getEmployAge()%></td>
				</tr>
				
			<%
				}
			%>
		</table>
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./employList.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
				Employ employ = list.get(0);
				if(currentPage < employ.getLastPage())	{
			%>
					<a href="./employList.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
	</body>
</html>