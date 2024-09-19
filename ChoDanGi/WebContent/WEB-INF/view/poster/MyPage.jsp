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
<title>PosterMyPage.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	function readURL(input) 
	{
		if (input.files && input.files[0]) 
		{
			var reader = new FileReader();
			reader.onload = function(e) 
			{
			  document.getElementById('image').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} 
		else 
		{
			document.getElementById('image').src = "";
		}
	}

	$(function()
	{
		$("#imageBtn").click(function()
		{
			alert($(this).val());	
		});
		
		
		$("#submitBtn").click(function()
		{
			//alert("확인");	
			 $("#passwordModal").modal('show');
		});
		
		$("#confirmPasswordBtn").click(function() 
		{
			$("#alertBox").css("display", "none");
			
			var login_pw = $("#passwordInput").val().trim();
			
			if (login_pw == "")
			{
				$("#alertBox").css("display", "inline");
			}
			
			var p_id = $("#p_id").val().trim();
			//alert(pwd);
			//alert(p_id);
			
			$.post("pwdcheckajax.action", {login_pw : login_pw, p_id : p_id}, function(data) 
			{
				if (data > 0)	// 일치하는 패스워드일 때 
				{
					//alert(data);
					$("#submitForm").submit();
				}
				else
				{
					$("#alertBox").css("display", "inline");
				}
		            
			});
		});
		
		$("#pwdChangeBtn").click(function() 
		{
			$("#changePasswordModal").modal('show');
		});
		
		$("#changePasswordBtn").click(function() 
		{
			var p_id = $("#p_id").val().trim();
			//alert(p_id);
			var currentPassword = $("#currentPassword").val().trim();
			var newPassword = $("#newPassword").val().trim();
			var confirmNewPassword = $("#confirmNewPassword").val().trim();
			
			if (currentPassword == "" || newPassword === "" || confirmNewPassword === "" || newPassword !== confirmNewPassword) 
			{
				$("#passwordAlertBox").css("display", "inline");
				return;
			}
			
			$("#passwordAlertBox").css("display", "none");
			
			$.post("changepwdajax.action", {login_pw : newPassword, p_id : p_id}, function(data)
			{
				if (data>0)
				{
					alert("비밀번호가 성공적으로 변경되었습니다.");
			        $("#changePasswordModal").modal('hide');
			        window.location.href = "postermypage.action";
				}
				else
				{
					alert("비밀번호 변경에 실패하였습니다.");
				}
			});
			
			// 모달 닫기
			$("#changePasswordModal").modal('hide');
		});
		
	});

</script>


</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="mainpage.action">
            <img src="<%=cp %>/images/alba.jpg" class="img-fluid" style="width: 10%; display: inline-block; vertical-align: middle;" alt="CHODANGIALBA"/>
            <span class="d-inline-block align-middle ms-2" style="font-size: 40px;">CHODANGIALBA</span>
        </a>
        <div class="navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="postermypage.action">
                        <img src="<%=cp %>/images/my.png" style="width: 20px; height: 20px;" alt="MY PAGE"/> MY PAGE
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="jobpostingstatus.action">공고 현황</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="postinginsertform.action">공고 작성</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="posterbookmark.action">구직자 즐겨찾기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">평가리스트</a>
                </li>
            </ul>
            <!-- 오른쪽 끝에 로그아웃 버튼 -->
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.action">LOGOUT</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<div class="container my-4">
    <div class="row">
        <!-- 사이드 메뉴 -->
		<div class="col-md-2">
		    <div class="card mb-4">
		        <div class="card-header bg-info text-white text-center">
		            <h5 class="card-title mb-0">메뉴</h5>
		        </div>
		        <div class="list-group">
		            <a href="postermypage.action" class="list-group-item list-group-item-action active">마이페이지 수정</a>
		            <a href="endpostinglist.action" class="list-group-item list-group-item-action">채용 완료한 공고</a>
		            <a href="offerendlist.action" class="list-group-item list-group-item-action">제안 완료한 공고</a>
		            <a href="companylist.action" class="list-group-item list-group-item-action">회사 정보</a>
		        </div>
		    </div>
		</div>

        <!-- 내용 영역 -->
        <div class="col-md-10">
            <!-- 마이페이지 수정 내용 -->
            <div id="editPage" class="card mb-4">
                <div class="card-header bg-info text-white text-center">
                    <h5 class="card-title mb-0">${dto.login_id }님의 마이페이지</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3 text-center">
                        <img id="image" src="images/alba.jpg" class="rounded-circle" alt="Profile Picture" style="width: 150px; height: 150px; object-fit: cover;">
                        <div class="mb-3 text-center">
                            <input type="file" id="profileImage" name="profileImage" class="form-control d-inline-block" style="width: auto;"
                            onchange="readURL(this);" />
                            <button type="button" class="btn btn-info" id="imageBtn">변경</button>
                        </div>
                        <form action="postermypageupdateform.action" method="post" id="submitForm">
                            <input type="hidden" id="p_id" name="p_id" value="${dto.p_id }" />
                            <div class="mb-3">
                                <span class="text-dark fw-bold">아이디</span>
                                <input type="text" class="form-control text-center" name="login_id" value="${dto.login_id }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">비밀번호</span>
                                <input type="password" class="form-control text-center" name="login_pw" value="${dto.login_pw }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">이름</span>
                                <input type="text" class="form-control text-center" name="name" value="${dto.name }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">전화번호</span>
                                <input type="text" class="form-control text-center" name="tel" value="${dto.tel }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">주민번호 앞자리</span>
                                <input type="text" class="form-control text-center" name="ssn_front" value="${dto.ssn_front }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">이메일</span>
                                <input type="text" class="form-control text-center" name="email" value="${dto.email }" readonly="readonly" />
                            </div>
                            <div class="form-group md-2 text-center">
							    <div class="d-flex justify-content-center gap-2">
							        <button type="button" class="btn btn-success" id="pwdChangeBtn">비밀번호 변경</button>
							        <button type="button" class="btn btn-info" id="submitBtn">Edit</button>
							    </div>
							</div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- 비밀번호 확인 모달 -->
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="passwordModalLabel">비밀번호 확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<label for="passwordInput" class="form-label">현재 비밀번호</label>
					<input type="password" class="form-control" id="passwordInput" placeholder="현재 비밀번호 입력">
				</div>
				<div id="alertBox" class="alert alert-danger " role="alert" style="display: none;">
				    패스워드가 일치하지 않습니다.
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="confirmPasswordBtn">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="changePasswordModalLabel">비밀번호 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="changePasswordForm">
					<div class="mb-3">
						<label for="currentPassword" class="form-label">현재 비밀번호</label>
						<input type="password" class="form-control" id="currentPassword" placeholder="현재 비밀번호 입력">
					</div>
					<div class="mb-3">
						<label for="newPassword" class="form-label">새 비밀번호</label>
						<input type="password" class="form-control" id="newPassword" placeholder="새 비밀번호 입력">
					</div>
					<div class="mb-3">
						<label for="confirmNewPassword" class="form-label">새 비밀번호 확인</label>
						<input type="password" class="form-control" id="confirmNewPassword" placeholder="새 비밀번호 확인">
					</div>
					<div id="passwordAlertBox" class="alert alert-danger" role="alert" style="display: none;">
						비밀번호가 일치하지 않습니다.
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="changePasswordBtn">변경</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>