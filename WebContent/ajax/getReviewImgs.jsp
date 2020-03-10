<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.beeum.beeum.dao.ReviewPicsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String reviewStr = request.getParameter("review");
	String typeStr = request.getParameter("type");

	int reviewNo = Integer.parseInt(reviewStr);
	
	List<String> photoList =null;
	
	if(typeStr.equals("T")){
		photoList= ReviewPicsDAO.selectListTtr(reviewNo);
	}else{
		photoList= ReviewPicsDAO.selectListTlr(reviewNo);
	}
	
	
	ObjectMapper om = new ObjectMapper();
	
	
%>

<%= om.writeValueAsString(photoList)%>
