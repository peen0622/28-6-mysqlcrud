<!-- 2018.07.09 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="service.MemberAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			
			MemberAddrDao mdao = new MemberAddrDao();
			MemberAddr ma = mdao.updateAddrMemberForm(no);
		%>
		<form action="<%= request.getContextPath() %>/Member/updateAddrMemberAction.jsp?no=<%=no %>" method="post">
			<table border="1">
				<tr>
					<td>주소</td>
					<td><input type="text" name="memberAddrContent" size="20" value="<%=ma.getMemberAddrContent()%>"></td>
				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>