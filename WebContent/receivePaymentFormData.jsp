<%@page import="com.beeum.beeum.vo.Payment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noUser = request.getParameter("noUser");
	String noTour = request.getParameter("noTour");
	String name = request.getParameter("participant");
	String phoneNum = request.getParameter("phoneNum");
	String payMethod = request.getParameter("payment");
	String usedHoney = request.getParameter("numberHoney");
	/* 시작날짜 끝나는 날짜 받아오는 것 안 되어있음 */
	
	System.out.println(noUser);
	System.out.println(noTour);
	System.out.println(name);
	System.out.println(phoneNum);
	System.out.println(payMethod);
	System.out.println(usedHoney);
	
	
	Payment payment = new Payment();
	
	payment.setNoUser(Integer.parseInt(noUser));
	payment.setNoTour(Integer.parseInt(noTour));
	payment.setName(name);
	payment.setPhoneNum(Integer.parseInt(phoneNum));
	payment.setPayMethod(payMethod);
	payment.setUsedHoney(Integer.parseInt(usedHoney));
	/* 시작날짜 끝나는 날짜 넣는 것 안 되어있음 */
	
	
	
	
	
%>