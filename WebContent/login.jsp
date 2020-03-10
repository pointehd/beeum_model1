<%@page import="com.beeum.beeum.dao.UsersDAO"%>
<%@page import="com.beeum.beeum.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/* 넘어온 parameter를 받아서 select구문을 날린다. 
   그거를 바로 session에 담으면 됨
*/
// 넘어온 파라미터는 String형임.
// 파라미터 : id, password



String email = request.getParameter("email");
String password = request.getParameter("password");

//유저가 입력한 id와 password만을 가지고있는 객체
//(DTO)
User user = new User(email, password);
/* member.setId(id);
member.setPassword(password); */

//데이터베이스에서 검색하여 넘어온 멤버객체


System.out.println(1);
/*  if(result==1){
	session.setAttribute("msg", "정상로그인되었습니다");
}  */
User loginUser = null;
loginUser = UsersDAO.selectLogin(user);

//System.out.println(loginUser);

session.setAttribute("loginUser", loginUser);

//request(요청)의 header의 referer속성이
//바로 이전페이지



String url = request.getHeader("referer");

/* System.out.println(url); */

response.sendRedirect(url);

%>