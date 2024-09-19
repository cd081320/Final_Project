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
<title>CompanyList.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		(".btnUpdate").click(function() 
		{
		     var c_id = $(this).val(); 
		     $(location).attr("href", "companyupdateform.action?c_id=" + c_id);
		});
		
		 $(".btnDelete").click(function() 
		 {
		     deleteId = $(this).val(); 
		     $('#deleteModal').modal('show');
		 });

		
		$("#confirmDelete").click(function() 
		{
			if (deleteId) 
			{
				$(location).attr("href", "companydelete.action?c_id=" + deleteId);
			}
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
                    <a class="nav-link active" href="postermypage.action">
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
		            <a href="offerendlist.action" class="list-group-item list-group-item-action">제안 완료한 공고</a>
		            <a href="companylist.action" class="list-group-item list-group-item-action active">회사 정보</a>
		        </div>
		    </div>
		</div>

        <!-- 내용 영역 -->
        <div class="col-md-10">
            <!-- 마이페이지 수정 내용 -->
            <div id="editPage" class="card mb-4">
                <div class="card-header bg-info text-white text-center">
                    <h5 class="card-title mb-0">${loginId }님의 회사정보</h5>
                </div>
                <div class="card-body">
                	<div class="mb-3 text-end">
                        <!-- 회사 추가 버튼 -->
                        <a href="companyinsertform.action" class="btn btn-primary">회사 추가</a>
                    </div>
                    <div class="mb-3 text-center">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead class="table-info">
                                    <tr>
                                        <th>회사 이름</th>
                                        <th>회사 위치</th>
                                        <th>회사 상세 정보</th>
                                        <th>회사 등록 일자</th>
                                        <th>사업자 등록 번호</th>
                                        <th>수정</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="dto" items="${list }">
                                	<input type="hidden" id="c_id" name="c_id" value="${dto.c_id }" />
                                	<tr>
                                		<td>${dto.name }</td>
                                		<td>${dto.location }</td>
                                		<td>${dto.details }</td>
                                		<td>${dto.company_date }</td>
                                		<td>${dto.business_id }</td>
                                		<td><button class="btn btn-warning btn-sm btnUpdate" value="${dto.c_id }">수정</button></td>
                              			<td><button class="btn btn-danger btn-sm btnDelete" value="${dto.c_id }">삭제</button></td>
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

<!-- 삭제 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="deleteModalLabel">삭제 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                정말 회사 정보를 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">삭제</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>