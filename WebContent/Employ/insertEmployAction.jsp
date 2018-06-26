<!-- 2018.06.26 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployDao" %>	<!-- service 패키지의 EmployDao클래스를 사용하기 위해 import. -->

<%request.setCharacterEncoding("euc-kr");%>	<!-- 한글이 깨지지 않게 설정. -->

<jsp:useBean id="e" class="service.Employ"/>	<!-- Employ클래스를 import해주고 Employ클래스를 통해 객체를 생성후 주소값을 변수e에 할당. -->
<jsp:setProperty name="e" property="*"/>		<!-- Form.jsp에서 넘어온 값들을 받아서  e에 담긴 Employ클래스를 통해 생성된 객체에 셋팅. -->

<!DOCTYPE html>
<%
EmployDao dao = new EmployDao();	//EmployDao 통해성 생성된 객체의 주소값을 dao에 할당.
dao.insertEmploy(e);				//dao에 담긴 주소값의 객체에 insertEmploy메소드를 호출.(e)매개변수에 대입.
%>		