<!-- 28�� ��ȣ�� 2018.7.3(ȭ����) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddrDao" %>	<!-- service ��Ű���� StudentAddrDao Ŭ���� ����Ʈ -->
<%@ page import="service.StudentAddr" %>	<!-- service ��Ű���� StudentAddr Ŭ���� ����Ʈ -->	
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
			<th>�ּ�</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	// ����ȯ �Ͽ�  ���������� �Ҵ�
			System.out.println(no + "<---no");
			StudentAddrDao s = new StudentAddrDao();
			StudentAddr studentAddr = s.selectStudentAddr(no);
			
		%>
		<tr>
			<td class="col1"><%= studentAddr.getStudentAddrContent() %></td>
			<td class="col1"><a href="<%= request.getContextPath() %>/Student/updateStudentAddrForm.jsp?no=<%=no%>">����</a></td>
			<td class="col1"><a href="<%= request.getContextPath() %>/Student/deleteStudentAddrAction.jsp?no=<%=no%>">����</a></td>
		</tr>
	</table>
<%

%>
</body>
</html>