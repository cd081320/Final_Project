<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript">
	var categoryArr = [];
	
	$(function() {
		
		// 토스트 설정
        var errorToast = new bootstrap.Toast($("#errorToast")[0]);
        var successToast = new bootstrap.Toast($("#successToast")[0]);

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
		
		
		// 아이디가 변경 될 때마다 중복검사 값 초기화
		$("#login_id").change(function() {
			$("#idCheck").val("0");
		});
		
		// 닉네임이 변경 될 때마다 중복검사 값 초기화
		$("#nickname").change(function() {
			$("#nicknameCheck").val("0");
		});
		
		
		// 버튼 액션
		// 아이디 중복 확인 버튼
		$("#idCheck").click(function() {			
			// 영문 + 숫자 4 ~ 20자 정규 표현식
			const pattern = new RegExp("^[A-Za-z0-9]{4,20}$");
			
			// 아이디가 입력되었는지 확인
			var login_id = $("#login_id").val();
			
			if (login_id == "")
			{
				$("#errorToast .toast-body").html("아이디를 입력해주세요.");
				errorToast.show();
				$("#login_id").focus();
				return;
			}
			else if (!pattern.test(login_id))
			{
				$("#errorToast .toast-body").html("아이디 형식이 올바르지 않습니다.");
				errorToast.show();
				$("#login_id").focus();
				$(this).val("0");
				return;
			}
			
			// 아이디 중복 확인 ajax
			$.post("seekeridcheck.action", {login_id : login_id}, function(data) {
				// 값이 1이라면 중복된 아이디
				// 값이 0이라면 사용 가능한 아이디
				data = parseInt(data);
				if (data > 0)
				{
					$("#errorToast .toast-body").html("이미 사용중인 아이디 입니다.");
					errorToast.show();
					$("#login_id").focus();
					$("#idCheck").val("0");
					return;
				}
				else
				{
					$("#successToast .toast-body").html("사용가능한 아이디 입니다.");
					successToast.show();
					$("#idCheck").val("1");
				}
				
			});
		});
		
		// 닉네임 중복 확인 버튼
		$("#nicknameCheck").click(function() {
			
			// 영문 + 숫자 4 ~ 20자 정규 표현식
			const pattern1 = new RegExp("^[A-Za-z0-9]{4,20}$");
			const pattern2 = new RegExp("^[가-힣0-9]{2,10}$");
			
			// 아이디가 입력되었는지 확인
			var nickname = $("#nickname").val();
			
			if (nickname == "")
			{
				$("#errorToast .toast-body").html("닉네임을 입력해주세요.");
				errorToast.show();
				$(this).val("0");
				$("#nickname").focus();
				return;
			}
			else if (!pattern1.test(nickname) && !pattern2.test(nickname))
			{
				$("#errorToast .toast-body").html("닉네임의 형식이 올바르지 않습니다.");
				errorToast.show();
				$(this).val("0");
				$("#nickname").focus();
				return;
			}
			
			// 아이디 중복 확인 ajax
			$.post("seekernicknamecheck.action", {nickname : nickname}, function(data) {
				// 값이 1 이상이라면 중복된 아이디
				// 값이 0이라면 사용 가능한 아이디
				data = parseInt(data);
				if (data > 0)
				{
					$("#errorToast .toast-body").html("이미 사용중인 닉네임 입니다.");
					errorToast.show();
					$("#nicknameCheck").val("0");
					$("#nickname").focus();
					return;
				}
				else
				{
					$("#successToast .toast-body").html("사용가능한 닉네임 입니다.");
					successToast.show();
					$("#nicknameCheck").val("1");
				}
			});
		});
		
		
		// 비밀번호 확인
		$("#login_pw").keyup(function() {
			
			// 유효한 비밀번호가 아닐 때
			if(!passwordCheck($(this).val()))
			{
				// 실패
				$("#login_pwHelpInline").html("유효하지 않은 비밀번호입니다.");
				$("#login_pwHelpInline").attr("class", "form-text text-danger");
				return;
			}
			
			// 성공
			$("#login_pwHelpInline").html("사용 가능한 비밀번호입니다.");
			$("#login_pwHelpInline").attr("class", "form-text text-success");
		});
		
		// 비밀번호 체크 확인
		$("#login_pw_check").keyup(function() {
			
			// 입력한 비밀번호와 확인이 서로 다를 때
			if ($(this).val() != $("#login_pw").val())
			{
				$("#login_pwHelpInline").html("입력한 비밀번호와 일치하지 않습니다.");
				$("#login_pwHelpInline").attr("class", "form-text text-danger");
				$("#login_pw_check").focus();
				return;
			}
			
			$("#login_pwHelpInline").html("사용 가능한 비밀번호입니다.");
			$("#login_pwHelpInline").attr("class", "form-text text-success");
		});
		
		
		// 전화번호 확인
		$("#tel").keyup(function() {
			if (!isValidPhone($(this).val())) 
			{
				$("#telHelpInline").html("올바른 전화번호 형식이 아닙니다.");
				return;
			}
			$("#telHelpInline").html("");
		})

		// 이메일 확인
		$("#email").keyup(function() {
			if (!isValidEmail($(this).val())) 
			{
				$("#emailHelpInline").html("올바른 이메일 형식이 아닙니다.");
				return;
			}
			
			$("#emailHelpInline").html("");
		});
				
		
		// 대분류 지역 선택 시 중분류 나타내기
		$("#location1").change(function() {
			var id = $(this).val();
			
			// 옵션 내용 치우기
			$("#location2").empty();
			$("#location2").append("<option value='0' selected='selected'>선택</option>");
			$("#location_id").empty();
			$("#location_id").append("<option value='0' selected='selected'>선택</option>");

			// '선택' 선택시 돌아가기
			if (id == "0")
			{
				return;
			}
			
			$.ajax({
				type : "post",
				url : "locationajax.action",
				dataType : "json",
				data : {"id" : id},
				success : function(jsonArr) {
					
					for (var i in jsonArr)
					{
						var option = $("<option value='" + jsonArr[i].id + "'>" + jsonArr[i].name + "</option>");
						$("#location2").append(option);
					}
				},
				error : function(e)	{
					alert(e.responseText)
				}
			});
		});
		
		// 중분류 지역 선택시 소분류 나타내기
		$("#location2").change(function() {
			var id = $(this).val();
			
			// 옵션 내용 치우기
			$("#location_id").empty();
			$("#location_id").append("<option value='0' selected='selected'>선택</option>");

			// '선택' 선택시 돌아가기
			if (id == "0")
			{
				return;
			}
			
			$.ajax({
				type : "post",
				url : "locationajax.action",
				dataType : "json",
				data : {"id" : id},
				success : function(jsonArr) {
					
					for (var i in jsonArr)
					{
						var option = $("<option value='" + jsonArr[i].id + "'>" + jsonArr[i].name + "</option>");
						$("#location_id").append(option);
					}
				},
				error : function(e)	{
					alert(e.responseText)
				}
			});
		});
		
		
		
		
		
		// 회원가입 버튼
		// submit
		$("#signup").click(function() {
	        
			// 유효성 검사
			
			// 아이디 검사
			if ($("#idCheck").val() == "0")
			{
				$("#errorToast .toast-body").html("아이디 중복검사가 필요합니다.");
				errorToast.show();
				return;
			}
			
			// 비밀번호 검사
			if ($("#login_pw").val() != $("#login_pw_check").val())
			{
				$("#errorToast .toast-body").html("비밀번호가 서로 다릅니다.");
				errorToast.show();
				return;
			}
			
			// 닉네임 검사
			
			// 이름 검사
			if ($("#name").val() == "")
			{
				$("#errorToast .toast-body").html("이름을 입력하세요.");
				errorToast.show();
				return;
			}
			
			// 전화번호 검사
			if ($("#tel").val() == "")
			{
				$("#errorToast .toast-body").html("전화번호를 입력하세요.");
				errorToast.show();
				return;
			}
			
			// 이메일 검사
			if ($("#email").val() == "")
			{
				$("#errorToast .toast-body").html("이메일을 입력하세요.");
				errorToast.show();
				return;
			}

			// 주민등록번호 검사
			if ($("#ssn").val() == "" || $("#gender_id").val() == "")
			{
				$("#errorToast .toast-body").html("주민등록번호를 입력하세요.");
				errorToast.show();
				return;
			}
			
			// 지역 선택 검사
			if ($("#location_id").val() == "0")
			{
				$("#errorToast .toast-body").html("지역을 선택하세요.");
				errorToast.show();
				return;
			}

			// 상세 거주지 검사
			if ($("#addr_detail").val() == "")
			{
				$("#errorToast .toast-body").html("상세 거주지를 입력하세요.");
				errorToast.show();
				return;
			}
			
			// 희망 분야 처리
			categoryArr = [];
			$("input[name='category']:checked").each(function() {
				categoryArr.push($(this).val());
			});
			$("#categoryParams").val(categoryArr);
			
			// submit
			alert("회원가입 성공");
			$("#signupForm").submit();
		});

		// 취소 버튼
		$("#cancel").click(function() {
			if (confirm("정말로 취소하시겠습니까?\n취소하면 모든 내용이 사라집니다."))
			{
				$(location).attr("href", "loginform.action");
			}
				
		});
		
	});

	
</script>
</head>
<body>

	

<div class="container">
	<!-- 헤더 영역 -->
	<header class="text-center my-3">
        <a href="loginform.action">
        	<img src="images/alba.jpg" class="img-fluid" style="width: 10%; display: inline-block; vertical-align: middle;"/>
        </a>
        <h1 style="display: inline-block; vertical-align: middle; margin-left: 10px;">CHODANGIALBA</h1>
    </header>
    <hr />

	
	<div class="card">
		<div class="card-header bg-success text-white">
	           <h3 class="card-title">구직자 회원 가입</h3>
	       </div>
		
		<div class="card-body">
			<form action="seekersignup.action" method="post" id="signupForm">
				
				<%-- 회원 아이디 --%>
				<%-- 영문 + 숫자 4 ~ 20자 --%>
				<div class="row g-3 mt-1 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="login_id" class="col-form-label">회원 아이디</label>
					</div>
					<div class="col-auto">
						<input type="text" id="login_id" name="login_id" class="form-control" maxlength="20">
					</div>
					<div class="col-auto">
						<button class="btn btn-light border" type="button" id="idCheck" value="0">중복확인</button>
					</div>
					<div class="col-auto">
						<span id="login_idHelpInline" class="form-text"> 영문 + 숫자 4 ~ 20자 </span>
					</div>
				</div>
	
				<%-- 회원 비밀번호 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="login_pw" class="col-form-label">회원 비밀번호</label>
					</div>
					<div class="col-auto">
						<input type="password" id="login_pw" name="login_pw" class="form-control">
					</div>
					<div class="col-auto">
						<span id="login_pwHelpInline" class="form-text">  </span>
					</div>
				</div>
								
				<%-- 회원 비밀번호 확인 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="login_pw_check" class="col-form-label">비밀번호 확인</label>
					</div>
					<div class="col-auto">
						<input type="password" id="login_pw_check" class="form-control">
					</div>
					<div class="col-auto">
						<span id="login_pw_checkHelpInline" class="form-text"> 대/소문자 특수문자 포함 10~20자 </span>
					</div>
				</div>
	
				<%-- 닉네임 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="nickname" class="col-form-label">닉네임</label>
					</div>
					<div class="col-auto">
						<input type="text" id="nickname" name="nickname" class="form-control">
					</div>
					<div class="col-auto">
						<button class="btn btn-light border" type="button" id="nicknameCheck" value="0">중복확인</button>
					</div>
					<div class="col-auto">
						<span id="nicknameHelpInline" class="form-text"> 영문 4 ~ 20자, 한글 2 ~ 10자 </span>
					</div>
				</div>
	
				<%-- 이름 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="name" class="col-form-label">이름</label>
					</div>
					<div class="col-auto">
						<input type="text" id="name" name="name" class="form-control">
					</div>
					<div class="col-auto">
						<span id="nameHelpInline" class="form-text text-danger">  </span>
					</div>
				</div>
	
				<%-- 전화번호 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="tel" class="col-form-label">전화번호</label>
					</div>
					<div class="col-auto">
						<input type="text" id="tel" name="tel" class="form-control">
					</div>
					<div class="col-auto">
						<span id="telHelpInline" class="form-text text-danger">  </span>
					</div>
				</div>
	
				<%-- 이메일 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="email" class="col-form-label">이메일</label>
					</div>
					<div class="col-auto">
						<input type="text" id="email" name="email" class="form-control">
					</div>
					<div class="col-auto">
						<span id="emailHelpInline" class="form-text text-danger">  </span>
					</div>
				</div>
				
				<%-- 주민번호 앞자리 + 뒷자리 --%>
				<div class="row g-3 mb-3 align-items-center">
					<div class="col-md-2">
						<label for="ssn_front" class="col-form-label">주민등록번호</label>
					</div>
					<div class="col-auto">
						<input type="number" id="ssn_front" name="ssn_front" class="form-control" maxlength="6" />
					</div>
					<span class="col-auto">-</span>
					<div class="col-auto">
						<input type="number" id="gender_id" name="gender_id" class="form-control" maxlength="1" style="width: 2em;">
					</div>
					<span class="col-auto">******</span>
					<div class="col-auto">
						<span id="ssnHelpInline" class="form-text">  </span>
					</div>
				</div>
				
				
				<%-- 지역 선택 --%>
				<%-- 지역 선택은 하나 선택할때마다 추가되게 
					 또는 찾기 ~ --%>
				<div class="row mb-3">
					<div class="col-md-2">
						<label class="col-form-label">지역</label>
					</div>
					<!-- 대분류 -->
					<div class="col-auto">
						<select id="location1" class="form-select">
							<option value="0" selected="selected">선택</option>
							<c:forEach items="${list1 }" var="loc">
							<option value="${loc.id }">${loc.name }</option>
							</c:forEach>
						</select>
					</div>
					<!-- 중분류 -->
					<div class="col-auto">
						<select id="location2" class="form-select">
							<option value="0" selected="selected">선택</option>
							
						</select>
					</div>
					<!-- 소분류 -->
					<div class="col-auto">
						<select id="location_id" name="location_id" class="form-select">
							<option value="0" selected="selected">선택</option>
							
						</select>
					</div>
					
				</div>
				
				<%-- 상세거주지 --%>
				<div class="row mb-3 g-3 align-items-center">
					<div class="col-md-2">
						<label for="addr_detail" class="col-form-label">상세 거주지</label>
					</div>
					<div class="col-auto">
						<input type="text" id="addr_detail" name="addr_detail" class="form-control">
					</div>
					<div class="col-auto">
						<span id="addr_detailHelpInline" class="form-text">  </span>
					</div>
				</div>
				
				<%-- 선택 사항 --%>
				<%-- 희망분야 --%>
				<%-- 요식업, 행사/이벤트, 건설, 서비스, 운전/배달, 교육/강사, 사무직, 기타 --%>
				<div class="row mb-3 g-3 align-items-center">
					<div class="col-md-2">
						<label class="col-form-label">희망 분야</label>
					</div>
					
					<input type="hidden" id="categoryParams" name="categoryParams"/>
					<c:forEach items="${categoryList }" var="item">
					<div class="col-auto">
						<input type="checkbox" class="form-check-input" 
						id="category${item.id }" value="${item.id }" name="category"/>
						<label for="category${item.id }" class="form-check-label">${item.name }</label>
					</div>
					</c:forEach>
					
					<div class="col-auto">
						<span id="categoryHelpInline" class="form-text" style="display: none; color: red;">3개 이상 선택 불가</span>
					</div>
				</div>
				
				
			</form>
		</div>
		
		<div class="position-fixed bottom-0 end-0 p-3">
		    <div id="errorToast" class="toast align-items-center text-white bg-danger border-0" role="alert">
		        <div class="d-flex">
		            <div class="toast-body">
		                <!-- 에러가 발생했습니다. 다시 시도해 주세요. -->
		            </div>
		            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
		        </div>
		    </div>
		</div>
		<div class="position-fixed bottom-0 end-0 p-3">
		    <div id="successToast" class="toast align-items-center text-white bg-success border-0" role="alert">
		        <div class="d-flex">
		            <div class="toast-body">
		            </div>
		            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
		        </div>
		    </div>
		</div>
		
		<div class="mb-3 text-center">
			<button type="button" id="signup" class="btn btn-success">회원가입</button>
			<button type="button" id="cancel" class="btn btn-danger">취소</button>
		</div>
	</div>

</div>

</body>
</html>