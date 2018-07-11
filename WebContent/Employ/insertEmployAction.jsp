<!-- 2018.06.26 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employ"%>	<!-- service 패키지의 Employ클래스를 사용하기 위해 import. -->
<%@ page import="service.EmployDao"%> <!-- service 패키지의 EmployDao클래스를 사용하기 위해 import. -->
<%
	request.setCharacterEncoding("euc-kr");// 한글이 깨지지 않게 설정.

	String employName = request.getParameter("employName");
	int employAge = Integer.parseInt(request.getParameter("employAge")); //form에서 입력한 값을 받아서 변수에 대입

	System.out.println(employName + " : employName");
	System.out.println(employAge + " : employAge");

	Employ e = new Employ();
	e.setEmployName(employName);
	e.setEmployAge(employAge);

	EmployDao dao = new EmployDao(); //EmployDao 통해성 생성된 객체의 주소값을 dao에 할당.
	dao.insertEmploy(e); //dao에 담긴 주소값의 객체에 insertEmploy메소드를 호출.(e)매개변수에 대입.
%>