<!-- 2018.06.26 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employ"%>	<!-- service ��Ű���� EmployŬ������ ����ϱ� ���� import. -->
<%@ page import="service.EmployDao"%> <!-- service ��Ű���� EmployDaoŬ������ ����ϱ� ���� import. -->
<%
	request.setCharacterEncoding("euc-kr");// �ѱ��� ������ �ʰ� ����.

	String employName = request.getParameter("employName");
	int employAge = Integer.parseInt(request.getParameter("employAge")); //form���� �Է��� ���� �޾Ƽ� ������ ����

	System.out.println(employName + " : employName");
	System.out.println(employAge + " : employAge");

	Employ e = new Employ();
	e.setEmployName(employName);
	e.setEmployAge(employAge);

	EmployDao dao = new EmployDao(); //EmployDao ���ؼ� ������ ��ü�� �ּҰ��� dao�� �Ҵ�.
	dao.insertEmploy(e); //dao�� ��� �ּҰ��� ��ü�� insertEmploy�޼ҵ带 ȣ��.(e)�Ű������� ����.
%>