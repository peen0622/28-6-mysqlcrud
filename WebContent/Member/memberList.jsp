<!-- 2018-07-02 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
		<table border="1">
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>�ּ��Է�</th>
				<th>����</th>
				<th>����</th>
			</tr>
			<%
				int currentPage = 1; //���� ������
				if(request.getParameter("currentPage") != null) { //�޾� ���� currentPage�� ���� null�� �ƴ� �� ����˴ϴ�.
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //String currentPage�� ����ȯ �Ͽ� �����մϴ�.
				}
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, 10);
				
				for(int i=0; i<list.size(); i++) {
					Member member = list.get(i);
			%>
				
				<tr>
					<td class = "col1"><%=member.getMemberNo()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Member/memberAddrList.jsp?no=<%=member.getMemberNo()%>"><%=member.getMemberName()%></a></td>
					<td class = "col1"><%=member.getMemberAge()%></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Member/insertMemberAddrForm.jsp?no=<%=member.getMemberNo()%>">�ּ��Է�</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Member/deleteMember.jsp?no=<%=member.getMemberNo()%>">����</a></td>
					<td class = "col1"><a href="<%= request.getContextPath() %>/Member/updateMemberForm.jsp?no=<%=member.getMemberNo()%>">����</a></td>
				</tr>
				
			<%
				}
			%>
		</table>
		
		<form>
			<div>
				�̸� :
				<input type="text" name="searchWord">
				<button type="button">�˻�</button>
			</div>
		</form>
		
		<div class = "col1"> 
			<%
				if(currentPage > 1) {
			%>
					<a href="./memberList.jsp?currentPage=<%=currentPage-1%>">������</a>
			<%
				}
				Member member = list.get(0);
				if(currentPage < member.getLastPage())	{
			%>
					<a href="./memberList.jsp?currentPage=<%=currentPage+1%>">������</a>
			<%
				}
			%>
		</div>
	</body>
</html>