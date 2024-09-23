<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	StringBuffer sb = new StringBuffer();
	
	// 날짜 형식
	DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	
	LocalDate today = LocalDate.now();
	LocalDateTime todayTime = LocalDateTime.now();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스케쥴러</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<style>
        .table thead th {
            text-align: center;
            background-color: #f8f9fa;
        }

        .table tbody td {
            vertical-align: middle;
        }

        .form-control {
            width: 100%;
            height: 100%;
            padding: 5px;
        }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<!-- FullCalendar JS -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.js"></script>

<!-- oaList 데이터를 자바스크립트 배열로 변환 -->
<script type="text/javascript">
	var oaList = [];
	<c:forEach var="oa" items="${oaList}">
		oaList.push({
			id: parseInt(${oa.id}),
			start_date: '${oa.start_date}',
			end_date: '${oa.end_date}'
		});
	</c:forEach>;
</script>

<!-- modal 액션 처리 -->
<script type="text/javascript">
	
	$(function() {
		
		var closingDate = $("#closingDate");
		var startDate = $("#startDate");
		var endDate = $("#endDate");
		var closingTime = $("#closingTime");
		var startTime = $("#startTime");
		var endTime = $("#endTime");		

		
		// 시작 시간 기본값 설정
		if (getDays(getDate(new Date()), startDate.val()) == 0)
		{
			var startHour = (new Date()).getHours() + 3;
			for (var i = startHour; i <= 24; i++)
			{
				startTime.append("<option value='" + i + "'>" + i + "</option>");
			}
		}
		
		// 시작 날짜 변경
		startDate.change(function() {

			var today = getDate(new Date());
	
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
			var t = new Date();
			if (getDays(getDate(t), startDate.val()) == 0)
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

		// submit 액션
		$("#saveScheduleBtn").click(function() {
			
			
			// 폼 유효성 검사
			if (startDate.val() == "" || startTime.val() == '-1' 
					|| endDate.val() == "" || endTime.val() == '-1' 
					|| closingDate.val() == "" || closingTime.val() == '-1')
			{
				alert("모든 필드를 입력하세요.");
				return;
			}

			var today = getDate(new Date());
			
			// 새로운 스케줄의 시작 및 종료 시간을 DateTime 객체로 변환
			var start, end, closing;
			
			start = startDate.val() + " " + startTime.val() + ":00";
			end = endDate.val() + " " + endTime.val() + ":00";
			closing = closingDate.val() + " " + closingTime.val() + ":00";
			
			var newStart = new Date(start);
			var newEnd = new Date(end);
			var newClosing = new Date(closing);

			// end와 closing 1초씩 감소
// 			newEnd.setMinutes(newEnd.getMinutes() - 1);
// 			newClosing.setMinutes(newClosing.getMinutes() - 1);
			
// 			end = getDateTime(newEnd);
// 			closing = getDateTime(newClosing);
			
			// 스케줄 겹치는지 확인
			for (var i = 0; i < oaList.length; i++) {
				var oa = oaList[i];
				var oaStart = new Date(oa.start_date); // 기존 스케줄 시작 시간
				var oaEnd = new Date(oa.end_date); // 기존 스케줄 종료 시간

				// 겹치는 조건: 새로운 스케줄의 시작이 기존 스케줄 안에 있거나, 끝나는 시간이 기존 스케줄 안에 있는 경우
				if ((newStart >= oaStart && newStart <= oaEnd) || (newEnd >= oaStart && newEnd <= oaEnd) || (newStart <= oaStart && newEnd >= oaEnd)) 
				{
					alert("해당 시간대에 이미 스케줄이 존재합니다. 다른 시간대를 선택해주세요.");
					return;
				}
			}
			
			// 겹치는 스케줄이 없으면 데이터를 서버로 전송
			var formData = {
				start_date : start,
				end_date : end,
				closing_date : closing
			};

			// AJAX 요청으로 서버에 데이터 전송
			$.ajax({
				url: "saveoa.action", // 서버의 스케줄 저장 처리 URL로 수정
				type: "POST",
				data: formData,
				success: function(response) {
					// 성공 시 알림 및 페이지 리로드
					alert("스케줄이 성공적으로 저장되었습니다!");
					location.reload();
				},
				error: function() {
					// 오류 처리
					alert("스케줄 저장 중 오류가 발생했습니다. 다시 시도해 주세요.");
				}
			});
		});
		
		// 모달 액션
		$("#addSchedule").click(function() {
			$("#scheduleModal").modal('show');
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

<!-- 스케쥴러 이벤트 -->
<script type="text/javascript">

	$(function() {
	    var calendarEl = document.getElementById('calendar');
	    
	    var today = new Date(); // 오늘 날짜
	    
	    // 현재 존재하는 이벤트 등록
	    var events = [];
	    for (var i = 0; i < oaList.length; i++) 
	    {
	    	var oa = oaList[i]
	    	events.push({
                title: 'open',
                id: oa.id,
                start: new Date(oa.start_date), // 시작 시간
                end: new Date(oa.end_date), // 종료 시간
            });
		}
	    
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	views: {
	            customSevenDay: {
	                type: 'timeGrid', // 시간 그리드 사용
	                duration: { days: 7 }, // 7일간 표시
	                buttonText: '7일' // 버튼에 표시될 텍스트
	            }
	        },
	        initialView: 'customSevenDay',
	        locale: 'ko', // 한국어로 설정
	        timeZone: 'local', // 로컬 타임존 사용
	        headerToolbar: {
		        left: '',       // 이전, 다음 버튼 제거
		        center: '', // 캘린더 제목만 가운데 표시
		        right: ''       // Today 버튼 제거
		    },
		    height: 655,
	        visibleRange: {
	            start: new Date(today.getFullYear(), today.getMonth(), today.getDate()), // 오늘 날짜
	            end: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 7) // 오늘부터 7일 후
	        },
	        events: events,
	        selectable: true,
	        allDaySlot: false,
	        eventOverlap: true, // 이벤트가 겹칠 수 있도록 설정
	        slotEventOverlap: true, // 슬롯에서도 이벤트 겹침을 허용
	        slotDuration: '01:00:00',
	        slotLabelInterval: '01:00',
	        eventClick: function(info) {  // 이벤트 클릭 시 모달 표시
	            // 클릭한 이벤트의 상세 정보를 모달에 표시
	            $("#eventTitle").text(info.event.title);
	            $("#eventDescription").text("");
	            $("#eventTimeStart").text('시작: ' + info.event.start.toLocaleString());
	            $("#eventTimeEnd").text('종료: ' + info.event.end.toLocaleString());
	            
	            // 버튼에 oa id 넣기
	            $("#confirmOffer").val(info.event.id);
	            $("#searchPosting").val(info.event.id);
	            $("#deleteOA").val(info.event.id);
	            
	            // 모달 보여주기
	            var eventModal = new bootstrap.Modal(document.getElementById('eventModal'), {});
	            eventModal.show();
	        },
	    });
	
	    calendar.render();
	    
	    // 제안 확인
	    $("#confirmOffer").click(function() {
	    	$(location).attr("href", "confirmoffer.action?id=" + $(this).val());
		});
	    
	    // 공고 찾기(조건)
	    $("#searchPosting").click(function() {
			$(location).attr("href", "searchposting.action?id=" + $(this).val());
		});
	    
	    // 지원서 삭제
	    $("#deleteOA").click(function() {
			if(confirm("정말로 삭제하시겠습니까?"))
			{
				$(location).attr("href", "deleteoa.action?id=" + $(this).val());
			}
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
                    <a class="nav-link" href="seekermypage.action">
                        <img src="<%=cp %>/images/my.png" style="width: 20px; height: 20px;" alt="MY PAGE"/> MY PAGE
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="oastatus.action">지원 현황</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="scheduler.action">스케쥴러</a>
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

<div class="container">
	<h1 class="text-center my-4">스케쥴러</h1>
	
	<!-- 스케쥴러 추가 -->
	<div class="row mb-3">
		<div class="col text-end">
			<button type="button" class="btn btn-success" id="addSchedule">추가</button>
		</div>
	</div>
	
	<!-- 스케쥴러 출력 -->
	<div id="calendar"></div>
	
</div>


<div class="modal fade" id="scheduleModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="scheduleModalLabel">새로운 지원서 오픈 시간 설정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<div class="modal-body">
				<!-- 모달 안에 들어갈 폼 또는 내용 -->
				<form id="scheduleForm" action="" method="post">
					<!-- 모집 시작 시간 -->
					<div class="row text-center mb-3">
						<div class="col-sm-4">
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
					</div>
					<!-- 모집 종료 시간 -->
					<div class="row text-center mb-3">
						<div class="col-sm-4">
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
					</div>
					<!-- 마감 종료 시간 -->
					<div class="row text-center mb-3">
						<div class="col-sm-4">
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
					</div>
					
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="saveScheduleBtn">저장</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 이벤트 상세 정보 모달 -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventTitle">이벤트 제목</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="eventDescription">이벤트 설명</p>
                <p id="eventTimeStart">이벤트 시작 시간</p>
                <p id="eventTimeEnd">이벤트 종료 시간</p>
            </div>
            <div class="modal-footer">
            	<span class="badge" id="offerCount">1</span>
                <button type="button" class="btn btn-primary" id="confirmOffer">제안 확인</button>
                <button type="button" class="btn btn-primary" id="searchPosting">공고 찾기</button>
                <button type="button" class="btn btn-primary" id="deleteOA">삭제</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>