<%@page import="com.sist.chodangi.PostingInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	PostingInfoDTO info = (PostingInfoDTO) request.getAttribute("info");
	String postaddr = info.getPostaddr();
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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39b30958de702ff5413727ad451431a4&libraries=services"></script>
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
document.addEventListener('DOMContentLoaded', function() {
    
    container = document.getElementById("map");
    mapCenter = new kakao.maps.LatLng(37.5565389, 126.9195136);
    options = {
       center : mapCenter,
       level : 3,
    };
    map = new kakao.maps.Map(container, options);
    
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch( <%=postaddr %>, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">약속장소</div>'
            });
            infowindow.open(map, marker);

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
					<li class="nav-item"><a class="nav-link active"
						href="seekermypage.action"> <img src="<%=cp%>/images/my.png"
							style="width: 20px; height: 20px;" alt="MY PAGE" /> MY PAGE
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="oastatus.action">지원 현황</a></li>
					<li class="nav-item"><a class="nav-link"
						href="scheduler.action">스케쥴러</a></li>
					<li class="nav-item"><a class="nav-link" href="#">공고 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">업체 즐겨찾기</a>
					</li>
				</ul>
			</div>
			<a class="navbar-brand" href="logout.action"> <span
				class="d-inline-block align-middle ms-2" style="font-size: medium;">logout</span>
			</a>
		</nav>
	</div>


	<div class="container">
		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading" style="height: 60px;">
					<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
						공고문 상세보기 </span>

				</div>

				<div class="panel-body">
					<form method="get" id="posting">
						<table class="table table-striped">

							<tr style="height: 10px;"></tr>
							<tr style="height: 10px;"></tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 공고제목 </span> <input type="text"
											id="title" name="title" class="form-control"
											readonly="readonly" value="${info.title}" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 분야 </span> <input type="text"
											id="category" name="category" class="form-control"
											readonly="readonly" value="${info.c_name }" />
									</div>
								</td>
							</tr>

							<tr>
								<td><span class="input-group-addon" id="basic-addon2"
									style="width: 150px;"> 근무내용 </span> <textarea
										name="work_content" id="work_content" class="form-control"
										readonly="readonly" style="height: 200px;">${info.work_content }</textarea>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 주소 </span> <input type="text"
											id="location" name="location" class="form-control"
											readonly="readonly" value="${info.l_name }" />
									</div>
									<div id="map" style="width: 500px; height: 400px;"></div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 시급 </span> <input type="text"
											id="hourly_wage" name="hourly_wage" class="form-control"
											readonly="readonly" value="${info.hourly_wage }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 모집인원수 </span> <input type="text"
											id="headcount" name="headcount" class="form-control"
											readonly="readonly" value="${info.headcount }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 희망성별 </span> <input type="text"
											id="gender" name="gender" class="form-control"
											readonly="readonly" value="${info.gender }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 작성일자 </span> <input type="text"
											id="posting_date" name="postiong_date" class="form-control"
											readonly="readonly" value="${info.posting_date }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 근무 시작 시간 </span> <input type="text"
											id="work_start_time" name="work_start_time"
											class="form-control" readonly="readonly"
											value="${info.work_start_time }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 근무 종료 시간 </span> <input type="text"
											id="work_end_time" name="work_end_time" class="form-control"
											readonly="readonly" value="${info.work_end_time }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group" role="group">
										<span class="input-group-addon" id="basic-addon2"
											style="width: 150px;"> 모집 마감 시간 </span> <input type="text"
											id="closing_time" name="closing_time" class="form-control"
											readonly="readonly" value="${info.closing_time }" />
									</div>
								</td>
							</tr>
							<tr style="height: 10px;"></tr>

							<tr>
								<td style="height: 10px;"></td>
							</tr>




							<tr>
								<td style="text-align: center;"><span class="col-md-9">
										<a href="posterinquirylist.action" role="button"
										class="btn btn-success btn-xs" id="btnAdd"
										style="vertical-align: bottom;">닫기</a>
								</span></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>