<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업체 평가</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="text-center mb-4">
            <h1 class="display-4">${companyDTO.name } 평가</h1>
            <hr class="my-4">
        </div>
        
        <div class="mb-3">
            <a href="#" onclick="history.back();" class="btn btn-outline-secondary btn-lg">&larr; 이전 페이지</a>
        </div>

        <div class="card p-4 shadow-sm">
            <form action="c_evaluationinsert.action" method="post">
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="item" items="${list}" varStatus="status">
                            <div class="mb-4">
                                <h5 class="fw-bold">${item.name}</h5>
                                <div class="d-flex gap-2">
                                    <c:forEach var="score" begin="1" end="5">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="score${status.index + 1}" value="${score}" 
                                                   id="score${status.index + 1}_${score}" 
                                                   <c:if test="${score == 3}">checked="checked"</c:if>>
                                            <label class="form-check-label" for="score${status.index + 1}_${score}">${score}</label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-danger">평가할 항목이 없습니다.</p>
                    </c:otherwise>
                </c:choose>

                <input type="hidden" name="posting_id" value="${dto.posting_id}">
                <input type="hidden" name="s_id" value="${dto.s_id}">
                <input type="hidden" name="c_id" value="${dto.c_id}">
                <input type="hidden" name="par_id" value="${dto.par_id}">

                <div class="d-flex justify-content-end mt-4 gap-2">
                    <button type="reset" class="btn btn-outline-danger btn-lg">작성 취소</button>
                    <button type="submit" class="btn btn-primary btn-lg">평가 제출</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
