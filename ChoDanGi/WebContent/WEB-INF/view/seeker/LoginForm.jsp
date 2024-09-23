<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구직자 로그인</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	$(function() {
		// 로그인 버튼 클릭
		$("#loginBtn").click(function() {
			var id = $("#login_id").val();
			var pw = $("#login_pw").val();
			
			$.post("seekerloginajax.action", {login_id : id, login_pw : pw}, function(data) {
				// data == s_id
				data = parseInt(data);
				
				if (data > 0) {
					// 로그인 성공
					alert("로그인 성공");
					$(location).attr("href", "seekermainpage.action");
				}
				else {
					// 로그인 실패
					alert("로그인 실패");
					$(location).attr("href", "seekerlogin.action");
				}
				
			});
		});
		
		
	});

</script>

</head>
<body>

<div class="container border bg-light">
	<h2 class="text-center">구직자 로그인</h2>
</div>
<div class="container border">
	
	
	<div class="text-center mb-3 mt-3">
		<div class="nav nav-tabs">
			<div class="nav-item">
				<a href="loginform.action?memberType=seeker" class="nav-link active">구직자</a>
			</div>
			<div class="nav-item">
				<a href="loginform.action?memberType=poster" class="nav-link">구인자</a>
			</div>
			<div class="nav-item">
				<a href="loginform.action?memberType=admin" class="nav-link">관리자</a>
			</div>
		</div>
	</div>
	
	<form method="post" action="seekerlogin.action" id="login-form">
		<!-- 아이디 패스워드 폼 -->
		<div class="row mb-3">
			<div class="col-sm-10">
				<div class="row g-3">
					<div class="form-floating">
						<input type="text" id="login_id" name="login_id" class="form-control" placeholder="ID"> 
						<label for="login_id">ID</label>
					</div>
					<div class="form-floating">
						<input type="password" id="login_pw" name="login_pw" class="form-control" placeholder="Password">
						<label for="login_pw">PW</label>
					</div>					
				</div>
			</div>
			
			<!-- 로그인 버튼 -->
			<div class="col-sm-2">
				<button type="button" class="btn btn-success justify-content-center" 
				style="width: 100%; height: 100%;" id="loginBtn">Login</button>
			</div>
		</div>
			
		<div class="mb-1">
			<label for="remember-check" class="form-check-label">아이디 저장하기</label>
			<input class="form-check-input" type="checkbox" id="remember-check">
		</div>
		
		
	</form>
	
	<div id="links" class="mb-3 text-end">
		<a role="btn" href="seekersignupform.action" class="btn btn-secondary">구직자 회원가입</a>
		<a role="btn" href="seekerfindidform.action" class="btn btn-secondary">아이디 찾기</a>
		<a role="btn" href="seekerchangepwform.action" class="btn btn-secondary">비밀번호 변경</a>
	</div>
	
</div>

	
</body>
</html>