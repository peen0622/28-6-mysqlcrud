<!-- 2018.07.09 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="service.MemberAddrDao"%>
<%request.setCharacterEncoding("euc-kr");%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String memberAddrContent = request.getParameter("memberAddrContent");
	int addrno = Integer.parseInt(request.getParameter("addrno"));
	System.out.println(addrno +" : 주소번호");
	System.out.println(memberAddrContent +" : 주소");
	System.out.println(no +" : 번호");

	MemberAddr ma = new MemberAddr();
	ma.setMemberAddrNo(no);
	ma.setMemberAddrContent(memberAddrContent);
	
	MemberAddrDao madao = new MemberAddrDao();
	madao.updateAddrMember(ma, no, addrno);
	
	response.sendRedirect(request.getContextPath()+"/Member/memberAddrList.jsp?no="+no);
%>