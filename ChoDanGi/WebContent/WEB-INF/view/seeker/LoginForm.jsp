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
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript">
    $(function() {
        var login_id = getCookie("seeker_login_id");
        $("#login_id").val(login_id);

        if ($("#login_id").val() != "") {
            $("#remember-check").attr("checked", true);
        }

        $("#remember-check").change(function() {
            if ($("#remember-check").is(":checked")) {
                setCookie("seeker_login_id", $("#login_id").val(), 7);
            } else {
                deleteCookie("seeker_login_id");
            }
        });

        $("#login_id").keyup(function() {
            if ($("#remember-check").is(":checked")) {
                setCookie("seeker_login_id", $("#login_id").val(), 7);
            }
        });

        $("#login-form").on("submit", function(event) {
            event.preventDefault();
            var id = $("#login_id").val();
            var pw = $("#login_pw").val();

            $.post("seekerloginajax.action", { login_id: id, login_pw: pw }, function(data) {
                data = parseInt(data);
                if (data > 0) {
                    alert("로그인 성공");
                    $(location).attr("href", "seekermainpage.action");
                } else {
                    alert("로그인 실패");
                    $(location).attr("href", "seekerlogin.action");
                }
            });
        });
    });
</script>
</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg bg-light">
        <a class="navbar-brand" href="seekermainpage.action">
            <img src="<%=cp %>/images/alba.jpg" class="img-fluid" style="width: 10%; display: inline-block; vertical-align: middle;" alt="CHODANGIALBA"/>
            <span class="d-inline-block align-middle ms-2" style="font-size: 28px; font-weight: bold;">CHODANGIALBA</span>
        </a>
    </nav>
</div>
<br /><br />
<br /><br />
<div class="d-flex align-items-center justify-content-center">
	<div class="container" style="max-width: 400px;">
	    <div class="card shadow-sm">
	        <div class="card-header text-center bg-primary text-white">
	            <h3>구직자 로그인</h3>
	        </div>
	        <div class="card-body">
	            <!-- 구직자, 구인자, 관리자 탭 -->
	            <div class="mb-3 text-center">
	                <ul class="nav nav-tabs justify-content-center">
	                    <li class="nav-item">
	                        <a href="loginform.action?memberType=seeker" class="nav-link active">구직자</a>
	                    </li>
	                    <li class="nav-item">
	                        <a href="loginform.action?memberType=poster" class="nav-link">구인자</a>
	                    </li>
	                    <li class="nav-item">
	                        <a href="loginform.action?memberType=admin" class="nav-link">관리자</a>
	                    </li>
	                </ul>
	            </div>
	
	            <form method="post" action="seekerlogin.action" id="login-form">
	                <!-- 아이디 필드 -->
	                <div class="form-floating mb-3">
	                    <input type="text" id="login_id" name="login_id" class="form-control" placeholder="ID">
	                    <label for="login_id">ID</label>
	                </div>
	                <!-- 비밀번호 필드 -->
	                <div class="form-floating mb-3">
	                    <input type="password" id="login_pw" name="login_pw" class="form-control" placeholder="Password">
	                    <label for="login_pw">PW</label>
	                </div>
	                <!-- 아이디 저장 체크박스 -->
	                <div class="form-check mb-3">
	                    <input class="form-check-input" type="checkbox" id="remember-check">
	                    <label for="remember-check" class="form-check-label">아이디 저장하기</label>
	                </div>
	                <!-- 로그인 버튼 -->
	                <button type="submit" class="btn btn-primary w-100">로그인</button>
	            </form>
	        </div>
	        <div class="card-footer text-center">
	            <a href="seekersignupform.action" class="btn btn-link">회원가입</a>
	            <a href="seekerfindidform.action" class="btn btn-link">아이디 찾기</a>
	            <a href="seekerchangepwform.action" class="btn btn-link">비밀번호 변경</a>
	        </div>
	    </div>
	</div>
</div>

</body>
</html>
