<!-- 2018-07-10 이응빈 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>HOME</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/Index.css">
	</head>
	<body>
		<h1>HOME</h1>
		<div class="menubar">
		<ul>
			<li><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
			<li><span id="current">Employ</span>
				<ul>
					<li><a href="<%= request.getContextPath() %>/Employ/insertEmployForm.jsp">EmployInsert</a></li>
					<li><a href="<%= request.getContextPath() %>/Employ/employList.jsp">EmployList</a></li>
					<li><a href="<%= request.getContextPath() %>/Employ/employAndScoreList.jsp">EmployScoreList</a></li>
					<li><a href="<%= request.getContextPath() %>/Employ/employListAboveAvg.jsp">EmployAvgList</a></li>
				</ul>
			</li>
			<li><span id="current">Member</span>
				<ul>
					<li><a href="<%= request.getContextPath() %>/Member/insertMemberForm.jsp">MemberInsert</a></li>
					<li><a href="<%= request.getContextPath() %>/Member/memberList.jsp">MemberList</a></li>
					<li><a href="<%= request.getContextPath() %>/Member/memberAndScoreList.jsp">MemberScoreList</a></li>
					<li><a href="<%= request.getContextPath() %>/Member/memberListAboveAvg.jsp">MemberAvgList</a></li>
				</ul>
			</li>
			<li><span id="current">Student</span>
				<ul>
					<li><a href="<%= request.getContextPath() %>/Student/insertStudentFrom.jsp">StudentInsert</a></li>
					<li><a href="<%= request.getContextPath() %>/Student/studentList.jsp">StudentList</a></li>
					<li><a href="<%= request.getContextPath() %>/Student/studentAndScoreList.jsp">StudentScoreList</a></li>
					<li><a href="<%= request.getContextPath() %>/Student/studentListAboveAvg.jsp">StudentAvgList</a></li>
				</ul>
			</li>
			<li><span id="current">Teacher</span>
				<ul>
					<li><a href="<%= request.getContextPath() %>/Teacher/insertTeacherForm.jsp">TeacherInsert</a></li>
					<li><a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">TeacherList</a></li>
					<li><a href="<%= request.getContextPath() %>/Teacher/teacherAndScoreList.jsp">TeacherScoreList</a></li>
					<li><a href="<%= request.getContextPath() %>/Teacher/teacherListAboveAvg.jsp">TeacherAvgList</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</body>
</html>