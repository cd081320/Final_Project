<%@page import="com.sist.chodangi.common.PostingInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	PostingInfoDTO info = (PostingInfoDTO) request.getAttribute("info");
	String roadaddr = info.getRoadaddr();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${info.title}</title>
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f5a111258e4dea0337f78ee1c0dbac8&libraries=services"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
	    
	    var container = $("#map")[0];
	    
		var roadaddr = '<%=roadaddr %>';
	    var geocoder = new kakao.maps.services.Geocoder();

	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch( roadaddr, function(result, status) {
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			    options = {
			       center : coords,
			       level : 3,
			       draggable : false,
			    };
			    map = new kakao.maps.Map(container, options);
			    
	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords,
	            });
	
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	         }
	    });
	    
	    
	    // 지원자 상세보기 처리
	    $(".seekerInfo").click(function() {
			// 모달 처리
		});
	    
	    // 지원자 수락 처리
	    $(".yes").click(function() {
			const par_id = parseInt($(this).val());
			const yesButton = $(this); // 수락 버튼
			
			// 수락 처리 ajax
			if(confirm("정말로 이 지원을 수락하시겠습니까?"))
			{
				$.ajax({
					url : "seekeracceptajax.action",
					type : "POST",
					data : {par_id : par_id},
					success : function() {
						alert("지원자를 수락하였습니다.");
						
						// 수락 비활성화
						yesButton.prop("disabled", true);
					},
					error : function() {
						alert("수락 처리에 실패했습니다.");
					}
				});
			}
			
			
		});
	    
	    // 지원자 거절 처리
	    $(".no").click(function() {
			
		});
	    
	    // 제안하러가기
	    $(".offer").click(function() {
	    	// 팝업 창으로 이동
	    	const url = "offerlist.action?posting_id=" + ${info.id};
	        const popupOptions = "width=800, height=600, scrollbars=yes";
			window.open(url, "OfferList", popupOptions);
		});
	    
	});
</script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 검색, 지도 표시 기능 구현 -->
<script type="text/javascript">	
    function getAddr()
    {
        new daum.Postcode(
        {
            oncomplete: function(data) 
            {
                addr = data.address;
                
                // 받아온 주소 넣기 
                document.getElementById("place_name").value = addr;
                
            }
        }).open();
    }
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


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading text-center my-3">
				<span class="display-6">${info.title }</span>
			</div>
			<div class="panel-body">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="col-md-2"> 분야 </td>
							<td class="col-md-auto">
								<input type="text" id="category" name="category" class="form-control" 
									readonly="readonly" value="${info.c_name }" />
							</td>
						</tr>

						<tr>
							<td> 근무내용 </td>
							<td>
								<textarea name="work_content" id="work_content" class="form-control"
									readonly="readonly" style="height: 200px;">${info.work_content }</textarea>
							</td>
						</tr>

						<tr>
							<td> 주소 </td>
							<td>
								<input type="text" id="location" name="location" class="form-control"
									readonly="readonly" value="${info.roadaddr } ${info.company_location}" />
								<div class="container-fluid mt-2" id="map" style="height: 300px;"></div>
							</td>
						</tr>

						<tr>
							<td> 시급 </td>
							<td>
								<input type="text" id="hourly_wage" name="hourly_wage" class="form-control"
										readonly="readonly" value="${info.hourly_wage }" />
							</td>
						</tr>

						<tr>
							<td> 모집인원수 </td>
							<td>
								<input type="text"
										id="headcount" name="headcount" class="form-control"
										readonly="readonly" value="${info.headcount }" />
							</td>
						</tr>

						<tr>
							<td> 희망성별 </td>
							<td>
								<input type="text"
										id="gender" name="gender" class="form-control"
										readonly="readonly" value="${info.gender }" />
							</td>
						</tr>

						<tr>
							<td> 작성일자 </td>
							<td>
								<input type="text"
										id="posting_date" name="postiong_date" class="form-control"
										readonly="readonly" value="${info.posting_date }" />
							</td>
						</tr>

						<tr>
							<td> 근무 시작 시간 </td>
							<td>
								<input type="text" id="work_start_time" name="work_start_time"
										class="form-control" readonly="readonly"
										value="${info.work_start_time }" />
							</td>
						</tr>

						<tr>
							<td> 근무 종료 시간 </td>
							<td>
								<input type="text"
										id="work_end_time" name="work_end_time" class="form-control"
										readonly="readonly" value="${info.work_end_time }" />
							</td>
						</tr>

						<tr>
							<td> 모집 마감 시간 </td>
							<td>
								<input type="text" id="closing_time" name="closing_time" class="form-control"
								 readonly="readonly" value="${info.closing_time }" />
							</td>
						</tr>
						<tr class="text-center">
							<td colspan="2">
								<button class='btn btn-primary' id="appBtn">수정</button>
								<a href="javascript:history.back();" role="button" class="btn btn-secondary" id="closeBtn">닫기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr>
			<!-- 제안하러가기 -->
			<div class="card">
				<div class="card-header text-center">
					<a class="offer">제안하러가기</a>
				</div>
			</div>
			<!-- 해당 공고를 지원한 지원자 상세 정보들 -->
			<!-- 해당 영역에서 수락하면 수락버튼이 비활성화 -->
			<div class="panel-body">
				<div class="row">
					<span class="text-center fw-bold fs-5">해당 공고에 대한 지원자</span>
				</div>
				<div class="row">
					<div class="col text-center">닉네임</div>
					<div class="col text-center">종합 평균 점수</div>
					<div class="col text-center">정보</div>
				</div>
				<c:forEach var="dto" items="${appList }">
				<div class="row">
					<div class="col text-center">
						${dto.nickname }
					</div>
					<div class="col text-center">
						${dto.score }
					</div>
					<div class="col text-center">
						<button class="btn btn-success seekerInfo" value="${dto.s_id }">상세보기</button>
						<!-- 이미 수락했으면 비활성화 수정필요 -->
						<button class="btn btn-primary yes" value="${dto.par_id }" ${dto.status_id == 2 ? 'disabled="disabled"' : '' }>수락</button>
						<button class="btn btn-danger no" value="${dto.par_id }">거절</button>
					</div>
				</div>
				</c:forEach>
			</div>
			<br>
			<hr>
			<!-- 해당공고로 제안한 지원자들 -->
			<div class="panel-body">
				<div class="row">
					<span class="text-center fw-bold fs-5">내가 제안한 지원자</span>
				</div>
				<div class="row">
					<div class="col text-center">닉네임</div>
					<div class="col text-center">종합 평균 점수</div>
					<div class="col text-center">정보</div>
				</div>
				<c:forEach var="dto" items="">
				<div class="row">
					<div class="col text-center">
						
					</div>
					<div class="col text-center">
						
					</div>
					<div class="col text-center">
						<button class="btn btn-success seekerInfo" value="">상세보기</button>
						<button class="btn btn-primary yes" value="">최종 수락</button>
						<button class="btn btn-danger no" value="">최종 거절</button>
					</div>
				</div>
				</c:forEach>
			</div>

			
		</div>
	</div>
</div>


<br><br>
<br><br>
<br><br>

</body>
</html>