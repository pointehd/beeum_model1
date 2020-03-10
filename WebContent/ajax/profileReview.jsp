<%@page import="com.beeum.beeum.vo.Review"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.beeum.beeum.dao.AvalBeesDAO"%>
<%@page import="com.beeum.beeum.dao.ToTravelerReviewsDAO"%>
<%@page import="com.beeum.beeum.dao.ToLocalReviewsDAO"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    System.out.println("호출 ajax");
    /* System.out.println(request.getParameter("userNo"));
    System.out.println(request.getParameter("type"));
    System.out.println(request.getParameter("who")); */
    
    List<Review> reviews = null;
    int no = Integer.parseInt(request.getParameter("userNo"));
    
    if(request.getParameter("type").equals("G")){
    	if(request.getParameter("who").equals("L")){
    		reviews= ToLocalReviewsDAO.selectGetterReviews(no);
    	}else{
    		reviews= ToTravelerReviewsDAO.selectGetterReviews(no);
    	}
    }else{
		if(request.getParameter("who").equals("L")){
    		reviews= ToLocalReviewsDAO.selectSenderReviews(no);	
    	}else{
    		reviews=ToTravelerReviewsDAO.selectSenderReviews(no);
    	}
    }
    for(Review review:reviews){
		review.setSenderBees(AvalBeesDAO.selectListOnlytType(review.getSenderNo()));
		review.setGetterBees(AvalBeesDAO.selectListOnlytType(review.getGetterNo()));
	}
    
    ObjectMapper om = new ObjectMapper();
    
    
    %>
<%=om.writeValueAsString(reviews)%>