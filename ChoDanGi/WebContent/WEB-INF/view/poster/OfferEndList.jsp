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
<title>OfferEndList.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	$(function() 
	{
		$(".nickName").click(function()
		{
			var nickName = $(this).text().trim();
			//alert(nickName);
			
			$.post("seekerInfoAjax.action", {seekerNickName : nickName}, function(dto) 
			{
				
				$("#applicantDetails").html
				(
	                dto
		        );
				
	            $("#applicantInfoModal").modal('show');
		            
			});

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
		            <a href="offerendlist.action" class="list-group-item list-group-item-action active">제안 완료한 공고</a>
		            <a href="companylist.action" class="list-group-item list-group-item-action">회사 정보</a>
		        </div>
		    </div>
		</div>

        <!-- 내용 영역 -->
        <div class="col-md-10">

            <!-- 채용 완료한 공고 내용 -->
            <div id="completedJobs" class="card mb-4">
                <div class="card-header bg-info text-white text-center">
                    <h5 class="card-title">${loginId }님의 채용 완료<span class="text-warning">(제안)</span>한 공고</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="table-info">
                                    <tr>
                                        <th>제목</th>
                                        <th>회사명</th>
                                        <th>위치</th>
                                        <th>분야명</th>
                                        <th>시급</th>
                                        <th>근무시작시간</th>
                                        <th>근무종료시간</th>
                                        <th>근로계약서</th>
                                        <th>구직자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="dto" items="${list}">
                                        <tr>
                                        	<td>${dto.title }</td>
                                            <td>${dto.company_name}</td>
                                            <td>${dto.location_name}</td>
                                            <td>${dto.category_name}</td>
                                            <td><fmt:formatNumber type="currency" value="${dto.hourly_wage }" /></td>
                                            <td>${dto.work_start_time}</td>
                                            <td>${dto.wokr_end_time}</td>
                                            <td class="text-center">
                                                <a href="" class="btn btn-outline-info btn-sm">다운로드</a>
                                            </td>
                                            <td>
											    <a class="nickName text-decoration-none" href="#" data-bs-toggle="modal" data-bs-target="#applicantInfoModal">
												    ${dto.seeker_nickname}
												</a>
											</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            
        </div>
    </div>
</div>

<!-- 구직자 정보 모달 -->
<div class="modal fade" id="applicantInfoModal" tabindex="-1" aria-labelledby="applicantInfoModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="applicantInfoModalLabel">구직자 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body">
				<!-- 구직자 정보가 여기에 동적으로 로드됩니다 -->
				<p id="applicantDetails">로딩 중...</p>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>




</body>
</html>