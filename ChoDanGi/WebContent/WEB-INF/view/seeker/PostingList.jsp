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
<title>공고 리스트</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	$(function() {
		$(".detailBtn").click(function() {
			$(location).attr("href", "posting.action?id=" + $(this).val());
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
                    <a class="nav-link" href="scheduler.action">스케쥴러</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="postinglist.action">공고 리스트</a>
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

	<!-- 검색 및 정렬 바 -->
	<div class="search-sort-bar mb-3">
		<form action="" method="get">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-4">
				    <input type="text" class="form-control" placeholder="검색어 입력">
				</div>
				<div class="col-auto">
				    <select name="order" class="form-select">
				        <option value="date">날짜순</option>
				        <option value="salary">시급순</option>
				        <option value="location">지역순</option>
				    </select>
				</div>
				<div class="col-auto">
				    <button type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 검색 및 정렬 바 -->
	
	<!-- 공고 리스트 -->
	<div class="card mb-4">
		
		<!-- 카드 헤더 -->
		<div class="card-header">
			<div>
				<span class="text-primary">공고 리스트</span>
			</div>
		</div>
		<!-- 카드 헤더 -->
		
		<!-- 카드 바디 -->
		<div class="card-body">
			<div class="row">
				<c:forEach items="${postingList }" var="dto">
				<div class="col-md-3">
					<%-- 공고들 --%>
					<div class="card">
						<div class="card-header">
							<h5>${dto.title }</h5>
						</div>
						<div class="card-body">
							<div class="form-control">
								<span class="text-black">공고 마감 :</span> 
								<span class="badge bg-secondary">${dto.closing_time}</span>
							</div>
							<div class="form-control">
								<span class="text-black">시급 :</span> 
								<span class="badge bg-secondary">${dto.hourly_wage} 원</span>
							</div>
							<div class="form-control">
								<span class="text-black">회사/업체명 :</span> 
								<span class="badge bg-secondary">${dto.company_name}</span>
							</div>
							<div class="form-control">
								<span class="text-black">모집 인원 수 :</span> 
								<span class="badge bg-secondary">${dto.headcount}</span>
							</div>
							<div class="form-control">
								<span class="text-black">근무지 위치 :</span> 
								<span class="badge bg-secondary">${dto.l_name}</span>
							</div>
							<div class="form-control">
								<span class="text-black">분야 :</span> 
								<span class="badge bg-secondary">${dto.c_name}</span>
							</div>
							<div class="form-control">
								<span class="text-black">근무 시간 :</span> 
								<span class="badge bg-secondary">${dto.work_start_time} ~ ${dto.work_end_time}</span>
							</div>
						</div>
						
						<div class="card-footer d-flex justify-content-between">
							<span class="text-black">마감 :</span> 
							<span>${dto.closing_time}</span>
							<button class="btn btn-primary detailBtn" value="${dto.id }">상세</button>
						</div>
					</div>
				</div>
				</c:forEach>
					
			</div>
		</div>
		<!-- 카드 바디 -->
		
	</div>	
</div>
	
</body>
</html>