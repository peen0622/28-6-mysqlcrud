<!-- 2018-07-03 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.TeacherAddr"%>
<%@ page import="service.TeacherAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>teacherList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	
	<body>
		<table>
			<tr>
				<th>�ּ�</th>
				<th>����</th>
				<th>����</th>
			</tr>
				<%
					int no = Integer.parseInt(request.getParameter("no"));
					TeacherAddrDao t = new TeacherAddrDao();
					TeacherAddr teacherAddr = t.selectTeacherAddr(no);
				%>
				<tr>
					<td class = "col1"><%=teacherAddr.getTeacherAddrContent()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/deleteTeacherAddrAction.jsp?no=<%=no%>">����</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Teacher/updateTeacherAddrForm.jsp?no=<%=no%>">����</a></td>
				</tr>
		</table>
	</body>
</html>