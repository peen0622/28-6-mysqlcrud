<!-- 2018.06.26 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>		<!-- service ��Ű���� MemberŬ������ ����ϱ� ���� import. -->
<%@ page import = "service.MemberDao" %>	<!-- service ��Ű���� MemberDaoŬ������ ����ϱ� ���� import. -->
<%
	request.setCharacterEncoding("euc-kr");// �ѱ��� ������ �ʰ� ����.
	
	String MemberName = request.getParameter("memberName");	
	int MemberAge = Integer.parseInt(request.getParameter("memberAge"));//form���� �Է��� ���� �޾Ƽ� ������ ����
	
	System.out.println(MemberName+" : MemberName");
	System.out.println(MemberAge+" : MemberAge");
	
	Member m = new Member();	
	m.setMemberName(MemberName);
	m.setMemberAge(MemberAge);	//MemberŬ������ ����.
	
	MemberDao dao = new MemberDao();	//MemberDaoŬ������ ���ؼ� ������ ��ü�� �ּҰ��� dao�� �Ҵ�.
	dao.insertMember(m);	//dao�� ��� �ּҰ��� ��ü�� insertMember�޼ҵ带 ȣ��.(m)�Ű������� ����.
%>