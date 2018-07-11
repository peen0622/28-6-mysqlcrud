<!-- 2018.06.26 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>		<!-- service 패키지의 Member클래스를 사용하기 위해 import. -->
<%@ page import = "service.MemberDao" %>	<!-- service 패키지의 MemberDao클래스를 사용하기 위해 import. -->
<%
	request.setCharacterEncoding("euc-kr");// 한글이 깨지지 않게 설정.
	
	String MemberName = request.getParameter("memberName");	
	int MemberAge = Integer.parseInt(request.getParameter("memberAge"));//form에서 입력한 값을 받아서 변수에 대입
	
	System.out.println(MemberName+" : MemberName");
	System.out.println(MemberAge+" : MemberAge");
	
	Member m = new Member();	
	m.setMemberName(MemberName);
	m.setMemberAge(MemberAge);	//Member클래스에 셋팅.
	
	MemberDao dao = new MemberDao();	//MemberDao클래스를 통해성 생성된 객체의 주소값을 dao에 할당.
	dao.insertMember(m);	//dao에 담긴 주소값의 객체에 insertMember메소드를 호출.(m)매개변수에 대입.
%>