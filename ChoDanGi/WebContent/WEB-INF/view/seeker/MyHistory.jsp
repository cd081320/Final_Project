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
<title>내 히스토리</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">
	$(function() {
		// 해당 히스토리 클릭시 공고로 연결
		$(".history").click(function() {
			const posting_id = $(this).find(".posting_id").text().trim();
			window.location.href = "seekerposting.action?id=" + posting_id;
		});
	});
</script>
</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg bg-light">
        <a class="navbar-brand" href="seekermainpage.action">
            <img src="<%=cp %>/images/alba.jpg"
            class="img-fluid" style="width: 10%; display: inline-block; vertical-align: middle;" alt="CHODANGIALBA"/>
            <span class="d-inline-block align-middle ms-2" style="font-size: 28px; font-weight: bold;">CHODANGIALBA</span>
        </a>
        <div class="navbar-collapse">
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
                    <a class="nav-link" href="#">즐겨찾기</a>
                </li>
            </ul>
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
					<a href="seekermypage.action" class="list-group-item list-group-item-action">마이페이지 수정</a>
					<a href="seekermyhistory.action" class="list-group-item list-group-item-action active">히스토리</a>
					<a href="#" class="list-group-item list-group-item-action">test</a>
				</div>
			</div>
		</div>

		<!-- 내용 영역 -->
		<div class="col-md-10">
			<div class="card mb-4">
				<div class="card-header bg-info text-white text-center">
                    <h5 class="card-title mb-0">히스토리</h5>
                </div>
                <div class="card-body">
               		<div class="row text-center">
               			<div class="col-1 text-center">공고번호</div>
               			<div class="col text-center">제목</div>
               			<div class="col-2 text-center">업체명</div>
               			<div class="col-4 text-center">근무기간</div>
               		</div>
               		<hr>
                	<!-- 각 히스토리마다 공고번호, 제목, 업체명, 근무시작-마감시간 -->
                	<c:forEach items="${list }" var="dto">
                		<div class="row history">
                			<div class="col-1 text-center posting_id">${dto.posting_id}</div>
                			<div class="col text-center title">${dto.title }</div>
	               			<div class="col-2 text-center company_name">${dto.company_name }</div>
	               			<div class="col-4 text-center time">${dto.work_start_time } - ${dto.work_end_time }</div>	
                		</div>
                	</c:forEach>
                </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>