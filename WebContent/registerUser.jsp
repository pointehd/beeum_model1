<%@page import="com.beeum.beeum.dao.UsersDAO"%>
<%@page import="com.beeum.beeum.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	User user = new User();
	
	user.setName(name);
	user.setEmail(email);
	user.setPassword(password);
	
	int result = UsersDAO.insert(user);
	
	String url = request.getHeader("referer");

	/* System.out.println(url); */

	response.sendRedirect(url);

%>
