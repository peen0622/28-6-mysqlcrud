<!-- 2018-07-03 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE htm>
<html>
	<head>
		<title>Member Update</title>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<link rel="icon" type="image/png" href="<%= request.getContextPath() %>/images/icons/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/vendor/css-hamburgers/hamburgers.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/vendor/animsition/css/animsition.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/vendor/select2/select2.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/vendor/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/util.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css">
	</head>
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			
			MemberDao mdao = new MemberDao();
			Member m = mdao.updateMemberForm(no);
		%>
		<div class="limiter">
			<div class="container-login100" style="background-image: url('<%= request.getContextPath() %>/images/bg-01.jpg');">
				<div class="wrap-login100 p-t-30 p-b-50">
					<span class="login100-form-title p-b-41">Member Update</span>
					
					<form class="login100-form validate-form p-b-33 p-t-5" action="<%= request.getContextPath() %>/Member/updateMemberAction.jsp?no=<%=no %>" method="post">
						<div class="wrap-input100 validate-input" data-validate = "Enter username">
							<input class="input100" type="text" name="memberName" placeholder="Member name" value="<%=m.getMemberName()%>">
							<span class="focus-input100" data-placeholder="&#xe82a;"></span>
						</div>
	
						<div class="wrap-input100 validate-input" data-validate="Enter password">
							<input class="input100" type="text" name="memberAge" placeholder="Member age" value="<%=m.getMemberAge()%>">
							<span class="focus-input100" data-placeholder="&#xe80f;"></span>
						</div>
	
						<div class="container-login100-form-btn m-t-32">
							<button class="login100-form-btn">Update</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<div id="dropDownSelect1"></div>
		
		<script src="<%= request.getContextPath() %>/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/animsition/js/animsition.min.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/bootstrap/js/popper.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/select2/select2.min.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/daterangepicker/moment.min.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/daterangepicker/daterangepicker.js"></script>
		<script src="<%= request.getContextPath() %>/vendor/countdowntime/countdowntime.js"></script>
		<script src="<%= request.getContextPath() %>/js/main.js"></script>
	</body>
</html>