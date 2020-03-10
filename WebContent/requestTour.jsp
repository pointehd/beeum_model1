<%@page import="com.beeum.beeum.dao.TravelersDetailDAO"%>
<%@page import="com.beeum.beeum.dao.RequestThemeDAO"%>
<%@page import="com.beeum.beeum.vo.TravelersDetail"%>
<%@page import="com.beeum.beeum.vo.RequestTheme"%>
<%@page import="com.beeum.beeum.dao.RequestToursDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="com.beeum.beeum.vo.RequestTour"%>
<%@page import="com.beeum.beeum.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User)session.getAttribute("loginUser"); 
	String targetStr = request.getParameter("target");//
	String startStr = request.getParameter("start");//
	String endStr = request.getParameter("end");//
	String cityStr = request.getParameter("city");//
	String meetText = request.getParameter("meetText");//
	String[] themeStr =request.getParameterValues("theme");
	String[] ageStr =request.getParameterValues("age");
	String[] genderStr =request.getParameterValues("gender");
	String[] countStr =request.getParameterValues("count");
	String priceStr = request.getParameter("price");
	Date startDate = Date.valueOf(startStr);
	Date endDate = Date.valueOf(endStr);

	
	
	RequestTour requestTour = new RequestTour();
	requestTour.setNoUser(loginUser.getNoUser());
	
	Integer noTarget=null;
	if(targetStr.length()>0){
		noTarget = Integer.parseInt(targetStr);
	}
	
	requestTour.setNoTarget(noTarget);
	
	requestTour.setNoCity(Integer.parseInt(cityStr));
	requestTour.setStartDate(new Timestamp(startDate.getTime()));
	requestTour.setEndDate(new Timestamp(endDate.getTime()));
	requestTour.setMeetPoint(meetText);
	requestTour.setBudget(Integer.parseInt(priceStr));
	
	
	RequestToursDAO.insert(requestTour);	
	
	for(String s : themeStr){
		RequestTheme requestTheme = new RequestTheme();
		requestTheme.setNoReqTour(requestTour.getNoReqTour());
		requestTheme.setTheme(s);
		RequestThemeDAO.insert(requestTheme);
	}
	for(int i=0; i<ageStr.length; i++){
		TravelersDetail travelersDetail = new TravelersDetail();
		travelersDetail.setNoReqTour(requestTour.getNoReqTour());
		travelersDetail.setGender(genderStr[i].equals("남")?"M":"F");
		travelersDetail.setAge(Integer.parseInt(ageStr[i]));
		travelersDetail.setPax(Integer.parseInt(countStr[i]));
		TravelersDetailDAO.insert(travelersDetail);
	}
	 response.sendRedirect(request.getHeader("referer"));
%>