<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>

<!-- header -->


<!-- body -->
<div class="container-fulid border">
	<div class="panel-header">
		<h3>공고 리스트</h3>
	</div>



</div>

<div class="container border g-3">
	
	<!-- 공고 한줄 -->
	<div class="row g-3 mt-3 mb-3">
		<div class="col-sm-6">
			<div class="card">
			
				<div class="row g-0">
					<div class="col-md-4">
						<img src="" class="img-fluid rounded-start" alt=""> 공고 사진 위치
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">공고 제목</h5>
							<p class="card-text">공고 상세 내용</p>
							<div class="text-end">
								<span class="card-text"><small class="text-body-secondary">현재시간 - 업로드시간</small></span>
								<a href="#" class="btn btn-primary">공고 보기</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="card">
			
				<div class="row g-0">
					<div class="col-md-4">
						<img src="" class="img-fluid rounded-start" alt="">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting text
								below as a natural lead-in to additional content. This content is
								a little bit longer.</p>
							<div class="text-end">
								<span class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></span>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
	</div><!-- 공고 한줄 -->
	<!-- 공고 한줄 -->
	<div class="row g-3 mt-3 mb-3">
		<div class="col-sm-6">
			<div class="card">
			
				<div class="row g-0">
					<div class="col-md-4">
						<img src="" class="img-fluid rounded-start" alt="">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting text
								below as a natural lead-in to additional content. This content is
								a little bit longer.</p>
							<div class="text-end">
								<span class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></span>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="card">
			
				<div class="row g-0">
					<div class="col-md-4">
						<img src="" class="img-fluid rounded-start" alt="">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting text
								below as a natural lead-in to additional content. This content is
								a little bit longer.</p>
							<div class="text-end">
								<span class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></span>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
	</div><!-- 공고 한줄 -->
	
</div>


</body>
</html>