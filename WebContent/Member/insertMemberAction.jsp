<!-- 2018.06.26 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao" %>	<!-- service 패키지의 MemberDao클래스를 사용하기 위해 import. -->

<%request.setCharacterEncoding("euc-kr");%>	<!-- 한글이 깨지지 않게 설정. -->

<jsp:useBean id="m" class="service.Member"/>	<!-- Member클래스를 import해주고 Member클래스를 통해 객체를 생성후 주소값을 변수m에 할당. -->
<jsp:setProperty name="m" property="*"/>		<!-- Form.jsp에서 넘어온 값들을 받아서  m에 담긴  Member클래스를 통해 생성된 객체에 셋팅. -->

<!DOCTYPE html>
<%
MemberDao dao = new MemberDao();	//MemberDao클래스를 통해성 생성된 객체의 주소값을 dao에 할당.
dao.insertMember(m);				//dao에 담긴 주소값의 객체에 insertMember메소드를 호출.(m)매개변수에 대입.
%>