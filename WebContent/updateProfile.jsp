<%@page import="util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.beeum.beeum.vo.Language"%>
<%@page import="com.beeum.beeum.vo.AvalLang"%>
<%@page import="com.beeum.beeum.dao.LanguagesDAO"%>
<%@page import="com.beeum.beeum.dao.AvalLangDAO"%>
<%@page import="com.beeum.beeum.dao.UsersDAO"%>
<%@page import="com.beeum.beeum.vo.User"%>
<%@page import="com.beeum.beeum.dao.ProfilesDAO"%>
<%@page import="com.beeum.beeum.vo.Profile"%>
<%@page import="java.sql.Date"%>
<%@page import="com.beeum.beeum.vo.MyArea"%>
<%@page import="com.beeum.beeum.dao.MyAreaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
    
    
    
    	
    	String[] region = request.getParameterValues("region");
    	System.out.println(region[0]);
    	
    	String[] languages = request.getParameterValues("language");
    	System.out.println(languages[0]);
    	
    	/* String[] profilePics =	request.getParameterValues("profilePic");
    	System.out.println(profilePics[0]); */

    
    	
    	String profileName = request.getParameter("profileName");
    	System.out.println(profileName);
    	
    	String gender = request.getParameter("gender");
    	
    	String year = request.getParameter("year");
    	String month = request.getParameter("month");
    	String date = request.getParameter("date");
    	
    	Date birthDate = Date.valueOf(year+"-"+month+"-"+date);
    	System.out.println(birthDate);
    	
    	String shortIntro = request.getParameter("short_self_introduction");
    	System.out.println(shortIntro);
    	
    	String longIntro = request.getParameter("longIntro");
    	System.out.println(longIntro);
    	
    	
    	
    	
		
    	
    	
    	String E = request.getParameter("E");
    	String T = request.getParameter("T");
    	String F = request.getParameter("F");
    	String I = request.getParameter("I");
    	
    	String certificate = request.getParameter("certificate");
    	String license = request.getParameter("license");
    	
    	 //로그인 유저 찾기
    	User loginUser =(User)session.getAttribute("loginUser");
    	
    	
    	 System.out.print("유저번호 : "+ loginUser.getNoUser());
    	
    	//가능한 언어 삭제
    	 AvalLangDAO.delete(loginUser.getNoUser());
    	 
    	
    	
    	
    	
    	
    	
    	Profile profile = new Profile();
    	profile.setNoUser(loginUser.getNoUser());
    	profile.setGender(gender);
    	profile.setHoney(0);
    	profile.setLongIntro(longIntro);
    	profile.setName(profileName);
    	profile.setBirthDate(birthDate);
    	profile.setShortIntro(shortIntro);
    	profile.setPoint(0);
    	
    	/* for (String profilePic : profilePics) {
    		profile.setProfilePic(profilePic);
    	//profile insert setting
    	} */
    	
    	if(ProfilesDAO.hasUser(loginUser.getNoUser()) == 1){
    		ProfilesDAO.update(profile);
    	}else{
    		ProfilesDAO.insert(profile);	
    	}
    	
    	
    	//가지고 있는 지역를 지운다.
    	MyAreaDAO.delete(loginUser.getNoUser());
    	
    	
    	
    	//방금 입력한 지역를 넣는다.
    	for(String reg:region){
    		MyArea myArea = new MyArea();
    		myArea.setNoCity(Integer.parseInt(reg));
    		myArea.setNoUser(loginUser.getNoUser());    		
    		MyAreaDAO.insert(myArea);
    	}
    	
    	
    	
    	
    	User user = new User();
    	user.setNoUser(loginUser.getNoUser());
    	user.setName(profileName);
    	UsersDAO.updateName(user);
    	//user update end
    	
    	
    	//가능한 언어 입력
    	 for(String language : languages){
     		//Language language = new Language();
     		AvalLang avalLang = new AvalLang();
     		avalLang.setNoLang(Integer.parseInt(language));
     		avalLang.setNoUser(loginUser.getNoUser());
     		AvalLangDAO.insert(avalLang);
     		//System.out.print(languages[0]);
     		//System.out.print(languages[1]);
     		//System.out.print(languages[2]);
     	}
    	
    	
    	response.sendRedirect("/userInfo.jsp?noUser="+loginUser.getNoUser());
    	
    	/* 
    	MyAreaDAO.deleteByUserNo(유저번호);
    
    	for(String region : regions) {
    		out.print(region+"<br/>");
    		
    		MyArea area = new MyArea();
    		
    		area.setNoCity(Integer.parseInt(region));
    		area.setUserNo();
    		
    		MyAreaDAO.insert(area);
    	}
     */
     
     
    	
    	
    %>
    