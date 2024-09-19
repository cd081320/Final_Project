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
<title>SeekerInquiryList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootsrapapcdn.com/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function()
	{
		$(".btn-success").click(function()
		{
			$(location).attr("href", "search.action?id=" + $(this).val());
		});
	});
</script>

<style type="text/css">

 	.trTitle th 
 	{
    	text-align: center;
  	}

</style>

</head>
<body>

<div class="panel title">
	<h1>구직자들의 신고문의 리스트</h1>
</div>

<!-- 메인 메뉴 영억 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Home</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
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
		</div><!-- collapse .navbar-collapse -->
	</div><!-- .container-fluid -->
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					신고리스트
				</span>
			</div>
			
			<div class="panel-body">
				<table class="table table-hover table-striped">
					<tr class="trTitle text-center">
						<th>번호</th>
						<th>신고당한 공고문 번호</th>
						<th>제목</th>
						<th>신고유형</th>
						<th>신고자 아이디</th>						
						<th>등록일</th>
						<th>관리</th>						
					</tr>
					 
					<c:forEach var="dto" items="${list2 }">
						<tr class="text-center">
							<td>${dto.id }</td>
							<td>${dto.posting_id }</td>
							<td>${dto.title }</td>
							<td>${dto.s_report_type }</td>
							<td>${dto.login_id }</td>							
							<td>${dto.report_date }</td>
							<td>
								<button type="button" class="btn btn-success" value="${dto.id }">상세보기</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>