<!-- 28기 김호순 2018.7.3(화) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddrDao" %>	<!-- service 패키지내 StudentAddrDao 클래스 임포트 -->
<%@ page import="service.StudentAddr" %>	<!-- service 패키지내 StudentAddr 클래스 임포트 -->	
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>주소</th>
		</tr>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no + "<---no");
			StudentAddrDao s = new StudentAddrDao();
			StudentAddr studentAddr = s.selectStudentAddr(no);
			
		%>
		<tr>
			<td><%= studentAddr.getStudentAddrContent() %></td>
		</tr>
	</table>
<%

%>
</body>
</html>