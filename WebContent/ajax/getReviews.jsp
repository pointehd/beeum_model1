<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.beeum.beeum.dao.ToLocalReviewsDAO"%>
<%@page import="com.beeum.beeum.vo.ToLocalReview"%>
<%@page import="com.beeum.beeum.dao.AvalBeesDAO"%>
<%@page import="com.beeum.beeum.vo.AvalBee"%>
<%@page import="com.beeum.beeum.dao.ToTravelerReviewsDAO"%>
<%@page import="com.beeum.beeum.vo.ToTravelerReview"%>
<%@page import="java.util.List"%>
<%@page import="com.beeum.beeum.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String pageNoStr = request.getParameter("page");
	String[] themes = request.getParameterValues("theme");
	String[] regions = request.getParameterValues("region");
	String bee = request.getParameter("bee");
	String order = request.getParameter("order");
	
	System.out.println(pageNoStr);
	System.out.println(themes);
	System.out.println(regions);
	System.out.println(bee);
	
	PageVO pageVO = new PageVO(1, 1000);
	
	if(regions!=null) {
 		
		String region = "";
		
		for(String x : regions) {
			
			region+=x+",";
		}
		
		region = region.substring(0,region.lastIndexOf(","));
		
		System.out.println(region);
		
		pageVO.setRegion(region); 
	
 	}//if() end
	
	if(themes!=null) {
		
	 	String theme = "'";
		
		for(String x : themes) {
			
			theme+=x+"','";
		}
		
		theme = theme.substring(0,theme.lastIndexOf(","));
		
		System.out.println(theme);
		
		pageVO.setTheme(theme); 
	
	}//if() end

	pageVO.setBee(bee); 
	pageVO.setOrder(order);
	
	boolean isLocalBee = true;
 	
 	if(bee!=null && bee.equals("T")) {
 		isLocalBee = false;
 	}//if end
	
 	List<ToLocalReview> lReviews  = null;
 	List<ToTravelerReview> tReviews = null;
 	
 	if(isLocalBee) {
 		lReviews = ToLocalReviewsDAO.selectList(pageVO);
 		for(ToLocalReview lReview : lReviews) {
 			lReview.setBeeList(AvalBeesDAO.selectList(lReview.gettNoUser()));
 			lReview.setBeeListTwo(AvalBeesDAO.selectList(lReview.getlNoUser()));
 		}
 	}else {
 		tReviews = ToTravelerReviewsDAO.selectList(pageVO);
 		for(ToTravelerReview tReview : tReviews) {
 			tReview.setBeeList(AvalBeesDAO.selectList(tReview.getlNoUser()));//쓴사람
 			tReview.setBeeListTwo(AvalBeesDAO.selectList(tReview.gettNoUser()));//쓴사람
 		}
 	}
 	
	ObjectMapper om = new ObjectMapper();
	
	String json = null;
	
	if(isLocalBee) {
		json = om.writeValueAsString(lReviews);
	}else {
		json = om.writeValueAsString(tReviews);
	}

	
%>
<%=json%>