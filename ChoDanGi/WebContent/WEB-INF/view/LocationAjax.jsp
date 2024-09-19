<%@page import="com.sist.chodangi.LocationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// json 파일로 변환
	ArrayList<LocationDTO> list = (ArrayList<LocationDTO>)request.getAttribute("list");
	String result = "";
	
	StringBuffer sb = new StringBuffer();
	for (LocationDTO dto : list)
	{
		sb.append("{\"id\":" + dto.getId());
		sb.append(", \"name\":\"" + dto.getName() + "\"},");		
	}
	if (sb.length() > 0)
	{
		result += sb.toString();
		result = result.substring(0, result.length() - 1);
	}
	
	result = "[" + result + "]";

	out.println(result);		
	
%>