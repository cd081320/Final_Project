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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>구인자 회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">
	
	$(function()
	{
	    $("#idCheck").click(function()
	    {
	        $("#idError").css("display", "none");
	        $("#idSuccess").css("display", "none");
	
			$.post("ajax.action", { login_id: $("#login_id").val() }, function(data)
			{
				if (data > 0)
				{
					$("#idError").css("display", "inline");
					$("#login_id").val("").focus();
				}
				else if (data == 0 && $("#login_id").val() != "")
				{
					$("#idSuccess").css("display", "inline");
					$("#login_id").focus();
				}
			});
		});
	
		$("#posterEmail2").hide();
		
		$("#domainList").change(function()
		{
			if ($("#domainList").val() == "custom") 
			{
				$("#domainList").hide();
				$("#posterEmail2").show().focus();
			} 
			else 
			{
				$("#posterEmail2").hide();
			}
		});
		
		$("#submitBtn").click(function()
		{
			$("#error").css("display", "none");
			$("#pwdError").css("display", "none");
			$("#pwdSuccess").css("display", "none");
			$("#telError").css("display", "none");;
			$("#idCheckError").css("display","none");
			$("#emailError").css("display", "none");
		
			var login_id = $("#login_id").val().trim();
			var login_pw = $("#login_pw").val().trim();
			var login_pwCheck = $("#login_pwCheck").val().trim();
			var name = $("#name").val().trim();
			var tel = $("#tel").val().trim();
			var domainList = $("#domainList").val();
			var gender = $("input[name=gender]:checked").val();
			var ssn_front = $("#ssn_front").val();
			var posterEmail1 = $("#posterEmail1").val().trim();
			var posterEmail2 = $("#posterEmail2").is(":visible") ? $("#posterEmail2").val().trim() : $("#domainList").val();
			var email = posterEmail1 + posterEmail2;
			var flag = true;

			// 비밀번호 재확인
			if (!passwordCheck(login_pw))
			{
				$("#pwdError").html("비밀번호는 영문자, 숫자, 특수문자 포함 10 ~ 20 자 입니다.");
				$("#pwdError").css("display", "inline");
				flag = false;
			}
			else if (login_pw != login_pwCheck)
			{
				$("#pwdError").html("비밀번호가 일치하지 않습니다.");
				$("#pwdError").css("display", "inline");
				flag = false;
			}
			else if(login_pw != "" && login_pwCheck != "")
			{
				$("#pwdError").html("비밀번호가 일치하지 않습니다.");
				$("#pwdSuccess").css("display", "inline");
			}
			
			
			// 공백 유효성 검사
			if (login_id == "" || login_pw == "" || login_pwCheck == "" 
			|| name == "" || tel == "" || posterEmail1 == "" || ssn_front == "")
			{
				$("#error").css("display", "inline");
				flag = false;
			}
			
			if (!isValidPhone(tel)) 
			{
			    $("#telError").css("display", "inline");
			    flag = false;		
			}
			
			if (!validateEmail(email))
			{
			    $("#emailError").css("display", "inline");
			    flag = false;
			}
			
			if (flag)
			{
				// email input 추가
				$("#posterSignInForm").append($('<input/>', {type: "hidden", id:"test", name: "email", value: email }));
				
				alert("회원가입 성공");
			    $("#posterSignInForm").submit();
			}
  		});
		
		// 취소 버튼 액션
		$("#cancel").click(function() {
			if (confirm("정말로 취소하시겠습니까?\n취소하면 모든 내용이 사라집니다."))
			{
				$(location).attr("href", "loginform.action?memberType=poster");
			}
		});
	});
	
	// 비밀번호 확인 함수
	// 10자 이상 영문자 숫자 특수문자 포함
	function passwordCheck(password) {
		return new RegExp("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~!@#$%^&*?_-])[A-Za-z0-9~!@#$%^&*?_-].{10,20}$").test(password);
	}
	
	// 이메일 확인 함수
	function validateEmail(email)
	{
	    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	    return emailPattern.test(email);
	}
</script>

</head>
<body>

<div class="container">
    <header class="text-center my-3">
        <a href="loginform.action">
        	<img src="images/alba.jpg" class="img-fluid" style="width: 10%; display: inline-block; vertical-align: middle;"/>
        </a>
        <h1 style="display: inline-block; vertical-align: middle; margin-left: 10px;">CHODANGIALBA</h1>
    </header>
    
    <hr />
    
    <!-- 
    1. bg-
	용도: 배경 색상 설정
	예시: bg-primary, bg-success, bg-danger
	bg-primary는 부트스트랩의 기본 색상 중 하나인 파란색 배경을 적용합니다.
	bg-success는 성공을 나타내는 녹색 배경을 적용합니다.
	bg-danger는 경고를 나타내는 빨간색 배경을 적용합니다.
	2. mt-
	용도: 상단 여백 (margin-top) 설정
	예시: mt-1, mt-3, mt-5
	mt-1은 상단 여백을 최소값으로 설정합니다.
	mt-3은 중간 크기의 상단 여백을 설정합니다.
	mt-5는 최대 크기의 상단 여백을 설정합니다.
	3. mb-
	용도: 하단 여백 (margin-bottom) 설정
	예시: mb-1, mb-3, mb-5
	mb-1은 하단 여백을 최소값으로 설정합니다.
	mb-3은 중간 크기의 하단 여백을 설정합니다.
	mb-5는 최대 크기의 하단 여백을 설정합니다.
	4. my-
	용도: 상하 여백 (margin-top과 margin-bottom) 설정
	예시: my-1, my-3, my-5
	my-1은 상하 여백을 최소값으로 설정합니다.
	my-3은 중간 크기의 상하 여백을 설정합니다.
	my-5는 최대 크기의 상하 여백을 설정합니다.
    -->

    <div class="card">
        <div class="card-header bg-success text-white">
            <h3 class="card-title">구인자 회원 가입</h3>
        </div>
        <div class="card-body">
            <form action="postersignup.action" method="post" id="posterSignInForm">
                <div class="mb-3">
			    <label for="login_id" class="form-label">아이디 <sup style="color: red;">※</sup></label>
			    <div class="input-group">
			        <input type="text" id="login_id" name="login_id" class="form-control" maxlength="30" required="required" placeholder="아이디 입력(영문 4~10자리)" />
			        <span class="input-group-btn">
			            <button type="button" id="idCheck" class="btn btn-primary">중복 확인</button>
			        </span>
			    </div>
			    <span id="idError" class="text-danger" style="display: none;">이미 존재하는 아이디가 있습니다.</span>
			    <span id="idSuccess" class="text-success" style="display: none;">사용 가능한 아이디 입니다.</span>
				</div>
			
				<div class="mb-3">
				    <label for="login_pw" class="form-label">비밀번호 <sup class="text-danger">※</sup></label>
				    <input type="password" id="login_pw" name="login_pw" class="form-control" maxlength="30" required="required" placeholder="비밀번호 입력(문자 숫자 특수문자 포함 영문 10~20자리)" />
				</div>
					
				<div class="mb-3">
				    <label for="login_pwCheck" class="form-label">비밀번호 확인 <sup style="color: red;">※</sup></label>
				    <input type="password" id="login_pwCheck" name="login_pwCheck" class="form-control" maxlength="30" required="required" placeholder="비밀번호 재입력" />
				    <span id="pwdError" class="text-danger" style="display: none;"></span>
				    <span id="pwdSuccess" class="text-success" style="display: none;">비밀번호가 일치합니다.</span>
				</div>
				
				<div class="mb-3">
				    <label for="name" class="form-label">이름 <sup class="text-danger">※</sup></label>
				    <input type="text" id="name" name="name" class="form-control" maxlength="30" required="required" placeholder="이름을 입력하세요" />
				</div>
				
				<div class="mb-3">
				    <label class="form-label" for="gender">성별 <sup class="text-danger">※</sup></label>
            		<div class="form-check">
				    	<input class="form-check-input" type="radio" id="male" name="gender_id" value="1" checked="checked">
					    <label class="form-check-label" for="male">
					    	남성
					    </label>
					</div>
					<div class="form-check">
				    	<input class="form-check-input" type="radio" id="female" name="gender_id" value="2">
					    <label class="form-check-label" for="female">
					    	여성
					    </label>
					</div>
				</div>
				
				
				<div class="mb-3">
				    <label for="tel" class="form-label">전화번호 <sup class="text-danger">※</sup></label>
				    <input type="tel" id="tel" name="tel" class="form-control" maxlength="30" required="required" placeholder="휴대폰 번호 입력" />
				    <span id="telError" class="text-danger" style="display: none;">유효한 전화번호 형식이 아닙니다.</span>
				</div>
				
				<div class="mb-3">
				    <label for="posterEmail1" class="form-label">이메일 주소 <sup class="text-danger">※</sup></label>
				    <div class="input-group">
				        <input type="text" id="posterEmail1" name="posterEmail1" class="form-control" required="required" placeholder="이메일 주소" />
				        <span class="input-group-addon">@</span>
				        <input type="text" id="posterEmail2" name="posterEmail2" class="form-control" />
				        <select id="domainList" class="form-select">
				            <option value="" selected="selected">선택</option>
				            <option value="@naver.com">naver.com</option>
				            <option value="@hanmail.net">hanmail.net</option>
				            <option value="@google.com">google.com</option>
				            <option value="@nate.com">nate.com</option>
				            <option value="custom">직접 입력</option>
				        </select>
				    </div>
				    <span id="emailError" class="text-danger" style="display: none;">유효한 이메일 주소를 입력하세요.</span>
				</div>
				
				<div class="mb-3">
					<label for="ssn_front">생년월일 <sup class="text-danger">※</sup></label>
					<input type="text" id="ssn_front" name="ssn_front" class="form-control" required="required" placeholder="YYMMDD"/>
				</div>
				

                <div class="form-group mb-3 text-center">
                    <button type="button" class="btn btn-success" id="submitBtn">회원 가입</button>
                    <button type="button" class="btn btn-danger" id="cancel">취소</button>
                    <br />
                    <span id="error" class="text-danger" style="display: none;">필수 입력 사항을 모두 입력해야 합니다.</span>
                </div>
            </form>
        </div>
    </div>
    
    <div class="mb-5"></div> <!-- 빈 공간 추가 -->
</div>

</body>
</html>
