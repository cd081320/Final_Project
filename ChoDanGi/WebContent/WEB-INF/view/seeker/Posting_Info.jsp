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
<title>Posting_Info.jsp</title>
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f5a111258e4dea0337f78ee1c0dbac8&libraries=services"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script type="text/javascript">
	function searchPostcodeAndShowMap(postcode) {
		var geocoder = new kakao.maps.services.Geocoder();

		// 우편번호를 이용해 주소 검색
		geocoder.addressSearch(postcode, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center : coords, // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				var marker = new kakao.maps.Marker({
					position : coords
				});
				marker.setMap(map);
			}
		});
	}

	window.onload = function() {
		searchPostcodeAndShowMap(postaddr);
	};
</script> -->

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
	<nav class="navbar navbar-expand-lg bg-light">
		<a class="navbar-brand" href="seekermainpage.action"> <img
			src="<%=cp%>/images/alba.jpg" class="img-fluid"
			style="width: 10%; display: inline-block; vertical-align: middle;"
			alt="CHODANGIALBA" /> <span
			class="d-inline-block align-middle ms-2"
			style="font-size: 28px; font-weight: bold;">CHODANGIALBA</span>
		</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link active" href="seekermypage.action">
					<img src="<%=cp%>/images/my.png" style="width: 20px; height: 20px;" alt="MY PAGE" /> MY PAGE</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="oastatus.action">지원 현황</a></li>
				<li class="nav-item"><a class="nav-link" href="scheduler.action">스케쥴러</a></li>
				<li class="nav-item"><a class="nav-link" href="#">공고 리스트</a></li>
				<li class="nav-item"><a class="nav-link" href="#">업체 즐겨찾기</a></li>
			</ul>
		</div>
		<a class="navbar-brand" href="logout.action">
			<span class="d-inline-block align-middle ms-2" style="font-size: medium;">logout</span>
		</a>
	</nav>
</div>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading text-center my-3">
				<span class="display-6">${info.title}</span>
			</div>

			<div class="panel-body">
				<form method="get" id="posting">
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
									<input type="text"
											id="closing_time" name="closing_time" class="form-control"
											readonly="readonly" value="${info.closing_time }" />
								</td>
							</tr>
							<tr class="text-center">
								<td colspan="2">
									<a href="seekerapplication.action?id=${info.id }" role="button" class="btn btn-primary" id="appBtn">지원하기</a>
									<a href="postinglist.action" role="button" class="btn btn-secondary" id="closeBtn">닫기</a>
								</td>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>