<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 현황</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 지원자 상세 버튼 클릭
		$(".infoBtn").click(function() {
			// p_id를 post 방식으로 전송
			$(location).attr("href", "myposterinfo.action?posting_id=" + $(this).val());
		});
	});
</script>

</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="mainpage.action">
            <img src="<%=cp %>/images/alba.jpg" class="img-fluid" style="width: 10%; display: inline-block; vertical-align: middle;" alt="CHODANGIALBA"/>
            <h1 class="d-inline-block align-middle ms-2">CHODANGIALBA</h1>
        </a>
        <div class="navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="postermypage.action?loginId=${loginId }">
                        <img src="<%=cp %>/images/my.png" style="width: 20px; height: 20px;" alt="MY PAGE"/> MY PAGE
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">공고 현황</a>
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

<!-- 공고 목록 -->
<div class="container my-4">
	<div class="row">
				<div class="col">
			<div class="card mb-4">
				<div class="card-header">
					<div>
						<span class="text-primary">내 공고 현황</span>
					</div>
				</div>
				<div class="card-body">
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
				</div>
			</div>
		
			<div class="row">
				<c:forEach var="dto" items="${jobPostingList }">
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
								<button type="button" class="btn btn-outline-success btn-sm infoBtn" value="${dto.p_id }">지원자 상세</button>
								<button type="button" class="btn btn-outline-danger btn-sm cancelBtn" value="">공고 삭제</button>
							</div>
						</div>
					</div>
				</c:forEach>
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
				</div>
			</div>
		
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
								<button type="button" class="btn btn-outline-success btn-sm posting" value="${dto.p_id }">ㅎㅇ</button>
								<button type="button" class="btn btn-outline-primary btn-sm yes" value="${dto.por_id }">수락</button>
								<button type="button" class="btn btn-outline-danger btn-sm no" value="${dto.por_id }">거절</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
		
		
	</div>


</div>


</body>
</html>