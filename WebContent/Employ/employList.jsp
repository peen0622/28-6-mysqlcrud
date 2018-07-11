<!--2018.07.10 박원우  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Employ"%>
<%@ page import="service.EmployDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>employList</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소입력</th>
				<th>점수입력</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<%
				request.setCharacterEncoding("euc_kr");
				int currentPage = 1; //현재 페이지
				if (request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
				}
	
				String word = "";
				if (request.getParameter("word") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					word = request.getParameter("word"); //String currentPage를 형변환 하여 대입합니다.
				}
	
				EmployDao employDao = new EmployDao();
				ArrayList<Employ> list = employDao.selectEmployByPage(currentPage, 10, word);
	
				for (int i = 0; i < list.size(); i++) {
					Employ employ = list.get(i);
			%>
			<tr>
				<td class="col1"><%=employ.getEmployNo()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/employAddrList.jsp?no=<%=employ.getEmployNo()%>"><%=employ.getEmployName()%></a></td>
				<td class="col1"><%=employ.getEmployAge()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/insertEmployAddrForm.jsp?no=<%=employ.getEmployNo()%>">주소입력</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/insertEmployScoreForm.jsp?no=<%=employ.getEmployNo()%>">점수입력</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/deleteEmployAction.jsp?no=<%=employ.getEmployNo()%>">삭제</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Employ/updateEmployForm.jsp?no=<%=employ.getEmployNo()%>">수정</a></td>
			</tr>
			<%
				}
			%>
		</table>
	
		<form action="<%=request.getContextPath()%>/Employ/employList.jsp"
			method="post">
			<div>
				이름 : <input type="text" name="word">
				<button type="submit">검색</button>
			</div>
		</form>
	
		<div class="col1">
			<%
				if (currentPage > 1) {
			%>
			<a href="./employList.jsp?currentPage=<%=currentPage - 1%>">◀이전</a>
			<%
				}
				Employ employ = list.get(0);
				if (currentPage < employ.getLastPage()) {
			%>
			<a href="./employList.jsp?currentPage=<%=currentPage + 1%>">다음▶</a>
			<%
				}
			%>
		</div>
	</body>
</html>