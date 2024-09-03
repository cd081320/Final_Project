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
<title>구직자 로그인</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
	<div class="btn_group">
		<a href="loginform.action?memberType=seeker" class="btn btn-primary active">구직자</a>
		<a href="loginform.action?memberType=poster" class="btn btn-secondary">구인자</a>
		<a href="loginform.action?memberType=admin" class="btn btn-secondary">관리자</a>
	</div>
	
	<h2 class="text-center">구직자 로그인</h2>
	
	<form method="post" action="seekerlogin.action" id="login-form">
		<input type="text" name="login_id" placeholder="ID"> 
		<input type="password" name="login_pw" placeholder="Password">
		<br /><br />
		<label for="remember-check">
			<input type="checkbox" id="remember-check">아이디 저장하기
		</label>
		<br><br>
		<label><a href="#">구직자 회원가입</a></label>
		<label><a href="#">아이디 찾기</a></label>
		<label><a href="#">비밀번호 변경</a></label>
		
		<input type="submit" value="Login">
		
	</form>
	
</div>

	
</body>
</html>