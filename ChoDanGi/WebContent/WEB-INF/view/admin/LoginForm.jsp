<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container border bg-light">
	<h2 class="text-center">관리자 로그인</h2>
</div>
<div class="container border">

	<div class="text-center mb-3 mt-3">
		<div class="nav nav-tabs">
			<div class="nav-item">
				<a href="loginform.action?memberType=seeker" class="nav-link">구직자</a>
			</div>
			<div class="nav-item">
				<a href="loginform.action?memberType=poster" class="nav-link">구인자</a>
			</div>
			<div class="nav-item">
				<a href="loginform.action?memberType=admin" class="nav-link active">관리자</a>
			</div>
		</div>
	</div>
	
	<form method="post" action="adminlogin.action" id="login-form">
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
			<div class="col-sm-2 text-center">
				<button type="submit" class="btn btn-success" style="width: 100%; height: 100%;">Login</button>
			</div>
		</div>
	</form>
	
</div>

	
</body>
</html>