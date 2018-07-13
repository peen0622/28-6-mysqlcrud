<!-- 28기 김호순 2018.7.3(화요일) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>	<!-- service 패키지내 StudentAddr 클래스 임포트 -->		
<%@ page import="service.StudentAddr" %>	<!-- service 패키지내 StudentAddr 클래스 임포트 -->
<%@ page import="service.StudentAddrDao" %>	<!-- service 패키지내 StudentAddrDao 클래스 임포트 -->
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
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
				<%
					int no = Integer.parseInt(request.getParameter("no"));	// 형변환 하여  정수형으로 할당
					
					StudentAddrDao studentAddrDao = new StudentAddrDao();
					ArrayList<StudentAddr> list = studentAddrDao.selectStudentAddr(no);
					
					for(int i=0; i<list.size(); i++) {
						StudentAddr studentAddr = list.get(i);
				%>
						<tr>
							<td class="col1"><%= studentAddr.getStudentAddrContent() %></td>
							<td class="col1"><a href="<%= request.getContextPath() %>/Student/updateStudentAddrForm.jsp?no=<%=no%>&addrNo=<%=studentAddr.getStudentAddrNo()%>">수정</a></td>
							<td class="col1"><a href="<%= request.getContextPath() %>/Student/deleteStudentAddrAction.jsp?no=<%=no%>&addrNo=<%=studentAddr.getStudentAddrNo()%>">삭제</a></td>
						</tr>
				<%
					}
				%>
		</table>
	</body>
</html>