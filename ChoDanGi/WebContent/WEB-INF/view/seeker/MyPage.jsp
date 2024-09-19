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
<title>구직자 마이페이지</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#imageBtn").click(function()
		{
			//alert($("#profileImage").val());
			//--==>> C:\fakepath\alba.jpg
			$(location).attr("href", "profileimageupload.action?profileImage=" + $("#profileImage").val());
		});
		
		// 비밀번호 변경 시 모달 켜기
		$("#pwChange").click(function() {
			$("#updatePwModal").modal('show');
		});
		
		// 변경 입력시
		$("#pwUpdateBtn").click(function() {
			
			var cur_pw = $("#cur_pw").val();
			var login_pw = $("#login_pw").val();
			var login_pw_check = $("#login_pw_check").val();
			if (cur_pw == "" || login_pw == "" || login_pw_check == "")
			{
				$("#errorMsg").html("비밀번호를 입력해주세요.");
				$("#errorMsg").attr("class", "text-danger text-sm");
				return;
			}
			
			if (cur_pw == login_pw)
			{
				$("#errorMsg").html("동일한 비밀번호입니다.");
				$("#errorMsg").attr("class", "text-danger text-sm");
				return;
			}
			
			// 변경 성공 실패 확인용
			$.post("seekerpwupdate.action", {cur_pw:cur_pw, login_pw:login_pw}, function(result) {
				
				if (result == 0)
				{
					// 실패
					alert("변경에 실패했습니다. 현재 비밀번호를 다시 확인해주세요.");
					return;
				}
				else
				{
					// 성공
					alert("변경에 성공했습니다.");
					$(location).attr("href", "seekermypage.action");
					return;
				}
			});
			
			// $("#pwUpdateForm").submit();
		});
		
		// 비밀번호 확인
		$("#login_pw").keyup(function() {
			
			// 유효한 비밀번호가 아닐 때
			if(!passwordCheck($(this).val()))
			{
				// 실패
				$("#errorMsg").html("유효하지 않은 비밀번호입니다.");
				$("#errorMsg").attr("class", "text-danger text-sm");
				return;
			}
			
			// 성공
			$("#errorMsg").html("사용 가능한 비밀번호입니다.");
			$("#errorMsg").attr("class", "text-success text-sm");
		});
		
		// 비밀번호 체크 확인
		$("#login_pw_check").keyup(function() {
			
			// 유효한 비밀번호가 아닐 때
			if(!passwordCheck($(this).val()))
			{
				// 실패
				$("#errorMsg").html("유효하지 않은 비밀번호입니다.");
				$("#errorMsg").attr("class", "text-danger text-sm");
				return;
			}
			
			// 입력한 비밀번호와 확인이 서로 다를 때
			if ($(this).val() != $("#login_pw").val())
			{
				$("#errorMsg").html("입력한 비밀번호와 일치하지 않습니다.");
				$("#errorMsg").attr("class", "text-danger text-sm");
				return;
			}
			
			$("#errorMsg").html("사용 가능한 비밀번호입니다.");
			$("#errorMsg").attr("class", "text-success text-sm");
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
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="seekermypage.action">
                        <img src="<%=cp %>/images/my.png" style="width: 20px; height: 20px;" alt="MY PAGE"/> MY PAGE
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="oastatus.action">지원 현황</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="scheduler.action">스케쥴러</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="postinglist.action">공고 리스트</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">업체 즐겨찾기</a>
                </li>
            </ul>
        </div>
   		<a class="navbar-brand" href="logout.action">
		    <span class="d-inline-block align-middle ms-2" style="font-size: medium;">logout</span>
		</a>
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
		            <a href="seekermypage.action" class="list-group-item list-group-item-action active">마이페이지 수정</a>
		            <a href="#" class="list-group-item list-group-item-action">test</a>
		        </div>
		    </div>
		</div>

        <!-- 내용 영역 -->
        <div class="col-md-10">
            <!-- 마이페이지 수정 내용 -->
            <div id="editPage" class="card mb-4">
                <div class="card-header bg-info text-white text-center">
                    <h5 class="card-title mb-0">${dto.nickname }님의 마이페이지</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3 text-center">
                        <img src="images/alba.jpg" class="rounded-circle" alt="Profile Picture" style="width: 150px; height: 150px; object-fit: cover;">
                        <div class="mb-3 text-center">
                            <input type="file" id="profileImage" name="profileImage" class="form-control d-inline-block" style="width: auto;" />
                            <button type="button" class="btn btn-info" id="imageBtn">변경</button>
                        </div>
                        
                        
                        <form action="seekermypageupdateform.action" method="post">
                            <div class="mb-3">
                                <span class="text-dark fw-bold">아이디</span>
                                <input type="text" class="form-control text-center" name="login_id" value="${dto.login_id }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">이름</span>
                                <input type="text" class="form-control text-center" name="name" value="${dto.name }" readonly="readonly" />
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">닉네임</span>
                                <input type="text" class="form-control text-center" name="nickname" value="${dto.nickname }" readonly="readonly" />
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
                            <div class="form-group mb-3 text-center">
                                <button type="button" class="btn btn-danger text-right" id="pwChange">비밀번호 변경</button>
                                <button type="submit" class="btn btn-info" id="submitBtn">Edit</button>
                            </div>
                        </form>
                        
                        
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- 구직자 비밀번호 변경 모달 -->
<div class="modal fade" id="updatePwModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="applicantInfoModalLabel">비밀번호 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<div class="modal-body">
			
				<form action="seekerpwupdate.action" method="post" id="pwUpdateForm">
					<div class="row text-center mb-3">
						<div class="col-sm-6">
							<label for="cur-pw" class="col-form-label">현재 비밀번호</label>
						</div>
						<div class="col-auto">
							<input type="text" name="cur_pw" id="cur_pw" class="form-control" />
						</div>
					</div>
					<div class="row text-center mb-3">
						<div class="col-sm-6">
							<label for="login_pw" class="col-form-label">새로운 비밀번호</label>
						</div>
						<div class="col-auto">
							<input type="text" id="login_pw" name="login_pw" class="form-control" />
						</div>
					</div>
					<div class="row text-center mb-3">
						<div class="col-sm-6">
							<label for="login_pw_check" class="col-form-label">비밀번호 확인</label>
						</div>
						<div class="col-auto">
							<input type="text" id="login_pw_check" name="login_pw_check" class="form-control" />
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<span id="errorMsg" class="text-danger text-sm"></span>
				<button type="button" class="btn btn-success" id="pwUpdateBtn">변경</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>