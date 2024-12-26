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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제안 가능 인원</title>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".offer").click(function() {
			$.ajax({
				url: "posteroffer.action",
				type: "POST",
				data: {
						posting_id: $(this).data("posting_id"),
						open_application_id: $(this).data("id")
					},	// 공고번호, 오픈지원서번호
				success: function(response) {
				 	alert(response);
					button.prop("disabled", true);
					button.text("제안 완료"); // 버튼 텍스트 변경
				},
				error: function (xhr) {
		            if (xhr.status === 401) {
		                alert("세션 정보가 없습니다. 로그인이 필요합니다.");
		            } else {
		                alert("제안 처리에 실패했습니다. 다시 시도해주세요.\n" + xhr.responseText);
		            }
				}
			});
		});
	})
</script>
</head>
<body>

<div class="container mt-5">
	<h1 class="text-center mb-4">제안 가능 인원</h1>
	
	<!-- table -->
	    <table class="table table-striped table-bordered">
        <thead class="table-gray">
            <tr>
                <th>이름</th>
                <th>지원 시작 날짜</th>
                <th>지원 종료 날짜</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>제안여부</th>
            </tr>
        </thead>
        <tbody>
            <!-- offerList 반복 -->
            <c:forEach var="offer" items="${offerList}">
                <tr>
                    <td>${offer.name }</td>
                    <td>${offer.start_date }</td>
                    <td>${offer.end_date }</td>
                    <td>${offer.tel }</td>
                    <td>${offer.email }</td>
                    <td>
                    	<button class="btn btn-success offer" data-id="${offerList.id }" data-posting_id="${posting_id }">제안하기</button>
                    </td>
                </tr>
            </c:forEach>

            <!-- 데이터가 없을 경우 메시지 표시 -->
            <c:if test="${empty offerList}">
                <tr>
                    <td colspan="5" class="text-center">제안 가능 인원이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <!-- end table -->
</div>

</body>
</html>