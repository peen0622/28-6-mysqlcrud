<!-- 2018-07-03 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="service.MemberAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberAddrList</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/List.css">
	</head>
	<body>
		<h1>MemberAddrList</h1>
		<table>
			<tr>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				int no = Integer.parseInt(request.getParameter("no"));
				System.out.println(no + "<--no : form");
	
				MemberAddrDao mad = new MemberAddrDao();
				ArrayList<MemberAddr> list = mad.selectMemberAddr(no);
				
				for(int i=0; i<list.size(); i++) {
					MemberAddr ma = list.get(i);
			%>
			<tr>
				<td class="col1"><%=ma.getMemberAddrContent()%></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Member/deleteAddrMember.jsp?addrno=<%=ma.getMemberAddrNo()%>&no=<%=no%>">삭제</a></td>
				<td class="col1"><a href="<%=request.getContextPath()%>/Member/updateAddrMemberForm.jsp?addrno=<%=ma.getMemberAddrNo()%>&no=<%=no%>">수정</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>