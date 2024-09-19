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
<title>SeekerInquiryForm</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/InquiryForm.css">
</head>
<body>
<div>
	<h1>구직자 신고 문의</h1>
	<hr />
</div>

<div>
	<h2><a href="p_inquirylist.action">← 신고문의 리스트</a></h2>
</div>

<div>
	<form action="p_inquiryinsert.action">
		제목 <input type="text" name="title" id="title"><br><br>
		신고할 구직자 아이디 <input type="number" name="s_id" id="s_id"/>
		<br /><br />
		신고유형 <select name="type" id="type">
					<option value="">선택하세요.</option>
					 <c:forEach var="dto" items="${list }">
					 	<option value="${dto.id }">${dto.report_type }</option>
					 </c:forEach>
				</select><br><br>
		내용<br> <textarea name="content" style="width: 100%; height: 175px;"></textarea><br><br>
		
		<button type="submit">문의사항 제출</button>
		<button type="reset">제출 취소</button>
	</form>
</div>

</body>
</html>