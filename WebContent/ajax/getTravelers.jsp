<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.beeum.beeum.vo.FilterVO"%>
<%@page import="com.beeum.beeum.dao.AvalBeesDAO"%>
<%@page import="com.beeum.beeum.vo.AvalBee"%>
<%@page import="com.beeum.beeum.dao.ToTravelerReviewsDAO"%>
<%@page import="com.beeum.beeum.vo.TravelersDetail"%>
<%@page import="com.beeum.beeum.dao.TravelersDetailDAO"%>
<%@page import="com.beeum.beeum.vo.RequestTheme"%>
<%@page import="com.beeum.beeum.dao.RequestThemeDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.beeum.beeum.dao.RequestToursDAO"%>
<%@page import="com.beeum.beeum.vo.RequestTour"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String pageNoStr = request.getParameter("page");
	String pax = request.getParameter("pax");
	String[] genders = request.getParameterValues("gender");
	String[] themes = request.getParameterValues("theme");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String[] regions = request.getParameterValues("region");
	String age = request.getParameter("age");
	String price = request.getParameter("price");
	
	/* 
	System.out.println(pageNoStr);
	System.out.println(pax);
	System.out.println(genders);
	System.out.println(themes);
	System.out.println(start);
	System.out.println(end);
	System.out.println(regions);
	System.out.println(age);
	System.out.println(price);
	 */
	///////////////////////

	FilterVO filter = new FilterVO(1,10);
	////////////
	filter.setPax(Integer.parseInt(pax));
	/////////////////////////
	System.out.println(age);
	
	if(age.length()>0 && !(age.equals("null"))){
	
		filter.setAge(Integer.parseInt(age));
	
	}
	///////////////////////////
	if(price.length()>0 && !(price.equals("null"))){
		
		filter.setPrice(Integer.parseInt(price));
		
	}
	///////////////////////////
	
	filter.setStart(Date.valueOf(start));
	
	System.out.println(filter.getStart());
	
	if(end.length()>0){
		
		filter.setEnd(Date.valueOf(end));
		
		System.out.println(filter.getEnd());
	}
	
	//////////////////////////////////////////
	
	String gender = "'";
	
	for(String x : genders) {
		
		gender+=x+"','";
	}
	
	gender = gender.substring(0,gender.lastIndexOf(","));
	
	System.out.println(gender);
	
	filter.setGender(gender);
	
	///////////////////////////////
	
	
 	if(regions!=null) {
 		
		String region = "";
		
		for(String x : regions) {
			
			region+=x+",";
		}
		
		region = region.substring(0,region.lastIndexOf(","));
		
		System.out.println(region);
		
		filter.setRegion(region); 
	
 	}//if() end
	
	/////////////////////////////////////////
	
	if(themes!=null) {
		
	 	String theme = "'";
		
		for(String x : themes) {
			
			theme+=x+"','";
		}
		
		theme = theme.substring(0,theme.lastIndexOf(","));
		
		System.out.println(theme);
		
		filter.setTheme(theme); 
	
	}//if() end
	
	////////////////////////////////////
	
	List<RequestTour> tours = RequestToursDAO.selectList(filter);	
	
	System.out.println(tours);
	
	for(RequestTour tour : tours) {
		
		List<RequestTheme> themelist = RequestThemeDAO.selectList(tour.getNoReqTour());
		tour.setThemeList(themelist);
		
		List<TravelersDetail> travelers  = TravelersDetailDAO.selectList(tour.getNoReqTour());
		tour.setTravelers(travelers);
		
		List<AvalBee> beeList = AvalBeesDAO.selectList(tour.getNoUser());
		tour.setBeeList(beeList);
		
		//위 tour에서 no user를 받아온다.//한 카드가 여러번 받아오는 건 아니지만 카드가 여러 개 반복
		/* int reviewCount= ToTravelerReviewsDAO.selectTravelerR(tour.getNoUser());
		tour.setReviewCount(reviewCount); */
		
	}//for() end
	
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(tours);

%>
<%=json%>
