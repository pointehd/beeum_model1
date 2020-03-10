<%@page import="com.beeum.beeum.dao.TourTermsDAO"%>
<%@page import="com.beeum.beeum.vo.TourTerm"%>
<%@page import="com.beeum.beeum.dao.TourAreaDAO"%>
<%@page import="com.beeum.beeum.vo.TourArea"%>
<%@page import="com.beeum.beeum.dao.CityDAO"%>
<%@page import="com.beeum.beeum.dao.TourPicsDAO"%>
<%@page import="com.beeum.beeum.vo.TourPic"%>
<%@page import="com.beeum.beeum.dao.TourLangDAO"%>
<%@page import="com.beeum.beeum.dao.LanguagesDAO"%>
<%@page import="com.beeum.beeum.vo.TourLang"%>
<%@page import="com.beeum.beeum.dao.CourseCategoriesDAO"%>
<%@page import="com.beeum.beeum.vo.CourseCategory"%>
<%@page import="com.beeum.beeum.dao.CoursesDAO"%>
<%@page import="com.beeum.beeum.dao.ToursDAO"%>
<%@page import="com.beeum.beeum.vo.Course"%>
<%@page import="com.beeum.beeum.vo.Tour"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* insert tours table */
	String noUser = request.getParameter("noUser");
	String title = request.getParameter("title");
	String theme = request.getParameter("thema");
	String gender = request.getParameter("gender");
	String startTime =request.getParameter("startTime");
	String endTime =request.getParameter("lastTime");
	String meetPoint = request.getParameter("meetPlaceName");
	String lat = request.getParameter("lat");
	String lng = request.getParameter("lng");
	String tourInfo = request.getParameter("tourIntroductionText");
	String totalDay = request.getParameter("totalDay");
	String totalHour = request.getParameter("totalHour");
	String totalMin = request.getParameter("totalMin");
	int totalTime = Integer.parseInt(totalDay)*1440 + Integer.parseInt(totalHour)*60+Integer.parseInt(totalMin);
	String minimum = request.getParameter("adultMinNum");
	String maximum = request.getParameter("adultMaxNum");
	String price = request.getParameter("adultPerPrice");
	

	Tour tour = new Tour();

	tour.setNoUser(Integer.parseInt(noUser));
	tour.setTitle(title);
	tour.setTheme(theme);
	tour.setTourInfo(tourInfo);
	tour.setGender(gender);
	tour.setStartTime(Integer.parseInt(startTime));
	tour.setEndTime(Integer.parseInt(endTime));
	tour.setMeetPoint(meetPoint);
	tour.setLat(lat);
	tour.setLng(lng);
	System.out.println(tour.getLat());
	System.out.println(tour.getLng());
	tour.setTotalTime(totalTime);
	tour.setMaximum(Integer.parseInt(maximum));
	tour.setMinimum(Integer.parseInt(minimum));
	tour.setPrice(Integer.parseInt(price));
	/* insert tours set end */
	int result1 = ToursDAO.insert(tour);
	System.out.println(result1+":(1이면 성공, 0이면 실패)(Tours 테이블)");
	//System.out.println("투어번호는:" + tour.getNoTour());
	
	
	/* insert Courses table */
	String[] category = request.getParameterValues("category");
	String[] categoryDetail = request.getParameterValues("categoryDetail"); 
	String[] hour = request.getParameterValues("hour");
	String[] min = request.getParameterValues("min");	
	String[] courseTitle = request.getParameterValues("courseTitle");
 	String[] coursePic = request.getParameterValues("coursePic"); 
	String[] tourText = request.getParameterValues("tourText");
	
	/*                                                        */
 	int noCourseCategory = 0;
 	int j=0;
	for(int i = 0; i<category.length;i++){
		Course course = new Course();
		course.setNoTour(tour.getNoTour());
		if(category[i].equals("이동") || category[i].equals("식사")){
			noCourseCategory = CourseCategoriesDAO.selectOne(categoryDetail[j++]);
			course.setNoCourseCategory(noCourseCategory);
		}else{
			noCourseCategory = CourseCategoriesDAO.selectOne(category[i]);
			course.setNoCourseCategory(noCourseCategory);
		}
		System.out.println("카테고리 번호"+noCourseCategory);
	/*                                                       */	
	
		
		title = courseTitle[i];
		course.setTitle(title); // 코스 제목( 오류 날 수도 아님, 값이 잘못 들어갈 수도)
		String fileName = coursePic[i];
		course.setFileName(fileName); // 코스사진파일 이름
		String content = tourText[i];
		course.setContent(content); // 내용
		int demandTime = Integer.parseInt(hour[i])*60 + Integer.parseInt(min[i]);
		course.setDemandTime(demandTime); // 소요 시간
		int result2 = CoursesDAO.insert(course);
		System.out.println(result2+":(1이면 성공, 0이면 실패)" +(i+1)+"개 성공(Courses 테이블)");
	}
	/* insert Courses table */
	
	/* insert language table */
	String[] lang = request.getParameterValues("language");
	for(int i=0; i<lang.length;i++){
		TourLang tourLang = new TourLang();
		tourLang.setNoTour(tour.getNoTour()); // 투어번호
		String language = lang[i];
		int noLang = LanguagesDAO.selectOne(language);//언어번호
		tourLang.setNoLang(noLang);
		int result3 = TourLangDAO.insert(tourLang);
		System.out.println(result3+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(Languages 테이블)");
	}
	/* insert language table */
	
	/* insert tour_Pics table */
	String[] tourIntroPic = request.getParameterValues("tourIntroPic");
	String fileName = null;
	for(int i=0; i<tourIntroPic.length;i++){
		TourPic tourPic = new TourPic();
		tourPic.setNoTour(tour.getNoTour());// 투어번호
		if(i==0){
			tourPic.setType("S");
		}else{
			tourPic.setType("T");
		}// if ~ else end, 사진 타입
		fileName = tourIntroPic[i];
		tourPic.setFileName(fileName);// 파일이름
		
		int result4 = TourPicsDAO.insert(tourPic);
		System.out.println(result4+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(Tour_pics 테이블)");
	}// for end
	String[] meetPlaPic = request.getParameterValues("meetPlaPic");
	for(int i=0; i<meetPlaPic.length;i++){
		TourPic tourPic = new TourPic();
		tourPic.setNoTour(tour.getNoTour());// 투어번호
		tourPic.setType("M");// 사진타입
		fileName = meetPlaPic[i];
		tourPic.setFileName(fileName);// 파일 이름
		
		int result5 = TourPicsDAO.insert(tourPic);
		System.out.println(result5+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(Tour_pics 테이블)");
	}// for end
	/* insert tour_Pics table end */
	
	/* insert tour_area table end */
	String[] city = request.getParameterValues("region");
	for(int i = 0; i<city.length;i++){
		int noCity = CityDAO.selectOne(city[i]); // 지역번호 받아오기
		TourArea tourArea = new TourArea();
		tourArea.setNoTour(tour.getNoTour());// 투어번호
		tourArea.setNoCity(noCity);// 지역번호

		int result6 = TourAreaDAO.insert(tourArea);
		System.out.println(result6+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(Tour_area 테이블)");
	}
	/* insert tour_area table end */
	/* 여기까진 완료 */
	
	/* insert tour_terms table */
	String[] includePrice = request.getParameterValues("includePrice");
	String content = null;
	for(int i=0;i<includePrice.length;i++){
		TourTerm tourTerm = new TourTerm();
		tourTerm.setNoTour(tour.getNoTour());//투어번호
		tourTerm.setType("I"); // 조건
		content = includePrice[i];
		tourTerm.setContent(content); // 내용

		int result7 = TourTermsDAO.insert(tourTerm);
		System.out.println(result7+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(tour_terms 테이블)");
	}	
	String[] excludePrice = request.getParameterValues("excludePrice");
	for(int i=0;i<excludePrice.length;i++){
		TourTerm tourTerm = new TourTerm();
		tourTerm.setNoTour(tour.getNoTour());//투어번호
		tourTerm.setType("E"); // 조건
		content = excludePrice[i];
		tourTerm.setContent(content); // 내용

		int result7 = TourTermsDAO.insert(tourTerm);
		System.out.println(result7+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(tour_terms 테이블)");
	}
	String[] announcement = request.getParameterValues("announcement");
	for(int i=0;i<announcement.length;i++){
		TourTerm tourTerm = new TourTerm();
		tourTerm.setNoTour(tour.getNoTour());//투어번호
		tourTerm.setType("M"); // 조건
		content = announcement[i];
		tourTerm.setContent(content); // 내용
		
		int result7 = TourTermsDAO.insert(tourTerm);
		System.out.println(result7+":(1이면 성공, 0이면 실패)" + (i+1)+"개 성공(tour_terms 테이블)");
	}
	/* insert tour_terms table end*/
	
	/* 	Course course = new Course();
	//course.setNoCourse(noCourse); 구하려면 따로 방법 필요 */
	
	//int no = Integer.parseInt(noUser);
	response.sendRedirect("/userInfo.jsp?noUser="+noUser);
%>