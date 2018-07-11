<!-- 28기 김호순 2018.7.3(화요일) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddrDao" %>	<!-- service 패키지내 StudentAddrDao 클래스 임포트 -->
<%@ page import="service.StudentAddr" %>	<!-- service 패키지내 StudentAddr 클래스 임포트 -->	
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
</head>
<body>
	<table border="1">
		<tr>
			<th>주소</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	// 형변환 하여  정수형으로 할당
			System.out.println(no + "<---no");
			StudentAddrDao s = new StudentAddrDao();
			StudentAddr studentAddr = s.selectStudentAddr(no);
			
		%>
		<tr>
			<td class="col1"><%= studentAddr.getStudentAddrContent() %></td>
			<td class="col1"><a href="<%= request.getContextPath() %>/Student/updateStudentAddrForm.jsp?no=<%=no%>">수정</a></td>
			<td class="col1"><a href="<%= request.getContextPath() %>/Student/deleteStudentAddrAction.jsp?no=<%=no%>">삭제</a></td>
		</tr>
	</table>
<%

%>
</body>
</html>