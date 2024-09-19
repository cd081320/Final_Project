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
<title>PostingInsertForm.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	$(function() 
	{
		$("#submitBtn").click(function()
		{
			// 유효성 검사
	        var isValid = true;

	        // 필수 입력값 확인
	        if ($("#pci_id").val() == "") { isValid = false; }
	        if ($("#title").val() == "") { isValid = false; }
	        if ($("#category_id").val() == "") { isValid = false; }
	        if ($("#gender_id").val() == "") { isValid = false; }
	        if (!$("input[name='public_status_id']:checked").val()) { isValid = false; }
	        if ($("#hourly_wage").val() == "") { isValid = false; }
	        if ($("#close_date").val() == "") { isValid = false; }
	        if ($("#close_time").val() == "") { isValid = false; }
	        if ($("#start_date").val() == "") { isValid = false; }
	        if ($("#start_time").val() == "") { isValid = false; }
	        if ($("#end_date").val() == "") { isValid = false; }
	        if ($("#end_time").val() == "") { isValid = false; }
	        if ($("#work_content").val() == "") { isValid = false; }
	        if ($("#headcount").val() == "") { isValid = false; }

	        // 입력값이 비어있으면 모달을 띄워 경고 메시지 표시
	        if (!isValid) 
	        {
	            $("#alertModal").modal('show'); // 모달 열기
	            return; // 폼 제출 중지
	        }
			
			
        	// 모집 마감 날짜와 시간 합치기
            var closing_date = $("#close_date").val();
            var closing_time = $("#close_time").val();
            var full_closing_time = closing_date + " " + closing_time;
            $("#closing_time").val(full_closing_time);
            alert("full_closing_time:"+full_closing_time);

            // 근무 시작 날짜와 시간 합치기
            var work_start_date = $("#start_date").val();
            var work_start_time = $("#start_time").val();
            var full_work_start_time = work_start_date + " " + work_start_time;
            $("#work_start_time").val(full_work_start_time);

            // 근무 종료 날짜와 시간 합치기
            var work_end_date = $("#end_date").val();
            var work_end_time = $("#end_time").val();
            var full_work_end_time = work_end_date + " " + work_end_time;
            $("#work_end_time").val(full_work_end_time);
            
            
            $("#submitForm").submit();

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
                    <a class="nav-link active" href="postermypage.action?loginId=${loginId }">
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
                    <a class="nav-link" href="posterbookmark.action?">구직자 즐겨찾기</a>
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



<div class="container mt-5">
    <div class="card mb-5">
        <div class="card-header bg-success text-white">
            <h3 class="card-title text-center">${loginId }님의 공고 작성</h3>
        </div>
        <div class="card-body">
            <form action="insertposting.action" method="post" id="submitForm">
            
            	<!-- 회사 선택 -->
            	<div class="mb-3">
                    <label for="pci_id" class="form-label">회사 선택</label>
                    	<select name="pci_id" id="pci_id" class="form-control">
                    	<option value="" selected="selected">선택</option>
                   		<c:forEach var="company" items="${companyList }">
                    		<option value="${company.pci_id }">${company.name }</option>
                   		</c:forEach>
                    </select>
                </div>
				
                <!-- 제목 -->
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="공고 제목을 입력해 주세요." required>
                </div>
                
                <!-- 분야 -->
                <div class="mb-3">
                    <label for="category_id" class="form-label">분야</label>
                    	<select name="category_id" id="category_id" class="form-control">
                    	<option value="" selected="selected">선택</option>
                   		<c:forEach var="category" items="${categoryList }">
                    		<option value="${category.id }">${category.name }</option>
                   		</c:forEach>
                    </select>
                </div>
                
                <!-- 원하는 성별 -->
                <div class="mb-3"> 
                	<label for="gender_id" class="form-label">원하는 성별</label>
                    	<select name="gender_id" id="gender_id" class="form-control">
                    	<option value="" selected="selected">선택</option>
                   		<c:forEach var="gender" items="${genderList }">
                    		<option value="${gender.id }">${gender.gender }</option>
                   		</c:forEach>
                    </select>
                </div>
                
                <div class="mb-3">
				    <label class="form-label">공개 여부</label>
				    <div>
				        <c:forEach var="status" items="${openstatusList}">
				            <div class="form-check">
				                <input class="form-check-input" type="radio" id="public_status_id" name="public_status_id" value="${status.id}">
				                <label class="form-check-label" for="public_status_id">
				                    ${status.state}
				                </label>
				            </div>
				        </c:forEach>
				    </div>
				</div>
                
                <!-- 시급 -->
                <div class="mb-3">
                    <label for="hourly_wage" class="form-label">시급</label>
                    <input type="text" class="form-control" id="hourly_wage" name="hourly_wage" required="required" value="9620">
                </div>
                
                
                <!-- 모집 마감 날짜와 시간 -->
                <div class="row">
                	<input type="hidden" id="closing_time" name="closing_time" value=""/>
                    <div class="col-md-6 mb-3">
                        <label for="closing_date" class="form-label">모집 마감 날짜</label>
                        <input type="date" class="form-control" id="close_date" name="close_date" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="closing_time" class="form-label">모집 마감 시간</label>
                        <input type="time" class="form-control" id="close_time" name="close_time" required>
                    </div>
                </div>
                
                <!-- 근무 시작 날짜와 시간 -->
                <div class="row">
                	<input type="hidden" id="work_start_time" name="work_start_time" value=""/>
                    <div class="col-md-6 mb-3">
                        <label for="work_start_date" class="form-label">근무 시작 날짜</label>
                        <input type="date" class="form-control" id="start_date" name="start_date" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="work_start_time" class="form-label">근무 시작 시간</label>
                        <input type="time" class="form-control" id="start_time" name="start_time" required>
                    </div>
                </div>
                
                <!-- 근무 종료 날짜와 시간 -->
                <div class="row">
                	<input type="hidden" id="work_end_time" name="work_end_time" value=""/>
                    <div class="col-md-6 mb-3">
                        <label for="work_end_date" class="form-label">근무 종료 날짜</label>
                        <input type="date" class="form-control" id="end_date" name="end_date" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="work_end_time" class="form-label">근무 종료 시간</label>
                        <input type="time" class="form-control" id="end_time" name="end_time" required>
                    </div>
                </div>
                
                <!-- 근무 내용 -->
                <div class="mb-3">
                    <label for="work_content" class="form-label">근무 내용</label>
                    <textarea class="form-control" id="work_content" name="work_content" rows="4" placeholder="근무 내용을 입력해 주세요." required></textarea>
                </div>
                
                <!-- 모집 인원수 -->
                <div class="mb-3">
                    <label for="headcount" class="form-label">모집 인원수 (최대 10 명)</label>
                    <input type="number" class="form-control" id="headcount" name="headcount" placeholder="모집 인원수를 입력해 주세요." required>
                </div>
                
                
                <!-- 제출 버튼 -->
                <button id="submitBtn" type="button" class="btn btn-primary w-100">공고 작성</button>
                
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title " id="alertModalLabel">알림</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			  모든 입력을 해야합니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>
