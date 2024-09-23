<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 날짜 형식
	DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	
	LocalDate today = LocalDate.now();
	LocalDateTime todayTime = LocalDateTime.now();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PostingInsertForm.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">

	$(function() 
	{
		var startDate = $("#startDate");
		var startTime = $("#startTime");
		var endDate = $("#endDate");
		var endTime = $("#endTime");
		var closingDate = $("#closingDate");
		var closingTime = $("#closingTime");
		
		// 시작 시간 기본값 설정
		if (getDays(getDate(new Date()), startDate.val()) == 0)	{
			
			var startHour = (new Date()).getHours() + 3;
			for (var i = startHour; i <= 24; i++) {
				startTime.append("<option value='" + i + "'>" + i + "</option>");
			}
		}
		
		// 시작 날짜 변경
		startDate.change(function() {
			var t = new Date();
			var today = getDate(t);
	
			endDate.val(startDate.val());
			closingDate.val(startDate.val());
			
			// 날짜 제한
			endDate.attr("min", startDate.val());
			closingDate.attr("max", startDate.val());
			
			// 날짜 초기화
			endDate.val("");
			closingDate.val("");
			
			// 시간 초기화
			startTime.empty();
			startTime.append("<option value='-1'>선택</option>");
			endTime.empty();
			endTime.append("<option value='-1'>선택</option>");
			closingTime.empty();
			closingTime.append("<option value='-1'>선택</option>");
			
			// 시작 시간의 최소값 : 현재 시간 + 3 / 최대값 : 23 or 24
			if (getDays(today, startDate.val()) == 0)
			{
				// 만약 선택한 날짜가 오늘인 경우
				var startHour = t.getHours() + 3;
				for (var i = startHour; i <= 23; i++)
					startTime.append("<option value='" + i + "'>" + i + "</option>");
			}
			else
			{
				for (var i = 0; i <= 23; i++)
					startTime.append("<option value='" + i + "'>" + i + "</option>");
			}
		});
		
		
		// 시작 시간 변경
		startTime.change(function() {
			
			var t = new Date();
			var today = getDate(t);
			
			// 날짜 초기화
			endDate.val("");
			closingDate.val("");
			
			// 시간 초기화
			endTime.empty();
			endTime.append("<option value='-1'>선택</option>");
			closingTime.empty();
			closingTime.append("<option value='-1'>선택</option>");
		});
		
		
		// 종료 날짜 변경
		endDate.change(function() {
			
			// 시작 날짜 시간을 입력하지 않았으면
			if (startTime.val() == '-1')
			{
				alert("시작 시간을 설정해주세요.");
				endDate.val("");
				startDate.focus();
			}
			
			// 종료 시간 초기화
			endTime.empty();
			endTime.append("<option value='-1'>선택</option>");
			
			if (getDays(startDate.val(), endDate.val()) == 0)
			{
				// 시작날짜와 종료날짜 같음
				var startHour = parseInt(startTime.val()) + 1;
				for (var i = startHour; i <= 23; i++)
				{
					endTime.append("<option value='" + i + "'>" + i + "</option>");
				}
			}
			else if (getDays(startDate.val(), endDate.val()) == 1 && startTime.val() == '24')
			{
				// 시작날짜 다음날이 종료날짜 && 시작 시간이 24시
				for (var i = 1; i <= 23; i++)
				{
					endTime.append("<option value='" + i + "'>" + i + "</option>");
				}
			}
			else
			{
				for (var i = 0; i <= 23; i++)
				{
					endTime.append("<option value='" + i + "'>" + i + "</option>");
				}
			}
		});

		
		// 지원서 마감 날짜 설정
		closingDate.change(function() {
			var t = new Date();
			var today = getDate(t);
			
			// 시작 날짜 시간을 입력하지 않았으면
			if (startTime.val() == '-1')
			{
				alert("시작 시간을 설정해주세요.");
				closingDate.val("");
				startDate.focus();
			}
			
			// 마감 시간 초기화
			closingTime.empty();
			closingTime.append("<option value='-1'>선택</option>");
			
			
			if (getDays(today, closingDate.val()) == 0)
			{
				// 선택한 마감 날짜가 오늘
				var startHour = t.getHours() + 1;

				if (getDays(closingDate.val(), startDate.val()) == 0)
				{
					// 선택한 마감 날짜가 오늘
					// 선택한 마감 날짜와 시작 날짜가 같음
					var endHour = startTime.val() - 2;
					for (var i = startHour; i <= endHour; i++)
					{
						closingTime.append("<option value='" + i + "'>" + i + "</option>");
					}
				}
				else if (getDays(closingDate.val(), startDate.val()) == 1 && startTime.val() == '0')
				{
					// 선택한 마감 날짜가 오늘
					// 선택한 마감 날짜 다음날이 시작 날짜 && 시작 시간이 0시
					for (var i = startHour; i <= 22; i++)
					{
						closingTime.append("<option value='" + i + "'>" + i + "</option>");
					}
				}
				else
				{
					// 선택한 마감 날짜가 오늘
					for (var i = startHour; i <= 23; i++)
					{
						closingTime.append("<option value='" + i + "'>" + i + "</option>");
					}
				}
			}
			else 
			{
				// 선택한 마감 날짜가 오늘이 아님
				var startHour = 0;
				
				if (getDays(closingDate.val(), startDate.val()) == 0)
				{
					// 선택한 마감 날짜가 오늘이 아님
					// 선택한 마감 날짜와 시작 날짜가 같음
					var endHour = startTime.val() - 2;
					for (var i = startHour; i <= endHour; i++)
					{
						closingTime.append("<option value='" + i + "'>" + i + "</option>");
					}
				}
				else if (getDays(closingDate.val(), startDate.val()) == 1 && startTime.val() == '0')
				{
					// 선택한 마감 날짜가 오늘이 아님
					// 선택한 마감 날짜 다음날이 시작 날짜 && 시작 시간이 0시
					for (var i = startHour; i <= 22; i++)
					{
						closingTime.append("<option value='" + i + "'>" + i + "</option>");
					}
				}
				else
				{
					// 선택한 마감 날짜가 오늘이 아님
					for (var i = startHour; i <= 23; i++)
					{
						closingTime.append("<option value='" + i + "'>" + i + "</option>");
					}
				}
			}
		});
		
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
	        if (closingDate.val() == "") { isValid = false; }
	        if (closingTime.val() == "-1") { isValid = false; }
	        if (startDate.val() == "") { isValid = false; }
	        if (startTime.val() == "-1") { isValid = false; }
	        if (endDate.val() == "") { isValid = false; }
	        if (endTime.val() == "-1") { isValid = false; }
	        if ($("#work_content").val() == "") { isValid = false; }
	        if ($("#headcount").val() == "") { isValid = false; }

	        // 입력값이 비어있으면 모달을 띄워 경고 메시지 표시
	        if (!isValid) 
	        {
	            $("#alertModal").modal('show'); // 모달 열기
	            return; // 폼 제출 중지
	        }
	        
			var today = getDate(new Date());
			
			// 새로운 스케줄의 시작 및 종료 시간을 DateTime 객체로 변환
			var start, end, closing;
			
			start = startDate.val() + " " + startTime.val() + ":00";
			end = endDate.val() + " " + endTime.val() + ":00";
			closing = closingDate.val() + " " + closingTime.val() + ":00";
			
			$("#submitForm").append($("<input>", {type:"hidden", name: "work_start_time", val: start}));
			$("#submitForm").append($("<input>", {type:"hidden", name: "work_end_time", val: end}));
			$("#submitForm").append($("<input>", {type:"hidden", name: "closing_time", val: closing}));
            
            $("#submitForm").submit();

		});	
	});
	
	// date가 들어오면 yyyy-mm-dd로
	function getDate(date)
	{
		var year = date.getFullYear();
		var month = ('0' + (date.getMonth() + 1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);
	
		var dateString = year + '-' + month  + '-' + day;
		return dateString;
	}
	
	// date가 들어오면 yyyy-mm-dd hh:mi로
	function getDateTime(date)
	{
		var year = date.getFullYear();
		var month = ('0' + (date.getMonth() + 1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);
		var hour = ('0' + date.getHours()).slice(-2);
		var min = ('0' + date.getMinutes()).slice(-2);
	
		var dateString = year + '-' + month  + '-' + day + ' ' + hour + ':' + min;
		return dateString;
	}
	
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
                
                <!-- 공개 여부 -->
                <div class="mb-3">
				    <label class="form-label">공개 여부</label>
				    <div>
				        <c:forEach var="status" items="${openstatusList}">
				            <div class="form-check">
				                <input class="form-check-input" type="radio" id="public_status_id${status.id}" name="public_status_id" value="${status.id}">
				                <label class="form-check-label" for="public_status_id${status.id}">
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
                
                
                <!-- 근무 시작 날짜와 시간 -->
                <div class="row mb-3">
                	<div class="col-sm-3"></div>
                	<div class="col-sm-2">
							<label for="startDate" class="form-label">시작 시간</label> 
						</div>
						<div class="col">
							<!-- 밤 10시 이후에는 다음날 부터 생성 가능 -->
							<input type="date" class="form-control" id="startDate" required="required"
							min="<%=todayTime.getHour() >= 22 ? today.plusDays(1) : today %>" 
							max="<%=today.plusDays(6) %>" >
						</div>
						<div class="col-auto">
							<select id="startTime" class="form-select">
								<option value='-1'>선택</option>
							</select>
						</div>
						<div class="col-auto">
							시
					</div>
                	<div class="col-sm-3"></div>
                </div>
                
                <!-- 근무 종료 날짜와 시간 -->
                <div class="row mb-3">
                	<div class="col-sm-3"></div>
                	<div class="col-sm-2">
							<label for="endDate" class="form-label">종료 시간</label> 
						</div>
						<div class="col">
							<input type="date" class="form-control" id="endDate" required="required"
							min="<%=todayTime.getHour() >= 22 ? today.plusDays(1) : today %>" 
							max="<%=today.plusDays(6) %>"/>
						</div>
						<div class="col-auto">
							<select id="endTime" class="form-select">
								<option value='-1'>선택</option>
							</select>
						</div>
						<div class="col-auto">
							시
					</div>	
                	<div class="col-sm-3"></div>
                </div>
                
                <!-- 모집 마감 날짜와 시간 -->
                <div class="row mb-3">
                	<div class="col-sm-3"></div>
                	<div class="col-sm-2">
							<label for="closingDate" class="form-label">지원서 마감 시간</label> 
						</div>
						<div class="col">
							<!-- 밤 10시 이후에는 다음날 부터 생성 가능 -->
							<input type="date" class="form-control" id="closingDate" required="required"
							min="<%=today %>" 
							max="<%=today %>">
						</div>
						<div class="col-auto">
							<select id="closingTime" class="form-select">
								<option value='-1'>선택</option>
							</select>
						</div>
						<div class="col-auto">
							시
					</div>
                	<div class="col-sm-3"></div>
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
