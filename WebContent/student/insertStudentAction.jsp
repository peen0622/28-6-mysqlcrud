<!-- 28�� ��ȣ�� 2018.6.26(ȭ) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.StudentDao" %>	<!-- service ��Ű���� StudentDao Ŭ���� ����Ʈ -->
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="student" class="service.Student"/>	<!-- id : �ڹٺ� ��ü�� ���� �� ����� ��ü��������, class : ����Ʈ�� Ŭ���� -->
<jsp:setProperty property="*" name="student"/>	<!-- property�� *�� �Է��Ͽ� ��� ��ü�� ���� ���ִ�, name :  id�� ������ ��ü�������� -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insertStudentAction</title>
</head>
<body>
<%
	StudentDao sdao = new StudentDao();	// Ŭ���� ������Ÿ���� ��ü�������� sdao�� StudentDao()������ �޼����� �ּҰ��� �Ҵ�
	sdao.insertStudent(student);	// sdao�� �ּҰ��� ã�ư� DaoŬ������ inserStudent�޼��忡 student(id)�� �����ϰ� ȣǮ
%>

</body>
</html>