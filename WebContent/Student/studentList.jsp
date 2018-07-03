<!-- 김호순 2018. 7. 2(월요일) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/teachList.css">
	</head>
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소 입력</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<%
				int currentPage = 1; //현재 페이지
				if(request.getParameter("currentPage") != null) { //받아 오는 currentPage의 값이 null이 아닐 때 실행됩니다.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage를 형변환 하여 대입합니다.
				}
				StudentDao StudentDao = new StudentDao();
				ArrayList<Student> list = StudentDao.selectStudentByPage(currentPage, 5);
				
				for(int i=0; i<list.size(); i++) {
					Student student = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=student.getStudentNo()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Student/studentAddrList.jsp?no=<%=student.getStudentNo()%>"><%=student.getStudentName()%></a></td>
					<td class = "col1"><%=student.getStudentAge()%></td>
					<td><a href="<%= request.getContextPath() %>/Student/insertStudentAddrForm.jsp?no=<%=student.getStudentNo()%>">주소 입력</a></td>
					<td><a href="<%= request.getContextPath() %>/Student/deleteMemberAction.jsp?no=<%=student.getStudentNo()%>">삭제</a></td>
					<td><a href="<%= request.getContextPath() %>/Student/updateMemberForm.jsp?no=<%=student.getStudentNo()%>">수정</a></td>
				</tr>
				
			<%
				}
			%>
		</table>
		<form>
			<div>
				이름 : 
				<input type="text" name="searchWord">
				<button type="button">검색</button>
			</div>
		</form>
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./studentList.jsp?currentPage=<%=currentPage-1%>">◀이전</a>
			<%
				}
				Student student = list.get(0);
				if(currentPage < student.getLastPage())	{
			%>
					<a href="./studentList.jsp?currentPage=<%=currentPage+1%>">다음▶</a>
			<%
				}
			%>
		</div>
	</body>
</html>