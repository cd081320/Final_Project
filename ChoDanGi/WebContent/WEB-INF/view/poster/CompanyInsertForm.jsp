<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CompanyInsertForm.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fa5de574eb1adb2fa2fb2983484fc7a&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode()
    {
        new daum.Postcode({
            oncomplete: function(data)
            {
            	
            	var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 도로명 주소 선택
                    addr = data.roadAddress;
                } else { // 지번 주소 선택
                    addr = data.jibunAddress;
                }

                // 법정동으로 필터링
                if (data.bname) {
                    var legalDongPattern = /^[가-힣]+[동]$/;
                    if (legalDongPattern.test(data.bname)) {
                        extraAddr = data.bname;
                    } else {
                        extraAddr = ''; // 법정동이 아닌 경우 빈 문자열
                    }
                } else {
                    extraAddr = ''; // bname이 없는 경우
                }

                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    
    $(function()
    {
        $("#submitBtn").click(function()
        {
        	$("#alert").css("display", "none");
        	
            var name = $("#name").val().trim();    
            var postaddr = $("#sample6_postcode").val().trim();    
            var location = $("#sample6_detailAddress").val().trim();    
            var details = $("#details").val().trim();    
            var business_id = $("#business_id").val().trim();    
            var sample6_extraAddress = $("#sample6_extraAddress").val().trim();    
            
            if (name == "" || postaddr == "" || location == "" || details == "" || sample6_extraAddress == "") 
            {
                $("#alert").css("display", "inline");
                return;
            }
            
            $("#submitForm").submit();
        });
    });
    
</script>
</head>
<body>


<!-- ○ 각자 발급받은 App Key -->
<!-- 	appkey=6fa5de574eb1adb2fa2fb2983484fc7a -->

<!-- ○ 지도의 중심 좌표(→ 풍성빌딩) -->
<!-- 	37.5565389, 126.9195136 -->

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
		            <a href="postermypage.action" class="list-group-item list-group-item-action">마이페이지 수정</a>
		            <a href="endpostinglist.action" class="list-group-item list-group-item-action">채용 완료한 공고</a>
		            <a href="offerendlist.action" class="list-group-item list-group-item-action">제안 완료한 공고</a>
		            <a href="companylist.action" class="list-group-item list-group-item-action active">회사 정보</a>
		        </div>
		    </div>
		</div>

        <!-- 내용 영역 -->
        <div class="col-md-10">
            <!-- 마이페이지 수정 내용 -->
            <div id="editPage" class="card mb-4">
                <div class="card-header bg-info text-white text-center">
                    <h5 class="card-title mb-0">${loginId }님의 회사정보 추가</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3 text-center">
                        <form action="companyinsert.action" method="post" id="submitForm">
                            <div class="mb-3">
                                <span class="text-dark fw-bold">회사명</span>
                                <input type="text" id="name" name="name" class="form-control text-center"/>
                            </div>
                            <div class="mb-3 form-control">
							    <label for="sample6_postcode" class="form-label text-dark fw-bold">회사 위치</label>
							    <div class="input-group">
							        <input type="text" id="sample6_postcode" name="postaddr" class="form-control" placeholder="우편번호" readonly="readonly">
							        <button class="btn btn-outline-secondary" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
							    </div>
							    <input type="text" id="sample6_address" class="form-control mt-2" placeholder="주소" readonly="readonly">
							    <input type="text" id="sample6_detailAddress" name="location" class="form-control mt-2" placeholder="상세주소">
							    <input type="text" id="sample6_extraAddress" name="extraAddr" class="form-control mt-2" placeholder="참고항목" readonly="readonly">
							</div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">회사 상세 정보</span>
                                <textarea name="details" id="details" cols="10" rows="5" class="form-control"></textarea>
                            </div>
                            <div class="mb-3">
                                <span class="text-dark fw-bold">사업자 등록 번호</span>
                                <input type="text" id="business_id" name="business_id" class="form-control text-center" />
                            </div>
                            <div class="form-group md-2 text-center">
                                <button type="button" class="btn btn-info" id="submitBtn">입력</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="alert alert-warning alert-dismissible" role="alert" style="display: none;" id="alert">
	<strong>경고!</strong> 모든 항목을 입력해야 합니다.
	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

</body>
</html>