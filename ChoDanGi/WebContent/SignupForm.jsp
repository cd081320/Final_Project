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
<title>회원가입(구직자)</title>
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="container">

		<div class="header">
			<h1 class="display-6">회원 가입</h1>
		</div>
		
		<div class="panel-body table">
			<form action="">
			
				<%-- 회원 아이디 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="login_id" class="col-form-label">회원 아이디</label>
					</div>
					<div class="col-auto">
						<input type="text" id="login_id" name="login_id" class="form-control"
							aria-describedby="loginIdHelpInline">
					</div>
					<div class="col-auto">
						<span id="login_idHelpInline" class="form-text"> 영문 8 ~ 20자, 한글 4 ~ 10자 </span>
					</div>
				</div>
	
				
				<%-- 회원 비밀번호 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="login_pw" class="col-form-label">회원 비밀번호</label>
					</div>
					<div class="col-auto">
						<input type="text" id="login_pw" name="login_pw" class="form-control"
							aria-describedby="login_pwHelpInline">
					</div>
					<div class="col-auto">
						<span id="login_pwHelpInline" class="form-text">  </span>
					</div>
				</div>
	
				
				<%-- 닉네임 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="nickname" class="col-form-label">닉네임</label>
					</div>
					<div class="col-auto">
						<input type="text" id="nickname" name="nickname" class="form-control"
							aria-describedby="nicknameHelpInline">
					</div>
					<div class="col-auto">
						<span id="nicknameHelpInline" class="form-text">  </span>
					</div>
				</div>
	
				
				<%-- 이름 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="name" class="col-form-label">이름</label>
					</div>
					<div class="col-auto">
						<input type="text" id="name" name="name" class="form-control"
							aria-describedby="nameHelpInline">
					</div>
					<div class="col-auto">
						<span id="nameHelpInline" class="form-text">  </span>
					</div>
				</div>
	
				<div style="height: 10%;"></div>
	
				<%-- 전화번호 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="tel" class="col-form-label">전화번호</label>
					</div>
					<div class="col-auto">
						<input type="tel" id="tel" name="tel" class="form-control"
							aria-describedby="telHelpInline">
					</div>
					<div class="col-auto">
						<span id="telHelpInline" class="form-text">  </span>
					</div>
				</div>
	
				<div style="height: 10%;"></div>
				
				<%-- 이메일 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="email" class="col-form-label">이메일</label>
					</div>
					<div class="col-auto">
						<input type="email" id="email" name="email" class="form-control"
							aria-describedby="emailHelpInline">
					</div>
					<div class="col-auto">
						<span id="emailHelpInline" class="form-text">  </span>
					</div>
				</div>
				
				<div style="height: 10%;"></div>
				
				<%-- 주민번호 앞자리 + 뒷자리 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="ssn_front" class="col-form-label">주민등록번호</label>
					</div>
					<div class="col-md-2">
						<input type="text" id="ssn_front" name="ssn_front" class="form-control"
							aria-describedby="ssn_frontHelpInline">
					</div>
					-
					<div class="col-md-2">
						<input type="text" id="gender_id" name="gender_id" class="form-control"
							aria-describedby="gender_idHelpInline">
					</div>
					<div class="col-auto">
						<span id="ssn_frontHelpInline" class="form-text">  </span>
					</div>
					<div class="col-auto">
						<span id="gender_idHelpInline" class="form-text">  </span>
					</div>
				</div>
				
				
				<%-- 지역 선택 --%>
				<div class="row">
					<div class="col-auto">
						<label for="location_id" class="col-form-label"></label>
					</div>
					<select name="" id=""></select>
				</div>
				
				<%-- 상세거주지 --%>
				
				<%-- 선택 사항 --%>
				
				<%-- 희망분야 --%>
				
				<%-- 상세거주지 --%>
				
				
				
			</form>
		</div>
	</div>

</body>
</html>