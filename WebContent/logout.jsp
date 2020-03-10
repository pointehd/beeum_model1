<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//session.removeAttribute("loginMember");
//로그인 빼고 다른데서도 session을 쓰면 remoiveAttribute를 써야됨

session.invalidate();
//세션 자체를 무효화 시키는 방법

String url = request.getHeader("referer");

//System.out.println(url);

response.sendRedirect(url);

%>