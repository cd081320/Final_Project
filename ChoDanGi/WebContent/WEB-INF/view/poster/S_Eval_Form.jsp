<%@page import="com.sist.chodangi.SeekerEvalDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	ArrayList<SeekerEvalDTO> list = (ArrayList<SeekerEvalDTO>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S_Eval_Form</title>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/Form.css">
</head>
<body>
	<div>
		<h1>구직자 평가</h1>
		<hr />
	</div>

	<div>
		<h2>
			<a href="prepage.action">← 이전 페이지</a>
		</h2>
	</div>

	<div>
		<form action="s_evaluationinsert.action">
			<%for (int i = 1; i <= list.size(); i++) { %> 
			<div>
				<b><%=list.get(i-1).getName() %></b>
				<br />
				점수:
					<%for (int j = 1; j <= 5; j++) {	
						if (j == 3) {%>
						<input type="radio" name="score<%=i %>" value="<%=j %>" id="score<%=i %>_<%=j %>" checked="checked">
						<label for="score<%=i %>_<%=j %>"><%=j %></label>
						<%} else{ %>
						<input type="radio" name="score<%=i %>" value="<%=j %>" id="score<%=i %>_<%=j %>">
						<label for="score<%=i %>_<%=j %>"><%=j %></label>
						<%} %>
					<%} %>
				<br /><br /><br />
			</div>
			<%} %>
			
			<!-- ----------------------------테스트용-------------------------------------------- -->
			<input type="text" name="posting_id" id="posting_id" value = 1 style="display:none">
			<input type="text" name="p_id" id="p_id" value = 1 style="display:none">
			<input type="text" name="s_id" id="s_id" value = 1 style="display:none">
			<!-- -------------------------------------------------------------------------------- -->
			
			<button type="submit">평가 제출</button>
			<button type="reset">작성 취소</button>
		</form>
	</div>


</body>
</html>