<%@page import="com.beeum.beeum.vo.AvalBee"%>
<%@page import="com.beeum.beeum.dao.AvalBeesDAO"%>
<%@page import="com.beeum.beeum.dao.AvalLangDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.beeum.beeum.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.beeum.beeum.dao.UsersDAO"%>
<%@page import="com.beeum.beeum.vo.PageVO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int pageNo =Integer.parseInt(request.getParameter("pageNo"));

	PageVO pageVO = new PageVO(pageNo ,5);
	List<User> userList = UsersDAO.selectProfile(pageVO);
	for(User user : userList){
		user.setLanguageList(AvalLangDAO.selectAvalLang(user.getNoUser()));
		user.setBeeList(AvalBeesDAO.selectList(user.getNoUser()));
	}
	
	
	ObjectMapper om = new ObjectMapper();

	String json = om.writeValueAsString(userList);
	
%>
<%= json %>