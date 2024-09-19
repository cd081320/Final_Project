<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PosterInquiryInfo.jsp</title>
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
			$(location).attr("href", "p_search2.action?id=" + $(this).val());
		});
	});
</script>
</head>
<body>

<div class="panel title">
	<h1>신고 내역 상세보기</h1>
</div>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					신고 리스트 상세보기
				</span>
				<span class="col-md-9">
					<a href="posterinquirylist.action" role="button" class="btn btn-success btn-xs" id="btnAdd"
					style="vertical-align: bottom;">신고 리스트로 돌아가기</a>
				</span>
			</div>
			
			<div class="panel-body">
				<form method="post" id="pinquiry">
					<table class="table table-striped">
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										구직자 ID
									</span>
									<input type="text" id="s_login_id" name="s_login_id" class="form-control"
									placeholder="s_login_id" maxlength="30" required="required" readonly="readonly"
									value="${p_search.s_login_id}"/>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										제목
									</span>
									<input type="text" id="title" name="title" class="form-control" readonly="readonly"
									placeholder="title" maxlength="30" required="required" value="${p_search.title }"/>
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3" style="width: 100px;">
										신고유형
									</span>
									<input type="text" id="s_report_type" name="s_report_type" class="form-control" readonly="readonly"
									placeholder="report_type" maxlength="40" value="${p_search.report_type }"/>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3" style="width: 100px;">
										신고날짜
									</span>
									<input type="text" id="report_date" name="report_date" class="form-control" readonly="readonly"
									placeholder="report_date" maxlength="40" value="${p_search.report_date }"/>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3" style="width: 100px;">
										신고자 ID
									</span>
									<input type="text" id="login_id" name="login_id" class="form-control" readonly="readonly"
									placeholder="login_id" maxlength="40" value="${p_search.p_login_id }"/>
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td style="height: 10px;"></td>
						</tr>
						
						<tr>
							<td>
								<textarea name="content" id="content" class="form-control" readonly="readonly" style="height: 200px;">${p_search.content }</textarea>
							</td>
						</tr>
						
						
						<tr>
							<td style="text-align: center;">
								<button type="button" class="btn btn-success" value= "<%=id %>">답변</button>
								<br />
							</td>
						</tr>
						
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>