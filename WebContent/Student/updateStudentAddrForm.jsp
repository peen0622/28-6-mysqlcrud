<!-- 김호순 2018.7.9 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentAddr"%>
<%@ page import="service.StudentAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>updateStudentAddrForm</title>
	</head>
	
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));	// 형변환 하여  정수형으로 할당
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			StudentAddr studentAddr = studentAddrDao.updateStudentAddrForm(no);
		%>
		<form action="<%=request.getContextPath() %>/Student/updateStudentAddrAction.jsp?no=<%=no%>" method="post">
			<table border="1">
				<tr>
					<td>주소 입력</td>
					<td><input type="text" name="studentAddrContent" size="40" value="<%=studentAddr.getStudentAddrContent()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>