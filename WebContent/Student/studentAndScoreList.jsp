<!-- ��ȣ�� 2018.7.9(��) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.StudentScoreDao"%>
<%@ page import="service.StudentAndScore"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentScore"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>studentAndScorerList</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>�л���ȣ</th>
			<th>�л��̸�</th>
			<th>�л�����</th>
			<th>�л�����</th>
		</tr>
<%
	request.setCharacterEncoding("euc-kr");
	StudentScoreDao studentScoreDao = new StudentScoreDao();
	ArrayList<StudentAndScore> list = studentScoreDao.selectStudentAndScore();
	
	for(int i=0; i<list.size(); i++) {
		StudentAndScore studentAndScore = list.get(i);
%>
	<tr>
		<td ><%=studentAndScore.getStudent().getStudentNo()%></td>
		<td><%=studentAndScore.getStudent().getStudentName()%></td>
		<td><%=studentAndScore.getStudent().getStudentAge()%></td>
		<td ><%=studentAndScore.getStudentScore().getScore()%></td>
	</tr>
<%
	}
%>
	</table>
</body>
</html>