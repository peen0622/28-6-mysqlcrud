<!-- 2018.07.09 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberScore"%>
<%@ page import="service.MemberScoreDao"%>
<%@ page import="service.MemberAndScore"%>
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
		<th>��ȣ</th>
		<th>�̸�</th>
		<th>����</th>
		<th>����</th>
		<th>ȸ�����</th>
	</tr>
<%
	MemberScoreDao msdao = new MemberScoreDao();
	ArrayList<MemberAndScore> list = msdao.selectMemberAndScored();
	
	for(int i=0; i<list.size(); i++){
		MemberAndScore mas = list.get(i);
%>
	<tr>
		<td class = "col1"><%=mas.getMember().getMemberNo()%></td>
		<td class = "col1"><%=mas.getMember().getMemberName()%></td>
		<td class = "col1"><%=mas.getMember().getMemberAge()%></td>
		<td class = "col1"><%=mas.getMemberScore().getScore()%></td>
		<td class = "col1"><a href="<%= request.getContextPath() %>/index.jsp">���� ȭ��</a></td>
	</tr>
<%
}
%>
</table>
</body>
</html>