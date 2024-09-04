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
<script type="text/javascript">

	$(function() {
		
		// 희망 분야 3개 초과 선택 불가
		$("input[type='checkbox']").on("click", function() {
			
			$("#categoryHelpInline").css("display", "none");
			
			var count = $("input:checked[type='checkbox']").length;
			
			if (count > 3)
			{
				$("#categoryHelpInline").css("display", "inline");
				$(this).prop("checked", false);
			}
		});
		
		// 유효성 검사
		
	});
	
</script>
</head>
<body>
	<div class="container border bg-light">
		<h2 class="text-center">회원 가입</h2>
	</div>

	<div class="container border">
		
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
						<button class="btn btn-light border" type="button">중복확인</button>
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
						<button class="btn btn-light border" type="button">중복확인</button>
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
							aria-describedby="ssnHelpInline">
					</div>
					<span class="col-auto">-</span>
					<div class="col-md-1">
						<input type="text" id="gender_id" name="gender_id" class="form-control"
							aria-describedby="ssnHelpInline" maxlength="1">
					</div>
					<span class="col-auto">******</span>
					<div class="col-auto">
						<span id="ssnHelpInline" class="form-text">  </span>
					</div>
				</div>
				
				
				<%-- 지역 선택 --%>
				<%-- 지역 선택은 하나 선택할때마다 추가되게 
					 또는 찾기 ~ --%>
				<div class="row">
					<div class="col-md-2">
						<label for="location_id" class="col-form-label">지역</label>
					</div>
					<div class="col-auto">
						<select name="" id="">
							<option value="">서울시</option>
							<option value="">경기도</option>
							<option value="">강원도</option>
						</select>
					</div>
					<div class="col-auto">
						<select name="" id="">
							<option value="">강동구</option>
							<option value="">강서구</option>
							<option value="">강남구</option>
						</select>
					</div>
					<div class="col-auto">
						<select name="" id="">
							<option value="">성내동</option>
							<option value="">천호동</option>
							<option value="">암사동</option>
						</select>
					</div>
				</div>
				
				<%-- 상세거주지 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="addr_detail" class="col-form-label">상세 거주지</label>
					</div>
					<div class="col-auto">
						<input type="text" id="addr_detail" name="addr_detail" class="form-control"
							aria-describedby="addr_detailHelpInline">
					</div>
					<div class="col-auto">
						<span id="addr_detailHelpInline" class="form-text">  </span>
					</div>
				</div>
				
				<%-- 선택 사항 --%>
				<%-- 희망분야 --%>
				<div class="row g-3 align-items-center">
					<div class="col-md-2">
						<label for="category" class="col-form-label">희망 분야</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="1"/>요식업
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="2"/>행사/이벤트
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="3"/>건설
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="4"/>서비스
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="5"/>운전/배달
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="6"/>교육
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="7"/>사무직
						</label>
					</div>
					<div class="col-auto">
						<label class="col-form-label">
							<input type="checkbox" name="category" value="8"/>기타
						</label>
					</div>
					<div class="col-auto">
						<span id="categoryHelpInline" class="form-text" style="display: none; color: red;">3개 이상 선택 불가</span>
					</div>
				</div>
				
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<button type="submit" id="next" class="btn btn-success">회원가입</button>
					</div>
					<div class="col-auto">
						<button type="button" id="cancel" class="btn btn-danger">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>