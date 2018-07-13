<!-- 28�� ��ȣ�� 2018.7.3(ȭ����) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>	<!-- service ��Ű���� StudentAddr Ŭ���� ����Ʈ -->		
<%@ page import="service.StudentAddr" %>	<!-- service ��Ű���� StudentAddr Ŭ���� ����Ʈ -->
<%@ page import="service.StudentAddrDao" %>	<!-- service ��Ű���� StudentAddrDao Ŭ���� ����Ʈ -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>StudentAddrList</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/List.css">
	</head>
	<body>
	<%@ include file = "/module/top.jsp" %><br>
		<table>
			<tr>
				<th>�ּ�</th>
				<th>����</th>
				<th>����</th>
			</tr>
				<%
					int no = Integer.parseInt(request.getParameter("no"));	// ����ȯ �Ͽ�  ���������� �Ҵ�
					
					StudentAddrDao studentAddrDao = new StudentAddrDao();
					ArrayList<StudentAddr> list = studentAddrDao.selectStudentAddr(no);
					
					for(int i=0; i<list.size(); i++) {
						StudentAddr studentAddr = list.get(i);
				%>
						<tr>
							<td class="col1"><%= studentAddr.getStudentAddrContent() %></td>
							<td class="col1"><a href="<%= request.getContextPath() %>/Student/updateStudentAddrForm.jsp?no=<%=no%>&addrNo=<%=studentAddr.getStudentAddrNo()%>">����</a></td>
							<td class="col1"><a href="<%= request.getContextPath() %>/Student/deleteStudentAddrAction.jsp?no=<%=no%>&addrNo=<%=studentAddr.getStudentAddrNo()%>">����</a></td>
						</tr>
				<%
					}
				%>
		</table>
	</body>
</html>