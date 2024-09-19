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
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
    body, html {
        height: 100%;
        margin: 0;
    }
    .container {
        height: 500px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        /* Flexbox로 중앙 정렬 */
    }
    .content {
        margin-top: auto;  /* 페이지 상단에서 공백만큼 자동으로 이동 */
        margin-bottom: auto; /* 페이지 하단에서 공백만큼 자동으로 이동 */
    }
    .row {
        margin-bottom: 15px; /* 버튼 사이에 간격 추가 */
    }
    .btn1 {
        margin-top: 30px; /* 버튼과 버튼 사이에 간격 추가 */
        font-size: 18px; /* 버튼 글씨 크기 */
        padding: 15px 25px; /* 버튼 패딩 */
        border-radius: 8px; /* 버튼 모서리 둥글게 */
        text-align: center; /* 텍스트 중앙 정렬 */
    }
    .panel.title {
        margin-bottom: 20px; /* 패널과 버튼 사이에 간격 추가 */
    }
</style>

</head>
<body>

<a role="btn" href="logout.action" class="btn btn-danger">로그아웃</a>


<div class="panel title">
	<h1>관리자 모드</h1>
</div>

<!-- 메인 메뉴 영역 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a class="navbar-brand" href="#">Home</a>
				</li>
				<li>
					<a href="seekerinquirylist.action">
						구인자 신고 <span class="sr-only">(current)</span>
					</a>
				</li>
				<li>
					<a href="posterinquirylist.action">
						구직자 신고
					</a>
				</li>
			</ul>
		</div>
	</div>	
</nav>

<!-- 메인화면 -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <a href="changemaxheadcountform.action" class="btn1 btn-info btn-block">최대 모집인원 조회/변경하기 ▶</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="blockmanageform.action" class="btn1 btn-info btn-block">제재사유 추가/제거/변경 ▶</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="writenoticeform.action" class="btn1 btn-info btn-block">공지 작성 ▶</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="noticelistform.action" class="btn1 btn-info btn-block">공지 리스트 조회 ▶</a>
        </div>
    </div>
</div>


</body>
</html>