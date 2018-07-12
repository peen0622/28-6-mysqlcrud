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
		<title>MemberAndScoreList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<h1>MemberAndScoreList</h1>
		<div><h3><a href="<%= request.getContextPath() %>/index.jsp">HOME����..</a></h3></div>
		<table>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%	
				request.setCharacterEncoding("euc-kr");
				int currentPage = 1; //���� ������
				if(request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
				
				String word = "";
				if(request.getParameter("word") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					word =request.getParameter("word"); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
				
				MemberScoreDao msdao = new MemberScoreDao();
				ArrayList<MemberAndScore> list = msdao.selectMemberAndScored(currentPage, 10, word);
				
				for(int i=0; i<list.size(); i++){
					MemberAndScore mas = list.get(i);
			%>
			<tr>
				<td class = "col1"><%=mas.getMember().getMemberNo()%></td>
				<td class = "col1"><%=mas.getMember().getMemberName()%></td>
				<td class = "col1"><%=mas.getMember().getMemberAge()%></td>
				<td class = "col1"><%=mas.getMemberScore().getScore()%></td>
			</tr>
			<%
				}
			%>
		</table>
		
		<form action="<%= request.getContextPath() %>/Member/memberAndScoreList.jsp" method="post">
			<div>
				�̸� :
				<input type="text" name="word">
				<button type="submit">�˻�</button>
			</div>
		</form>
		
		<div class = "col1">
			<%
				if(currentPage > 1) {
			%>
					<a href="./memberAndScoreList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				MemberAndScore mas = list.get(0);
				if(currentPage < mas.getMember().getLastPage())	{
			%>
					<a href="./memberAndScore List.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
	</body>
</html>