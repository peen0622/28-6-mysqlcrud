<!-- 2018-07-03 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int no = Integer.parseInt(request.getParameter("no"));

MemberDao mdao = new MemberDao();
Member m = mdao.updateMemberForm(no);
%>
<form action="<%= request.getContextPath() %>/Member/updateMemberAction.jsp?no=<%=no %>" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="memberName" size="20" value="<%=m.getMemberName()%>"></td>
				<tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="memberAge" size="20" value="<%=m.getMemberAge()%>"></td>
				<tr>
				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
</body>
</html>