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
<title>PosterInquiryInfo.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootsrapapcdn.com/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="panel title">
	<h1>모집 가능 최대 인원수 변경</h1>
</div>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" style="height: 60px;">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					최대 인원수 변경
				</span>
				<span class="col-md-9">
					<a href="adminmainform.action" role="button" class="btn btn-success btn-xs" id="btnAdd"
					style="vertical-align: bottom;">메인 페이지로 돌아가기</a>
				</span>
			</div>
			
			<div class="panel-body">
				<form action="headcountchange.action" method="get" id="pinquiry">
					<table class="table table-striped">
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										현재 모집가능한 최대 인원 수
									</span>
									<input type="number" id="c_headcount" name="c_headcount" class="form-control"
									placeholder="c_headcount" maxlength="30" required="required" readonly="readonly"
									value="${headcount}"/>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2" style="width: 100px;">
										변경할 모집가능 최대 인원 수
									</span>
									<input type="number" id="headcount" name="headcount" class="form-control"
									placeholder="인원수" maxlength="30" required="required"/>
								</div>
								<!-- ----------------------------테스트용-------------------------------------------- -->
								<input type="text" name="a_id" id="a_id" value = 1 style="display:none">
								<!-- -------------------------------------------------------------------------------- -->
							</td>
						</tr>
						
						
						<tr>
							<td style="text-align: center;">
								<button type="submit" class="btn btn-success">변경</button>
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