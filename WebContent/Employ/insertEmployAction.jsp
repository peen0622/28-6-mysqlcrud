<!-- 2018.06.26 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployDao" %>	<!-- service ��Ű���� EmployDaoŬ������ ����ϱ� ���� import. -->

<%request.setCharacterEncoding("euc-kr");%>	<!-- �ѱ��� ������ �ʰ� ����. -->

<jsp:useBean id="e" class="service.Employ"/>	<!-- EmployŬ������ import���ְ� EmployŬ������ ���� ��ü�� ������ �ּҰ��� ����e�� �Ҵ�. -->
<jsp:setProperty name="e" property="*"/>		<!-- Form.jsp���� �Ѿ�� ������ �޾Ƽ�  e�� ��� EmployŬ������ ���� ������ ��ü�� ����. -->

<!DOCTYPE html>
<%
EmployDao dao = new EmployDao();	//EmployDao ���ؼ� ������ ��ü�� �ּҰ��� dao�� �Ҵ�.
dao.insertEmploy(e);				//dao�� ��� �ּҰ��� ��ü�� insertEmploy�޼ҵ带 ȣ��.(e)�Ű������� ����.
%>		