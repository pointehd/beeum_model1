<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.beeum.beeum.dao.ToursDAO"%>
<%@page import="com.beeum.beeum.vo.Tour"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String[] theme = request.getParameterValues("theme");
//인원수
String maximum = request.getParameter("maximum");
String minimum = request.getParameter("minimum");

String[] language = request.getParameterValues("language");

String[] level = request.getParameterValues("level");

String maxPrice = request.getParameter("maxPrice");
String minPrice = request.getParameter("minPrice");

String maxTime = request.getParameter("maxTime");

String[] food = request.getParameterValues("food");

String[] trans = request.getParameterValues("trans");

String gender = request.getParameter("gender");

String ageDate = request.getParameter("ageDate");

String oldDate = request.getParameter("oldDate");

String newDate = request.getParameter("newDate");

String startTime = request.getParameter("startTime");
String endTime = request.getParameter("endTime");

//인원수 int로 변환
int max = Integer.parseInt(maximum);
int min = Integer.parseInt(minimum);

//가격 int로 변환
int maxP = Integer.parseInt(maxPrice);
int minP = Integer.parseInt(minPrice);

//시간 int로 변환
int maxT = Integer.parseInt(maxTime);

//나이대 int로 변환
int age = Integer.parseInt(ageDate);

Map<String, Object> map = new HashMap<String, Object>();

map.put("themeList", theme);
map.put("maximum", max);
map.put("minimum", min);
map.put("languageList", language);
map.put("levelList", level);
map.put("maxPrice", maxP);
map.put("minPrice", minP);
map.put("maxTime", maxT);
map.put("foodList", food);
map.put("transList", trans);
map.put("gender", gender);
map.put("ageDate", age);
map.put("oldDate", oldDate);
map.put("newDate", newDate);
map.put("startTime", startTime);
map.put("endTime", endTime);

System.out.println(map);


List<Tour> list = ToursDAO.selectFilterList(map);

//ObjectMapper
ObjectMapper om = new ObjectMapper();

//리스트를 json으로
String json = om.writeValueAsString(list);

%>
<%=json%>