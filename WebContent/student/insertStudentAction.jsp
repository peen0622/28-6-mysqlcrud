<!-- 28기 김호순 2018.6.26(화) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentDao" %>	<!-- service 패키지내 StudentDao 클래스 임포트 -->
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="student" class="service.Student"/>	<!-- id : 자바빈 객체에 접근 시 사용할 객체참조변수, class : 임포트할 클래스 -->
<jsp:setProperty property="*" name="student"/>	<!-- property에 *을 입력하여 모두 객체에 담을 수있다, name :  id에 지정한 객체참조변수 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insertStudentAction</title>
</head>
<body>
<%
	StudentDao sdao = new StudentDao();	// 클래스 데이터타입의 객체참조변수 sdao에 StudentDao()생성자 메서드의 주소갑을 할당
	sdao.insertStudent(student);	// sdao의 주소값을 찾아가 Dao클래스의 inserStudent메서드에 student(id)를 대입하고 호풀
%>

</body>
</html>