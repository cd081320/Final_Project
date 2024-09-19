<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<div>
    <b>구직자 이름:</b> ${dto.nickname} <br/>
    <b>전화번호:</b> ${dto.tel} <br/>
    <b>이메일:</b> ${dto.email} <br/>
    <b>생년월일:</b> ${dto.ssn_front} <br/>
    <b>상세 주소:</b> ${dto.addr_detail} <br/>
</div>