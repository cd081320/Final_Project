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
<title>지원/제안 현황</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		// 공고 상세 보기
		$(".posting").click(function() {
			$(location).attr("href", "posting.action?id=" + $(this).val());
		});
		
		// 지원 취소
		$("#cancel").click(function() {
			$.post("seekercancelapplication.action", {posting_id: $(this).val(), s_id: <%=(int)session.getAttribute("seeker") %>}, function(data) {
				alert("지원을 취소하였습니다.");
				location.reload();
			});			
		});
		
		// 수락
		$("#yes").click(function() {
			$.post("seekeracceptoffer.action", {id: $(this).val()}, function(data) {
				alert("수락되었습니다.");
				location.reload();
			});
		});
		
		// 거절 및 공고 지원 수락한 구인자에 대한 최종 거절
		$("#no").click(function() {
			
			$.post("seekerdeclineoffer.action", {id: $(this).val()}, function(data) {
				alert("거절되었습니다.");
				location.reload();
			});
		});
		
		// 공고 지원 수락한 구인자에 대한 최종 수락
		$("#finalYes").click(function() {
			$.post("seekerfinalaccept.action", {id: $(this).val()}, function() {
				alert("최종 수락 되었습니다.");
				location.reload();
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
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="seekermypage.action">
                        <img src="<%=cp %>/images/my.png" style="width: 20px; height: 20px;" alt="MY PAGE"/> MY PAGE
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="oastatus.action">지원 현황</a>
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
		<div class="col">
			<div class="card mb-4">
				<div class="card-header">
					<div>
						<span class="text-primary">지원 현황</span>
					</div>
				</div>
				<div class="card-body">
				<!-- 
					<div class="d-flex justify-content-between">
						<div class="badge-container">
							<span class="badge bg-secondary"> 채용 대기 </span> 
							<span class="badge bg-secondary">0</span> 
							<span class="badge bg-danger"> 채용 마감 </span> 
							<span class="badge bg-secondary">0</span> 
							<span class="badge bg-primary"> 채용 중 </span> 
							<span class="badge bg-secondary">0</span> 
							<span class="badge bg-primary"> 근무 대기 </span> 
							<span class="badge bg-secondary">0</span> 
							<span class="badge bg-success"> 근무 완료 </span> 
							<span class="badge bg-secondary">0</span>
						</div>
					</div>
					 -->
				
					<div class="row">
						<c:forEach var="dto" items="${appList }">
							<div class="col-md-6 mb-4">
								<div class="card">
									<div class="card-header">
										<h5>${dto.title}</h5>
									</div>
									<div class="card-body">
										<div class="form-control">
											<span class="text-black">상태 :</span> 
											<span class="badge bg-secondary">${dto.state}</span>
										</div>
										<div class="form-control">
											<span class="text-black">모집 인원 수 :</span> 
											<span class="badge bg-secondary">${dto.headcount}</span>
										</div>
										<div class="form-control">
											<span class="text-black">지원자 수 :</span> 
											<span class="badge bg-secondary">${dto.count}</span>
										</div>
										<div class="form-control">
											<span class="text-black">공고 마감시간 :</span> 
											<span class="badge bg-secondary">${dto.closing_time}</span>
										</div>
										<div class="form-control">
											<span class="text-black">시급 :</span> 
											<span class="badge bg-secondary">${dto.hourly_wage}</span>
										</div>
										<div class="form-control">
											<span class="text-black">회사/업체명 :</span> 
											<span class="badge bg-secondary">${dto.company_name}</span>
										</div>
										<div class="form-control">
											<span class="text-black">근무지 위치 :</span> 
											<span class="badge bg-secondary">${dto.location_name}</span>
										</div>
										<div class="form-control">
											<span class="text-black">근무 시간 :</span> 
											<span class="badge bg-secondary">${dto.work_start_time} ~ ${dto.work_end_time}</span>
										</div>
									</div>
									<div class="card-footer d-flex justify-content-between">
										<button type="button" class="btn btn-outline-success btn-sm posting" value="${dto.p_id }">공고 상세</button>
										<!-- 1. 지원만 했을 때 == 상대방이 미응답일 때  -> 응답 테이블에 데이터가 없음 -->
										<!-- 2. 지원을 했고 상대방이 수락했을 때 -> 응답 테이블에 데이터가 있음 -->
										<!-- 3. 지원을 했고 상대방이 거절했을 때 -> 응답 테이블에 데이터가 있음 -->
										<c:choose>
											<%-- 구인자 지원 수락 상태 --%>
											<c:when test="${dto.status_id == 2 }">
												<button type="button" class="btn btn-outline-primary btn-sm" id="finalYes" value="${dto.par_id }">최종 수락</button>
												<button type="button" class="btn btn-outline-danger btn-sm" id="cancel" value="${dto.par_id }">최종 거절</button>
											</c:when>
											<%-- 구인자 지원 거절 상태 --%>
											<c:when test="${dto.status_id == 3 }">
												<button type="button" class="btn btn-outline-secondary btn-sm" id="">삭제</button>
											</c:when>
											<%-- 지원자 지원 미응답 상태 --%>
											<c:otherwise>
												<button type="button" class="btn btn-outline-danger btn-sm" id="cancel" value="${dto.p_id }">지원 취소</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		
				<div class="col">
			<div class="card mb-4">
				<div class="card-header">
					<div>
						<span class="text-primary">제안 현황</span>
					</div>
				</div>
				<div class="card-body">
					<div class="row">
						<c:forEach var="dto" items="${offList }">
							<div class="col-md-6 mb-4">
								<div class="card">
									<div class="card-header">
										<h5>${dto.title}</h5>
									</div>
									<div class="card-body">
										<div class="form-control">
											<span class="text-black">상태 :</span> 
											<span class="badge bg-secondary">${dto.state}</span>
										</div>
										<div class="form-control">
											<span class="text-black">모집 인원 수 :</span> 
											<span class="badge bg-secondary">${dto.headcount}</span>
										</div>
										<div class="form-control">
											<span class="text-black">지원자 수 :</span> 
											<span class="badge bg-secondary">${dto.count}</span>
										</div>
										<div class="form-control">
											<span class="text-black">공고 마감시간 :</span> 
											<span class="badge bg-secondary">${dto.closing_time}</span>
										</div>
										<div class="form-control">
											<span class="text-black">시급 :</span> 
											<span class="badge bg-secondary">${dto.hourly_wage}</span>
										</div>
										<div class="form-control">
											<span class="text-black">회사/업체명 :</span> 
											<span class="badge bg-secondary">${dto.company_name}</span>
										</div>
										<div class="form-control">
											<span class="text-black">근무지 위치 :</span> 
											<span class="badge bg-secondary">${dto.location_name}</span>
										</div>
										<div class="form-control">
											<span class="text-black">근무 시간 :</span> 
											<span class="badge bg-secondary">${dto.work_start_time} ~ ${dto.work_end_time}</span>
										</div>
									</div>
									<div class="card-footer d-flex justify-content-between">
										<button type="button" class="btn btn-outline-success btn-sm posting" value="${dto.p_id }">공고 상세</button>
										<button type="button" class="btn btn-outline-primary btn-sm" id="yes" value="${dto.por_id }">수락</button>
										<button type="button" class="btn btn-outline-danger btn-sm" id="no" value="${dto.por_id }">거절</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
					
				</div>
			</div>
		
		
		
	</div>


</div>


</body>
</html>