<!-- 2018.06.26 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao" %>	<!-- service ��Ű���� MemberDaoŬ������ ����ϱ� ���� import. -->

<%request.setCharacterEncoding("euc-kr");%>	<!-- �ѱ��� ������ �ʰ� ����. -->

<jsp:useBean id="m" class="service.Member"/>	<!-- MemberŬ������ import���ְ� MemberŬ������ ���� ��ü�� ������ �ּҰ��� ����m�� �Ҵ�. -->
<jsp:setProperty name="m" property="*"/>		<!-- Form.jsp���� �Ѿ�� ������ �޾Ƽ�  m�� ���  MemberŬ������ ���� ������ ��ü�� ����. -->

<!DOCTYPE html>
<%
MemberDao dao = new MemberDao();	//MemberDaoŬ������ ���ؼ� ������ ��ü�� �ּҰ��� dao�� �Ҵ�.
dao.insertMember(m);				//dao�� ��� �ּҰ��� ��ü�� insertMember�޼ҵ带 ȣ��.(m)�Ű������� ����.
%>