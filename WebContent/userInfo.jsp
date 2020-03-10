<%@page import="com.beeum.beeum.dao.SuggestToursDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.beeum.beeum.vo.TravelersDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.beeum.beeum.dao.TravelersDetailDAO"%>
<%@page import="com.beeum.beeum.dao.RequestThemeDAO"%>
<%@page import="com.beeum.beeum.vo.RequestTheme"%>
<%@page import="com.beeum.beeum.dao.RequestToursDAO"%>
<%@page import="com.beeum.beeum.vo.RequestTour"%>
<%@page import="com.beeum.beeum.dao.WishDAO"%>
<%@page import="com.beeum.beeum.vo.Wish"%>
<%@page import="com.beeum.beeum.util.ThemeUtil"%>
<%@page import="com.beeum.beeum.dao.ToursDAO"%>
<%@page import="com.beeum.beeum.vo.Tour"%>
<%@page import="com.beeum.beeum.dao.LicenseDAO"%>
<%@page import="com.beeum.beeum.vo.License"%>
<%@page import="com.beeum.beeum.dao.CareersDAO"%>
<%@page import="com.beeum.beeum.vo.Career"%>
<%@page import="com.beeum.beeum.dao.ContactsDAO"%>
<%@page import="com.beeum.beeum.vo.Contact"%>
<%@page import="com.beeum.beeum.dao.AvalBeesDAO"%>
<%@page import="com.beeum.beeum.vo.AvalBee"%>
<%@page import="com.beeum.beeum.dao.CityDAO"%>
<%@page import="com.beeum.beeum.vo.City"%>
<%@page import="com.beeum.beeum.dao.AvalLangDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.beeum.beeum.vo.AvalLang"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="javax.websocket.Session"%>
<%@page import="com.beeum.beeum.util.NumberUtil"%>
<%@page import="com.beeum.beeum.dao.ProfilesDAO"%>
<%@page import="com.beeum.beeum.vo.Profile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int userNo=0;
    	String noStr = request.getParameter("noUser");
    	if(noStr!=null){
    		userNo = Integer.parseInt(noStr);	    	
    	}    	
    	User pageUser = UsersDAO.selectUser(userNo);    	
    	Profile profile = ProfilesDAO.selectProfile(userNo);
    	int now =Calendar.getInstance().get(Calendar.YEAR);
    	String a= null;
		if(profile !=null){
    		a = profile.getBirthDate().toString();
		}
    	//System.out.println(now-birYear+1);
    	
    	// 사용가능 언어가져오기
    	List<String> langList = AvalLangDAO.selectListString(userNo);
    	// 자신있는 지역 가져오기
    	List<City> cityList = CityDAO.selectList(userNo);
    	// 유저 
    	User user = UsersDAO.selectOne(userNo);
    	// 가능한 bee
    	List<AvalBee> beeList = AvalBeesDAO.selectList(userNo);
    	// 연락처
    	List<Contact> contactList = ContactsDAO.selectList(userNo);
    	// 경력
    	List<Career> careerList = CareersDAO.selectList(userNo);
    	// 자격증
    	List<License> licenseList = LicenseDAO.selectList(userNo);
    	
    	
    	// 개설된 투어
    	List<Tour> myTourList = ToursDAO.selectTourBox(userNo);
    	for(Tour tour: myTourList){
    		//투어에 가능한비 넣기
    		tour.setBeeList(beeList);
    	}
    	
    	//city 목록받기 시.만 받음
    	List<City> allCityList = CityDAO.selectBigCity();
    	
    	
    	//요청한 투어 받기 + //제안받은 투어
    	int suggestCount = 0;
    	List<RequestTour> reqTour = RequestToursDAO.selectListByUser(userNo);
    	for(RequestTour requestTour : reqTour){
    		requestTour.setBeeListStr(AvalBeesDAO.selectListOnlytType(userNo));
    		requestTour.setThemeListStr(RequestThemeDAO.selectListByReqTour(requestTour.getNoReqTour()));
    		requestTour.setTravList(TravelersDetailDAO.selectListByReqTour(requestTour.getNoReqTour()));
    		requestTour.setSugTourList(SuggestToursDAO.selectByReqNo(requestTour.getNoReqTour()));
    		for(Tour tour : requestTour.getSugTourList()){
    			tour.setBeeList(AvalBeesDAO.selectList(tour.getNoUser()));
    		}
    		suggestCount += requestTour.getSugTourList().size();
    	}
    	
    	
    	//요청 받은 투어
    	List<RequestTour> onlyMeReqTour =RequestToursDAO.selectListTargetNo(userNo);
    	for(RequestTour requestTour : onlyMeReqTour){
    		requestTour.setBeeListStr(AvalBeesDAO.selectListOnlytType(userNo));
    		requestTour.setThemeListStr(RequestThemeDAO.selectListByReqTour(requestTour.getNoReqTour()));
    		requestTour.setTravList(TravelersDetailDAO.selectListByReqTour(requestTour.getNoReqTour()));    		
    	}
    	
    	//내가 제안한 투어
    	List<RequestTour> suggestReqList = SuggestToursDAO.selectListByUserNo(userNo);
    	int getSuggestCont =0;
    	for(RequestTour tour:suggestReqList){
    		tour.setBeeListStr(AvalBeesDAO.selectListOnlytType(tour.getNoUser()));
    		tour.setThemeListStr(RequestThemeDAO.selectListByReqTour(tour.getNoUser()));
    		tour.setTravList(TravelersDetailDAO.selectListByReqTour(tour.getNoUser()));
    		Tour t = new Tour();
    		t.setNoUser(userNo);
    		t.setNoReqTour(tour.getNoReqTour());
    		tour.setSugTourList(SuggestToursDAO.selectOnlyMyReq(t));
    		for(Tour tc:tour.getSugTourList()){
    			tc.setBeeList(AvalBeesDAO.selectList(tc.getNoUser()));
    		}
    		getSuggestCont += tour.getSugTourList().size();
    	}
    	
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><%=pageUser.getName()%>님의 페이지</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
    	.btn_review_box{
    		padding: 10px;
    	}
    	.btn_review_box button{
    		padding: 10px 10px;
            border: 1px solid #424242;
            font-size: 15px;
            font-weight: bold;
            outline: none;
            background: transparent;
            transition: .2s ease;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
    	}
    	.btn_review_box button.on{
    		background: #fae100;
    	}
        body, button, a {
            font-family: 'Nanum Gothic Coding', monospace;
        }

        select.language {
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 18px;
            position: absolute;
            right: 0;
            top: 0;
            margin: 20px;
            font-weight: bold;
        }

        .content {
            width: 1080px;
            min-height: 400px;
            /*background: gray;*/
            margin: auto;
            position: relative;
        }

        .popup_title h1 {
            text-align: center;
            text-decoration: underline;
            /*background-color: #64b5f6;*/
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 25px;
            padding: 10px;
            font-weight: bold;
        }

        .popup_sub_title {
            margin-bottom: 20px;
        }

        .popup_sub_title h2 {
            text-align: center;
            font-size: 16px;
            font-family: 'Nanum Gothic Coding', monospace;
            font-weight: bold;
        }

        #cancelFindPwd,
        #cancelGivePopup,
        #cancelSuggestPopup,
        #cancelReportPopup,
        #cancelIcePopup {
            font-size: 40px;
            height: 46px;
            width: 54px;
            position: absolute;
            top: 5px;
            right: 5px;
            border: none;
            color: #9E9E9E;
            background-color: transparent;
            border-radius: 20px;
            outline: none;
        }

        #cancelFindPwd:hover,
        #cancelGivePopup:hover,
        #cancelSuggestPopup:hover,
        #cancelReportPopup:hover,
        #cancelIcePopup:hover {
            color: #424242;
        }

        #cancelFindPwd:active,
        #cancelGivePopup:active,
        #cancelSuggestPopup:active,
        #cancelReportPopup:active,
        #cancelIcePopup:active {
            color: #424242;
        }

        #profile {
            width: 1060px;
            min-height: 240px;
            padding: 10px;
            /*background: #e8eaf6;*/
            margin: auto;
            position: relative;
        }

        #nameBox {
            font-size: 30px;
            padding-top: 10px;
            margin-left: 20px;
            margin-bottom: 5px;
            position: relative;
        }

        .my_btn_box {
            position: absolute;
            bottom: 5px;
            right: 200px;
            /*background: red;*/
            display: none;
        }

        .my_btn_box button {
            padding: 10px 10px;
            border: 1px solid #424242;
            font-size: 15px;
            font-weight: bold;
            outline: none;
            background: transparent;
            transition: .2s ease;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        .my_btn_box button:hover {
            font-weight: bold;
            transform: scale(1.1);
        }

        .my_btn_box.on,
        .your_btn_box.on {
            display: block;
        }

        .your_btn_box {
            position: absolute;
            bottom: 5px;
            right: 200px;
            display: none;
            /*background: red;*/
        }

        .your_btn_box button {
            padding: 10px 10px;
            border: 1px solid lightgray;
            border-radius: 10px;
            font-size: 15px;
            font-weight: bold;
            outline: none;
            background: transparent;
            transition: .2s ease;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;

        }

        .your_btn_box button:hover {
            font-weight: bold;
            transform: scale(1.1);
        }

        #imgBox {
            width: 278px;
            height: 248px;
            /*background: red;*/
            border: 1px solid #FAE100;
            border-radius: 10px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            position: relative;
            margin-bottom: 5px;
        }
        
        #imgBox img{
            width: 278px;
            height: 248px;
            border-radius: 10px;
        }

        #imgCount {
            padding: 4px;
            font-size: 13px;
            position: absolute;
            top: 0;
            right:0;
        }

        #beeBox {
            width: 260px;
            height: 45px;
            margin-top:5px;
            margin-left: 5px;
            margin-bottom: 5px;
            /*background: green;*/
        }

        .bee {
            width: 45px;
            height: 45px;
            /*border: 1px solid #424242;*/
            border-radius: 2px;
            margin: 0 5px 0 0;
            /*background: red;*/
            float: left;
            font-size: 20px;
            line-height: 45px;
            font-weight: bold;
            text-align: center;
            position:relative;
        }
        
        .bee img{
            width:45px;
            height:45px;
            border-radius: 2px;
        }

        #profileContent {
            width: 773px;
            height: 248px;
            margin-bottom: 4px;
            position: absolute;
            top: 10px;
            left: 295px;
            border: 1px solid #FAE100;
            border-radius: 10px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        #shortIntroductionBox {
            height: 43px;
            width: 550px;
            /*background: red;*/
            text-indent: 5px;
            font-size: 20px;
            line-height: 45px;
            margin-bottom: 4px;
            /*border: 1px solid #424242;*/
            border-radius: 5px;
        }

        #shortIntroductionBox > em {
            font-weight: bold;
            font-size: 15;
        }

        .score_box {
            width: 200px;
            height: 82px;
            position: absolute;
            top: 0;
            right: 60px;
        }

        .score_box li {
            width: 80px;
            height: 80px;
            /*background: green;*/
            float: left;
            /*border: 1px solid #424242;*/
            margin-right: 10px;
            text-align: center;
        }

        .score_box li .score_img {
            width: 80px;
            height: 60px;
            text-align: center;
            /*background: blue;*/
        }
        .score_box li .score_img img{
            width:50px;
            padding-top:10px;
            height:40px;
        }

        .score_box li .score_text {
            width: 80px;
            height: 20px;
            line-height: 20px;
        }

        #languageBox, #areaBox {
            height: 43px;
            width: 598px;
            /*border: 1px solid #424242;*/
            border-radius: 5px;
            line-height: 43px;
            padding-left: 5px;
            margin-bottom: 4px;
        }

        #languageBox > .language,
        #areaBox > .area {
            padding: 0 10px;
            height: 30px;
            font-weight: bold;
            display: inline-block;
            /*background:#ffecb3;*/
            line-height: 31px;
            border: 1px solid lightgray;
            text-align: center;
            border-radius: 10px;
            margin-right: 15px;
        }

        #contactBox {
            width: 300px;
            height: 50px;
            /*border:1px solid #424242;*/
        }

        #moreProfile {
            width: 1080px;
            min-height: 100px;
            /*background: green;*/
            display: none;
            overflow: hidden;
            transition: 0.2s linear;
        }

        .contact li {
            float: left;
            width: 50px;
            height: 50px;
            margin-right: 5px;
            margin-left: 5px;
            /*border:1px solid #424242;*/
            border-radius: 7px;
            text-indent: -9999px;
            /* overflow: hidden; */
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            opacity: .5;
           	position:relative;
        }

        .contact li.on {
            background-image: url("img/contact1.jpg");
            cursor: pointer;
            opacity: 1;
        }
        .contact li:hover div{
        	display: block;
        }
        .contact li div{
        	background-color:#fae100;
        	width: 200px;
        	padding: 5px 15px;
        	position: absolute;
        	color: #424242;
        	font-size:17px;
        	line-height:30px;
        	text-align:center;
        	z-index: 3;
        	top: 50px;
        	left: 0;
        	display: none;
        	text-indent: 0;
        	border-radius: 10px;
        }
        
        .contact li:nth-child(1) {
            background-image: url("img/contact1.jpg");
        }
        .contact li:nth-child(2) {
            background-image: url("img/contact2.png");
        }

        .contact li:nth-child(3) {
            background-image: url("img/contact3.png");
        }

        .contact li:nth-child(4) {
            background-image: url("img/contact4.jpg");
        }

        .heart {
            width: 85px;
            height: 80px;
            /*background: rebeccapurple;*/
            line-height: 70px;
            position: absolute;
            color: #ec7283;
            font-size: 50px;
            text-align: center;
            transition: .2s ease;
            cursor: pointer;
            top: 0;
            right: 0;
        }
        #myTour .giveTourContent{
        	width: 240px;
            height: 302px;
            margin: 10px 20px;
            border: 1px solid lightgray;
            text-align:center;
            position: relative;
            float: left;
        }
		#myTour .giveTourContent .fa-plus-circle ,
        #newGiveTour .fa-plus-circle {
            font-size: 80px;
            line-height: 210px;
        }

        .heart:hover {
            transform: scale(1.1);
        }

        .stack_point_box,
        .honey_count_box {
            width: 80px;
            height: 60px;
            position: absolute;
            bottom: 5px;
            text-align: center;
            line-height: 20px;
            border: 1px solid lightgray;
            border-radius: 10px;
            padding: 5px;
        }
        
        .honey_count_box img{
            width: 50px;
            height: 50px;
        }

        .stack_point_box {
            right: 5px;
            height: 40px;
        }

        .point_box {
            /*background: yellow;*/
            width: 80px;
            height: 20px;
            display: block;
        }

        .point_text {
            font-size: 15px;
            height: 20px;
            width: 80px;
        }

        .honey_count_box {
            height: 80px;
            right: 5px;
            bottom: 60px;
        }

        .honey_img {
            height: 55px;
            width: 80px;
            /*background: yellow;*/
        }

        .honey_count {
            font-size: 15px;
            height: 10px;
            width: 80px;
        }

        #moreBtn {
            width: 1058px;
            height: 30px;
            /*background: red;*/
            border: 1px solid #FAE100;
             box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            clear: both;
            text-align: center;
            font-size: 15px;
            line-height: 30px;
            cursor: pointer;
            /*margin-top: 100px;*/
            transition: .2s linear;
            border-radius: 10px;
        }

        #moreBtn:hover {
            font-size: 17px;
            background: #FAE100;
        }

        .more_list {
            float: left;
            margin-bottom: 5px;
        }

        #moreProfile .title {
            width: 98px;
            height: 48px;
            border: 1px solid #FAE100;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            border-radius: 10px;
            text-align: center;
            line-height: 50px;
            margin-right: 10px;
        }

        #moreProfile .content {
            width: 928px;
            border: 1px solid #FAE100;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            min-height: 28px;
            border-radius: 10px;
            overflow: auto;
            padding: 10px;
            /*background:blue;*/
        }

        #moreProfile .content ul {
            list-style: circle;
            padding-left: 15px;
        }

        #userTour {
            width: 1060px;
            min-height: 600px;
            position: relative;
            padding: 10px;
            /*background: #e8eaf6;*/
            overflow: hidden;
        }

        #leftTab {
            position: relative;
            float: left;
            width: 178px;
            padding: 10px;
            min-height: 310px;
            border: 1px solid #FAE100;
            border-radius: 10px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            font-weight: bold;
        }

        #leftTab dt {
            font-size: 25px;
            color: #424242;
            margin-top: 20px;
            margin-bottom: 10px;

        }

        #leftTab dd {
            font-size: 20px;
            margin-bottom: 10px;
            margin-left: 10px;
        }

        #leftTab a:hover {
            text-decoration: underline;
        }

        #leftTab a {
            text-decoration: none;
            font-weight: bold;
            color: #424242;
        }

        #leftTab a:visited {
            color: #424242;
        }

        #leftTab a:visited.on {
            color: #ec7283;
        }

        .tab_content {
            min-height: 598px;
            float: left;
            width: 850px;
            position: relative;
            border: 1px solid #FAE100;
            border-radius: 10px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            margin-left: 8px;
            display: none;
        }

        .tab_content.on {
            display: block;
        }

        /* end리뷰 박스 */
        .review_box {
            border: 1px solid lightgray;
            border-radius: 10px;
            position: relative;
            width: 840px;
            height: 300px;/* 임시로 min-height 후기 내용 길이 논의 */
            margin-bottom: 0px;
            margin-top: 20px;
            left: 4px;
        }

        .review_first_line {
            /*border: 1px solid #424242;*/
            position: relative;
            /*overflow: hidden;*/
            height: 100px;
            width: 840px;
        }

        .writer_img {
            /*border: 1px solid #424242;*/
            position: absolute;
            width: 120px;
            height: 90px;
            top: 5px;
            left: 15px;
            border-radius: 10px;
        }

        .writer_info {
            position: absolute;
            /*overflow: hidden;*/
            /*border: 1px solid #424242;*/
            /*background: #FBC02D;*/
            width: 460px;
            height: 100px;
            left: 145px;
        }

        .writer_bee_level {
            position: relative;
            height: 50px;
        }

        .writer_bee_icon {
            width: 40px;
            height: 40px;
            float: left;
            text-align: center;
            line-height: 40px;
            position: relative;
            margin: 5px;
        }
        .writer_bee_icon img{
            width: 40px;
            height:40px;
            border-radius: 10px;
        }

        .reg_date {
            position: absolute;
            height: 50px;
            width: 100px;
            line-height: 50px;
            text-align: center;
            right: 20px;
            top: 0px;
            /*background: #EC407A;*/
        }

        .writer_name {
            position: absolute;
            height: 50px;
            width: 460px;
            text-indent: 10px;
            text-align: left;
            line-height: 50px;
            /*background: #00C853;*/
        }

        .bee_info {
            /*background: aquamarine;*/
            width: 230px;
            height: 100px;
            position: absolute;
            left: 590px;
        }

        .bee_img {
            width: 80px;
            height: 60px;
            position: relative;
            top: 20px;
            border-radius: 10px;
        }

        .bee_level {
            position: relative;
            height: 50px;
        }

        .review_box .bee_icon {
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            float: left;
            position: relative;
            /*margin: 1px;*/
            top: -40px;
            left: 84px;
        }
        .review_box .bee_icon img{
            width:30px;
            height:30px;
        }
        .review_last_line {
            position: relative;
            width: 840px;
            height: 50px;
            /*background: coral;*/
        }

        .review_box .tour_title {
            position: relative;
            width: 590px;
            height: 50px;
            line-height: 50px;
            text-indent: 15px;
            /*background: #00C853;*/
        }

        .review_box .evaluation {
            position: absolute;
            width: 250px;
            height: 50px;
            left: 590px;
            top: 0;
            /*background: maroon;*/
        }


        .review_box .hive_img {
            width: 40px;
            height: 40px;
            top: 5px;
            position: relative;
        }
        .request_box_cover{
            width: 240px;
            height: 300px;
            background: rgba(80, 80, 80, .7);
            position:absolute;
            left:0;
            top: 0;
            text-align: center;
            display: none;
            border-radius: 10px;
        }
        .request_box:hover .request_box_cover{
            display: block;
        }
        .request_box_cover button{
            width: 200px;
            height: 40px;
            margin-top: 120px;
            cursor: pointer;
            border:none;
            background: #FAE100;
            border-radius: 10px;
            font-size: 20px;
            font-weight: bold;
            font-family: 'Nanum Gothic Coding', monospace;
        }
        
        .request_box_cover .delete_request_tour {
            width: 200px;
            height: 40px;
            margin-top: 20px;
            cursor: pointer;
            border:none;
            background: #e29d8c;
            font-size: 20px;
            font-weight: bold;
            font-family: 'Nanum Gothic Coding', monospace;
        }

        .review_hover_box {
            position: relative;/* 이부분도 수정 요 */
            display: none;
            width: 300px;
            height: 300px;
            border: 1px solid #424242;
            border-radius: 10px;
        }

        .review_box .review_num {
            position: relative;
            left: 5px;
            top: 15px;
        }

        .review_box .bee_name {
            position: absolute;
            top: 60px;
            left: 80px;
            text-indent: 3px;
        }

        .review_second_line {
            position: relative;
            /*border: 1px solid #424242;*/
            width: 840px;
            height: 150px;
        }

        .review_contents {
            position: absolute;
            width: 540px;
            height: 100px;
            padding: 10px;
            left: 13px;
            top: 13px;
            /*background: darkviolet;*/
            border: 1px solid lightgray;
            overflow-y: scroll;
        }

        .review_photos {
            position: absolute;
            width: 240px;
            height: 120px;
            border: 1px solid lightgray;
            border-radius: 10px;
            right: 6px;
            top: 13px;
            cursor: pointer;
        }

        .review_img {
            width: 240px;
            height: 120px;
            border-radius: 10px;
        }

        /* end리뷰 박스 */
        /*나의 투어 박스*/
        .tour {
            width: 240px;
            min-height: 100px;
            background: white;
            position: relative;
            margin: 10px 20px;
            float: left;
            border: 1px solid lightgray;
            border-radius: 10px;
        }
        
        .receive_tour .tour,
        .suggest_tour .tour{
            margin:14px 20px;
        }
        
        .tour .my_tour_btn,
        .tour .ing_tour_btn{
            display:none;
            width:240px;
            height:30px;
            border-top:1px solid lightgray;
            text-align: center;
        }
        
        .tour .my_tour_btn.my,
        .tour .ing_tour_btn.my{
            display: block;
        }
        
        .tour .my_tour_btn button{
            width: 240px;
            height:30px;
            outline: none;
            background: transparent;
            font-family: 'Nanum Gothic Coding', monospace;
            border:none;
            color:#424242;
            cursor: pointer;
        }
        
        .tour .my_tour_btn button:hover{
            font-weight: bold;
            background: #FAE100;
        }

        .tour .ing_tour_btn button{
            width:119px;
            background:transparent;
            outline: none;
            cursor:pointer;
            display: inline-block;
            font-family: 'Nanum Gothic Coding', monospace;
            border:none;
            height:30px;
            /*border:1px solid #424242;*/
            /*border-top:1px solid #424242;*/
        }
        .tour .ing_tour_btn button:nth-child(1){
            border-right: 1px solid lightgray;
        }
        .tour .ing_tour_btn button:hover{
            background: #FAE100;
            font-weight: bold;
        }
        .tour .my_end_tour{
            width:240px;
            height:308px;
            background: #6b6a69;
            border-radius: 10px 10px 0px 0px;
            opacity:0.7;
            position:absolute;
            top:0;
            left:0;
            display:none;
        }

        
        .tour .my_end_tour.none{
            display:block;
        }
        
        .tour .my_end_tour>div{
            width:180px;
            height:60px;
			border-radius: 10px;
            font-size:20px;
            background:white;
            font-family: 'Nanum Gothic Coding', monospace;
            font-weight: bold;
            line-height: 60px;
            text-align: center;
            position: absolute;
            top:100px;
            left:30px;
        }
        
        .profile {
            width: 240px;
            height: 60px;
        }
        
        .profile_pic {
            width: 60px;
            height: 60px;
            position: absolute;
            top:0;
            left: 0;
            border-right:1px solid lightgray;
        }
        
        .pro_pic {
            width: 60px;
            height: 60px;
        }
        
        
        
        .profile_level {
            width: 180px;
            height: 30px;
            position: absolute;
            top:0;
            left: 60px;
        }
        
        .level {
            width: 24px;
            height: 24px;
            margin-top: 2px;
            margin-left: 6px;
            float: left;
            text-align: center;
            line-height: 24px;
        }
        
        .profile_name {
            width: 180px;
            height: 30px;
            position: absolute;
            top:30px;
            left: 60px;
            line-height: 30px;
            border-top:  1px solid lightgray;
        }
        
        .tour_pic {
            width: 240px;
            height: 100px;
            border-top:  1px solid lightgray;
            position: relative;
        }

        .tour_picture {
            width: 240px;
            height: 100px;
        }
        .tour_date{
            position: absolute;
            text-align: center;
            width:200px;
            left:20px;
            border: 1px solid lightgray;
            border-bottom: none;
            bottom: 0;
        }
        .tour .heart {
            width: 30px;
            height: 30px;
            position: absolute;
            top:5px;
            right: 0;
            text-align: center;
            font-size: 20px;
            line-height: 30px;
        }
        .tour_info {
            width:240px;
            height: 30px;
            font-size: 12px;
            line-height: 30px;
            border-top: 1px solid lightgray;
            text-indent: 5px;
        }
        
        #myTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }
        
         #ingTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }

         #suggestTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }
        
         #requestTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }                
        
         #completeTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }

         #receiveTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }
        
         #giveTour .tour_title {
        	border-top: 1px solid lightgray;
        	padding: 5px;
        }        
        
        .request_box .tour_title {
            width:240px;
            height: 30px;
            line-height: 30px;
            border-top: 1px solid lightgray;
        }
        
        .tour_score_price {
            width: 240px;
            height: 87px;
            position:relative;
            border-top:  1px solid lightgray;
        }
        .tour_score {
            width: 80px;
            height: 87px;
        }
        .honey {
            width: 80px;
            height: 61px;
        }
        .tour .honey_img {
            width: 50px;
            height: 50px;
            margin-left: 15px;
            margin-top: 5px;
        }
        .score {
            width: 80px;
            height: 26px;
            text-align: center;
            line-height: 26px;
            border-top:  1px solid lightgray;
        }
        .tour_price {
            width: 160px;
            height: 87px;
            border-left: 1px solid lightgray;
            position: absolute;
            top:0;
            right: 0;
            text-align: center;
            line-height: 87px;
        }
        /*나의 투어 박스*/

        /*위시리스트가 비어있을 때*/
        .not_like {
            position: absolute;
            left:175px;
            top: 100px;
            width: 500px;
            height: 300px;
            border: 1px solid #424242;
            text-align: center;
            font-size: 30px;
            display: none;
        }

        .not_like.no {
            display: block;
        }

        .not_like .top {
            margin-top: 75px;
            color: #ec7283;
        }

        /* //end 위시리스트가 비어있을 때*/

        /*위시*/
        .like_tour_box {
            width: 240px;
            height: 250px;
            border: 1px solid lightgray;
            border-radius: 10px;
            margin: 10px 20px;
            float: left;
            font-size: 15px;
            position: relative;
        }

        .like_tour_img {
            width: 240px;
            height: 100px;
            background: #ffecb3;
            border-bottom: 1px solid lightgray;
            position: relative;
            border-radius: 10px 10px 0px 0px;
        }
        .like_bee_img img{
            width:240px;
            height: 100px;
            
        }

        .like_tour_img .heart {
            width: 20px;
            height: 20px;
            font-size: 20px;
            position: absolute;
            line-height: 20px;
            top: 5px;
            right: 5px;
        }

        .like_tour_theme,
        .like_tour_title {
            width: 240px;
            height: 30px;
            line-height: 30px;
            border-bottom: 1px solid lightgray;
            text-indent: 8px;
        }

        .like_tour_score {
            width: 80px;
            height: 87px;
            margin-left: 5px;
            padding-right: 5px;
            /*background: red;*/
            float: left;
            border-right: 1px solid lightgray;
        }

        .tour_score_img {
            width: 80px;
            height: 60px;
            border-bottom: 1px solid lightgray;
            text-align: center;
        }
        .tour_score_img img{
            margin-top:5px;
            width:60px;
            height:50px;
        }


        .tour_score_text {
            width: 80px;
            height: 26px;
            text-align: center;
            line-height: 26px;
        }

        .like_tour_pay {
            width: 149px;
            height: 37px;
            margin-top: 25px;
            text-align: center;
            line-height: 17px;
            float: left;
            /*background: blue;*/
        }

        /*bee 위시*/
        .like_bee_box {
            width: 240px;
            height: 250px;
            border: 1px solid lightgray;
            border-radius: 10px;
            margin: 10px 20px;
            float: left;
            font-size: 15px;
            position: relative;
        }

        .like_bee_img {
            width: 240px;
            height: 100px;
            /*background: #ffecb3;*/
            border-bottom: 1px solid lightgray;
            position: relative;
        }
        .like_tour_img img{
            width: 240px;
            height:100px;
        }

        .like_bee_img .heart {
            width: 20px;
            height: 20px;
            font-size: 20px;
            position: absolute;
            line-height: 20px;
            top: 5px;
            right: 5px;
        }

        .like_bee_user {
            width: 240px;
            height: 60px;
            border-bottom: 1px solid lightgray;
            position: relative;
        }

        .like_user_img {
            width: 60px;
            height: 60px;
            /*background: blue;*/
        }
        .like_user_img img{
            width: 60px;
            height: 60px;
        }

        .like_user_bees {
            position: absolute;
            width: 179px;
            height: 30px;
            /*background: red;*/
            top: 3px;
            left: 65px;
        }

        #likeUser .like_user_bees .bee {
            width: 25px;
            height: 25px;
            font-size: 15px;
            line-height: 25px;
            float: left;
        }
        #likeUser .like_user_bees .bee img{
            width:25px;
            height: 25px;
        }

        .like_user_name {
            position: absolute;
            width: 179px;
            height: 30px;
            top: 30px;
            left: 60px;
            line-height: 30px;
            text-indent: 10px;
        }

        .like_bee_area {
            width: 240px;
            height: 30px;
            border-bottom: 1px solid lightgray;
            line-height: 30px;
            text-indent: 10px;
        }

        .like_bee_score {
            width: 240px;
            height: 57px;
            position: relative;
        }

        .tour_bee_img {
            width: 80px;
            height: 57px;
            border-right: 1px solid lightgray;
        }
        .tour_bee_img img{
            width:80px;
            height:57px;
        }
        #profileContent .bee{
            cursor: pointer;
        }

        .bee_score_text {
            width: 159px;
            height: 57px;
            text-align: center;
            line-height: 57px;
            position: absolute;
            top: 0;
            left: 81px;
        }

        #messageBoxTwo,
        #messageBoxOne {
            width: 850px;
            height: 40px;
            border-bottom: 1px solid lightgray;
            line-height: 40px;
        }

        #messageBoxTwo a {
            text-decoration: none;
            font-weight: bold;
            color: #424242;
            cursor: pointer;
        }

        .left_box {
            width: 250px;
            height: 40px;
            border-right: 1px solid lightgray;
            text-align: center;
            float: left;
        }

        .right_box {
            width: 599px;
            height: 40px;
            /*position:relative;*/
            /*background: red;*/
            float: left;
            position: relative;
            text-indent: 10px;
        }

        .right_box > .report_user {
            display: inline-block;
            right: 10px;
            position: absolute;
            top: 5px;
            border: 1px solid lightgray;
            outline: none;
            /*background-color: red;*/
            padding: 5px 7px;
            cursor: pointer;
        }

        .right_box > .report_user:hover {
            transform: scale(1.1);
            font-weight: bold;
        }

        #messageUserBox .like_bee_user {
            width: 235px;
        }

        #messageUserBox {
            width: 250px;
            height: 536px;
            border-right: 1px solid lightgray;
            overflow-y: scroll;
        }

        #messageUserBox .like_user_bees,
        #messageUserBox .like_user_name {
            width: 167px;
        }

        #messageUserBox .like_user_bees .bee {
            margin: 1px;
        }

        #messageUserBox .like_bee_user {
            width: 233px;
            height: 90px;
            position: relative;
            border-bottom: 1px solid lightgray;
        }

        #messageUserBox .bee {
            width: 27px;
            height: 27px;
            font-size: 15px;
            line-height: 27px;
        }
        #messageUserBox .bee img{
            width: 27px;
            height: 27px;
        }

        .last_text {
            width: 233px;
            border-top: 1px solid lightgray;
            height: 30px;
            text-indent: 10px;
            overflow: hidden;
        }

        #conversationBox {
            /*background: #00ecaf;*/
            width: 599px;
            height: 430px;
            position: absolute;
            top: 82px;
            left: 251px;
            overflow-y: scroll;
        }

        .your_message,
        .my_message {
            width: 560px;
            min-height: 15px;
            padding: 10px;
            /*background:blue;*/
            position: relative;
            overflow: hidden;
        }

        .your_message .profile_img {
            width: 70px;
            height: 70px;
            border: 2px solid #FAE100;
            border-radius: 70px;
            display: inline-block;
            position: relative;
            float: left;
        }

        .my_message .profile_img {
            display: none;
        }

        .your_message .user_name {
            width: 480px;
            height: 25px;
            position: relative;
            font-size: 20px;
            line-height: 25px;
            /*background:red;*/
            font-weight: bold;
            float: left;
            margin-top: 5px;
            text-indent: 5px;
        }

        .your_message .message_content {
            max-width: 350px;
            min-width: 10px;
            min-height: 15px;
            padding: 10px;
            position: relative;
            background: #FAE100;
            border-radius: 10px;
            float: left;
            margin-top: 5px;
            margin-left: 30px;
            /*clear: both;*/
        }

        .your_message .message_content:before {
            content: "";
            width: 0;
            height: 0;
            position: absolute;
            border-top: 20px solid #FAE100;
            border-left: 20px solid transparent;
            border-radius: 5px 0 0 0;
            left: -19px;
            top: 5px;
        }

        .your_message .message_time {
            font-size: 10px;
            width: 70px;
            position: relative;
            height: 20px;
            text-align: center;
            /*background: red;*/
            margin-top: 5px;
            float: left;
        }

        .my_message .message_time {
            font-size: 10px;
            width: 70px;
            position: relative;
            height: 20px;
            text-align: center;
            /*background: red;*/
            margin-top: 5px;
            float: right;
        }

        .my_message .user_name {
            display: none;
        }

        .my_message .message_content {
            max-width: 420px;
            min-width: 10px;
            min-height: 15px;
            padding: 10px;
            position: relative;
            background: #fff2c3;
            border-radius: 10px;
            float: right;
            margin-right: 25px;
        }

        .my_message .message_content:after {
            content: "";
            width: 0;
            height: 0;
            position: absolute;
            border-top: 20px solid #fff2c3;
            border-right: 20px solid transparent;
            border-radius: 0 5px 0 0;
            right: -19px;
            top: 5px;
        }

        #giveNumber select:nth-child(1) {
            width: 50px;
        }

        #giveNumber select:nth-child(2) {
            width: 100px;
        }

        #giveNumber input {
            width: 40px;
            text-align: center;
        }

        #giveNumber button {
            width: 23px;
            height: 23px;
            border: 1px solid lightgray;
            text-align: center;
            border-radius: 10px;
            background: transparent;
            text-indent: 0px;
            padding: 4px 3px;
            outline: none;
            cursor: pointer;
        }

        #giveNumber button:hover {
            background: #424242;
            color: white;
            font-weight: bold;
        }

        #giveNumber #addUser {
            width: 80px;
            font-size: 15px;
            height: 40px;
            padding: 0;
        }

        #giveNumBox {
            /*background: red;*/
            position: relative;
            overflow: hidden;
            border: 1px solid lightgray;
            border-radius: 10px;
        }

        #giveNumBox .give_num_content {
            padding: 2px 10px;
            background: #FAE100;
            position: relative;
            float: left;
            margin: 5px;
            line-height: 15px;
            border-radius: 10px;
        }

        #giveNumBox .give_num_content button {
            width: 23px;
            height: 23px;
            font-size: 17px;
            color: #9E9E9E;
            border-radius: 10px;
            background: transparent;
            outline: none;
            border: none;
        }

        #giveNumBox .give_num_content button:hover {
            color: #424242;
        }

        #messageTextBox {
            /*background:blue;*/
            border-top: 1px solid lightgray;
            width: 599px;
            height: 105px;
            position: absolute;
            top: 512px;
            left: 251px;
        }

        #messageTextBox button {
            border: 1px solid transparent;
        }

        #messageTextBox button:hover {
            font-weight: bold;
            border: 1px solid #424242;
        }

        #iceBreaking {
            display: block;
            padding: 3px 10px;
            margin: 5px 5px 1px 5px;

            border: none;
            cursor: pointer;
            background: #ffec46;
            border-radius: 5px;
        }

        #textNow {
            width: 500px;
            height: 55px;
            resize: none;
            padding: 5px;
            border-radius: 10px;
            border: 1px solid lightgray;
            display: block;
            margin-left: 5px;
            margin-top: 5px;
        }

        #sendMessage {
            width: 60px;
            height: 70px;
            cursor: pointer;
            line-height: 10px;
            display: block;
            position: absolute;
            top: 30px;
            right: 10px;
            background: #ffec46;
            border-radius: 10px;
        }

        #giveTour .giveTourContent {
            width: 240px;
            height: 302px;
            margin: 10px 20px;
            border: 1px solid lightgray;
        }

        #newGiveTour .fa-plus-circle {
            font-size: 80px;
            line-height: 210px;
        }

        #newGiveTour {
            text-align: center;
            font-size: 20px;
            line-height: 0;
            font-weight: bold;
            position:relative;
            float: left;
            color: #626262;
            border-radius: 10px;
        }

        #newGiveTour:hover {
            cursor: pointer;
            color: #424242;
        }

        #newGivePopup,
        #suggestPopup,
        #reportUserPopup,
        #iceBreakingPopup {
            width: 100%;
            height: 100%;
            position: fixed;
            display: none;
            top: 0;
            left: 0;
            z-index: 2;
            background: rgba(0, 0, 0, .8);
        }



        #reportPopupForm{
            width: 500px;
            height: 600px;
            background-color: #ffffff;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -250px;
            margin-top: -300px;
            /*border: 1px solid #424242;*/
            box-shadow: 0 0 5px 1px #FFFFFF;
        }
        #icePopupForm{
            width: 500px;
            height: 550px;
            background-color: #ffffff;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -250px;
            margin-top: -275px;
            /*border: 1px solid #424242;*/
            box-shadow: 0 0 5px 1px #FFFFFF;
        }

        #suggestPopupForm {
            width: 870px;
            height: 700px;
            background-color: #ffffff;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -435px;
            margin-top: -350px;
            /*border: 1px solid #424242;*/
            box-shadow: 0 0 5px 1px #FFFFFF;
        }

        #suggestTourContent {
            width: 870px;
            height: 540px;
            /*background:red;*/
            position: relative;
            overflow-y: scroll;
        }

        .suggest_check {
            width: 20px;
            height: 20px;
            /*background: red;*/
            position: absolute;
            right: 5px;
            top: 5px;
            font-size: 20px;
            text-align: center;
            line-height: 20px;
        }

        .suggest_check input {
            display: none;
        }

        .suggest_check label.on {
            color: green;
        }

        .suggest_check label {
            cursor: pointer;
            color: #616161;
        }

        #givePopupForm {
            width: 500px;
            height: 700px;
            background-color: #ffffff;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -250px;
            margin-top: -350px;
            /*border: 1px solid #424242;*/
            box-shadow: 0 0 5px 1px #FFFFFF;

        }

        .give_popup_content {
            width: 480px;
            height: 75px;
            margin: auto;
            margin-bottom: 9px;
            /*background: red;*/
        }

        .element_title {
            font-size: 18px;
            display: block;
            font-weight: bold;
            width: 100px;
            height: 25px;
            line-height: 20px;
        }

        #priceBox .element_title {
            width: 300px;
        }

        #giveTourArea > div {
            width: 240px;
            height: 50px;
            float: left;
        }

        .give_popup_content em {
            color: red;
        }

        .give_popup_content input {
            width: 220px;
            border: none;
            border-bottom: 3px solid #FAE100;
            font-size: 20px;
            /*line-height: 40px;*/
            outline: none;
            height: 30px;
            /*background: transparent;*/
        }

        .give_popup_content input:focus {
            border-bottom: 3px solid lightgray;
        }

        .give_popup_content select {
            width: 220px;
            border: 2px solid #FAE100;
            border-radius: 10px;
            outline: none;
            font-size: 17px;
            height: 30px;
        }
        #icePopupContent{
            height:350px;
        }
        .give_popup_content select:focus {
            border: 2px solid #424242;
        }
        #icePopupContent.give_popup_content label{
            width: 300px;
        }
        #icePopupContent.give_popup_content input{
            font-size: 16px;
            width: 470px;
            margin-bottom: 10px;
        }

        #giveTourTheme input {
            display: none;
        }

        #giveTourTheme label {
            padding: 5px 10px;
            border-radius: 10px;
            display: inline-block;
            border: 1px solid lightgray;
            margin: 5px 5px 0 0;
            font-size: 20px;
            cursor: pointer;
        }

        #giveTourTheme label:hover {
            font-weight: bold;
        }

        #giveTourTheme label.on {
            font-weight: bold;
            background: #FAE100;
            border: 1px solid transparent;
        }

        #givePopupBtn {
            /*position: relative;*/
            width: 400px;
            height: 40px;
            display: block;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 20px;
            margin: auto;
            font-weight: bold;
            box-shadow: 0 5px 5px 0 gray;
            background-color: #FAE100;
            transition: 0.2s ease;
            border: none;
            border-radius: 3px 3px 1px 1px;
        }

        #suggestPopupBtn,
        #newTourBtn {
            position: relative;
            width: 300px;
            height: 40px;
            display: block;
            float: right;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 20px;
            margin-right: 30px;
            font-weight: bold;
            box-shadow: 0 5px 5px 0 gray;
            background-color: #FFEE58;
            transition: 0.2s ease;
            border: none;
            border-radius: 3px 3px 1px 1px;
        }
        .levelup_way{
            min-width: 330px;
            position:absolute;
            border-radius: 10px;
            font-size: 17px;
            line-height: 19px;
            padding: 30px;
            z-index: 1;
            top:55px;
            left: 0px;
            background:#fcc200;
            display:none;
        }
        .levelup_way:after{
            content:"";
            width:0;
            height: 0;
            border-bottom: 15px solid #fcc200;
            border-right: 10px solid transparent;
            border-left: 10px solid transparent;
            position: absolute;
            top: -13px;
            left:5px;
        }
        #beeBox .bee:hover .levelup_way{
            display: block;
        }


        #reportUserBtn,
        #icePopupBtn{
            width: 400px;
            height: 40px;
            display: block;
            font-family: 'Nanum Gothic Coding', monospace;
            font-size: 20px;
            margin: auto;
            font-weight: bold;
            box-shadow: 0 5px 5px 0 gray;
            background-color: #FFEE58;
            transition: 0.2s ease;
            border: none;
            border-radius: 3px 3px 1px 1px;
        }

        #givePopupBtn:active,
        #suggestPopupBtn:active
        #newTourBtn:active,
        #reportUserBtn:active,
        #icePopupBtn:active{
            box-shadow: none;
            background-color: #FBC02D;
            transform: translate(0, 5px);
        }

        .fa-times-circle {
            cursor: pointer;
        }

        #reportUserContent {
            width: 450px;
            margin: auto;
            height: 400px;
        }

        #reportUserContent textarea {
            width: 450px;
            height: 350px;
            font-size: 16px;
            font-family: 'Nanum Gothic Coding', monospace;
            resize: none;
        }
        
        .request_box {
            /*margin: 20px 30px 0 0;*/
            margin: 10px 20px;
            width: 240px;
            min-height: 300px;
            border: 1px solid lightgray;
            border-radius: 10px;
            position: relative;
            float: left;
            font-size: 15px;
        }

        .bee_intro {
            height: 50px;
            border-bottom: 1px solid lightgray;
            position: relative;
        }

        .bee_pic {
            width: 40px;
            height: 40px;
            position: absolute;
            top: 5px;
            left: 5px;
        }
        .bee_right{
            width:190px;
            /*background:red;*/
            height:50px;
            right:0;
            top:0;
            position:absolute;
        }
        .bees_icon {
            position:absolute;
            width:200px;
            height: 25px;
        }

        .request_box .bee_icon {
            /*border: 1px solid #424242;*/
            float: left;
            width: 24px;
            height: 24px;
            margin: 0 2px 0 2px;
            text-align: center;
            position: relative;
        }
        .request_box .bee_icon img{
            width:24px;
            height:24px;
            border-radius: 10px;
        }

        .request_box .bee_name {
            position: absolute;
            border: 1px solid transparent;
            width: 100px;
            height: 20px;
            bottom: 0;
        }

        .selected_date {
            height: 30px;
            border-bottom: 1px solid lightgray;
            padding: 5px;
        }

        .start_date {
            text-indent: 8px;
        }

        .end_date {
            text-align: right;
        }

        .selected_area {
            height: 30px;
            border-bottom: 1px solid lightgray;
            line-height: 30px;
            text-indent: 10px;
        }

        .selected_theme {
            height: 60px;
            border-bottom: 1px solid lightgray;
        }

        .theme_tour {
            border: 1px solid lightgray;
            border-radius: 10px;
            text-align: center;
            width: 60px;
            height: 20px;
            line-height: 20px;
            margin: 4px 9px;
            float: left;
            /*padding: 3px;*/
        }

        .selected_tourist {
            border-bottom: 1px solid lightgray;
            height: 60px;
        }

        .tourist_detail {
            border: 1px solid lightgray;
            border-radius: 10px;
            text-align: center;
            width: 100px;
            height: 20px;
            line-height: 20px;
            margin: 4px 8px;
            float: left;
            /*padding: 1px;*/
        }

        .value {
            float: left;
            height: 50px;
        }

        .request_box .evaluation {
            position: absolute;
            /*border: 1px solid lightgray;*/
            bottom: 3px;
            left: 50px;
        }

        .request_box .hive_img {
            position: relative;
            left: 8px;
            width: 30px;
            height: 30px;
        }

        .request_box .price {
            /*border: 1px solid #424242;*/
            width: 100px;
            position: absolute;
            right: 30px;
            bottom: 10px;
        }
        .suggest_tour,
        .receive_tour{
            width: 850px;
            min-height:310px;
            position:relative;
            overflow: hidden;
            border-bottom: 1px dotted #424242;
            /*background:red;*/
        }
        .receive_tour .tour {
            cursor: pointer;
        }
        .tui-calendar{
        	z-index: 10;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %> 
<div id="iceBreakingPopup">
    <div id="icePopupForm">
        <div class="cancel_find_pwd">
            <button id="cancelIcePopup"><i class="far fa-times-circle"></i></button>
        </div>
        <div class="popup_title">
            <h1>IceBreaking</h1>
        </div>
        <div class="popup_sub_title">
            <h2>저는 이런사람이에요!! 해당내용은 상대방에게 전송됩니다.</h2>
        </div>
        <div id="icePopupContent" class="give_popup_content">
            <div><label for="personality" class="element_title">성격</label><input placeholder="ex)활발한 성격이에요" id="personality" class="ice_input"/>
            </div>
            <div><label for="interest" class="element_title">관심사</label><input placeholder="ex)엑티비티한 활동을 좋아해요" id="interest" class="ice_input"/></div>
            <div><label for="hobby" class="element_title">취미</label><input placeholder="ex)역사에 관심이 많아요" id="hobby" class="ice_input"/></div>
            <div><label for="likeFood" class="element_title">좋아하는 음식</label><input placeholder="ex)닭이 들어있으면 다좋아요" id="likeFood" class="ice_input"/>
            </div>
            <div><label for="hateFood" class="element_title">싫어하는 음식</label><input placeholder="ex)채식주의자입니다." id="hateFood" class="ice_input"/>
            </div>
        </div><!-- //#icePopupContent end -->
        <button id="icePopupBtn">전송하기</button>
    </div><!-- //#icePopupForm end -->
</div><!-- //#iceBreakingPopup end -->

<div id="reportUserPopup">
    <div id="reportPopupForm">
        <div class="cancel_find_pwd">
            <button id="cancelReportPopup"><i class="far fa-times-circle"></i></button>
        </div>
        <div class="popup_title">
            <h1>ooo신고하기</h1>
        </div>
        <div class="popup_sub_title">
            <h2>신고 사유를 입력해주세요. 허위신고시, 불이익이 있을수 있습니다.</h2>
        </div>
        <div id="reportUserContent">
            <label class="element_title" for="reportUserPopup">신고사유</label><textarea id="reportUserText"></textarea>
        </div>
        <button id="reportUserBtn">신고하기</button>
    </div><!-- //#reportPopupForm end -->
</div><!-- //#reportUserPopup end -->

<div id="suggestPopup">
    <div id="suggestPopupForm">
        <div class="cancel_find_pwd">
            <button id="cancelSuggestPopup"><i class="far fa-times-circle"></i></button>
        </div>
        <div class="popup_title">
            <h1>나의 투어 제안하기</h1>
        </div>
        <div id="suggestTourContent">
            <div class="like_tour_box">
                <div class="like_tour_img">
                    <div class="suggest_check"><label><i class="far fa-check-circle"></i><input
                            type="checkbox"/></label></div>
                </div>
                <div class="like_tour_theme">지역·(테마)투어·기간</div>
                <div class="like_tour_title">제주도 3박4일고고띠</div>
                <div class="like_tour_price">
                    <div class="like_tour_score">
                        <div class="tour_score_img"><img src="img/rotten%20tomato_3.png"/> </div>
                        <div class="tour_score_text">(80%,12)</div>
                    </div>
                    <div class="like_tour_pay"><p>&#8361;<em>99,999</em></p>1인(성인기준)</div>
                </div><!-- //.like_tour_score end -->
            </div><!-- //.like_tour_box end -->
        </div><!-- //#suggestTourContent end -->
        <button id="suggestPopupBtn">완료</button>
        <button id="newTourBtn">새로만들기</button>
    </div><!-- //#suggestPopupForm end -->
</div><!-- //#suggestPopup end -->

<div id="newGivePopup">
    <div id="givePopupForm">
        <div class="cancel_find_pwd">
            <button id="cancelGivePopup"><i class="far fa-times-circle"></i></button>
        </div>
        <div class="popup_title">
            <h1>투어 요청하기</h1>
        </div>
        <div id="givePopupContents">
        <form action="requestTour.jsp" method="post">
        	<input name="target" value="" type="hidden"/>
            <div id="giveTourDate" class="give_popup_content">
                <label for="datePic" class="element_title">날짜 선택<em>*</em></label>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                        <input id="startpicker-input2"
                        name="start"
                         type="text" aria-label="Date" autocomplete="off">
                        <span class="tui-ico-date"></span>
                        <div id="startpicker-container2" style="margin-left: -1px;"></div>
                    </div><!-- //.tui-datepicker-input end -->
                    
                    <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                        <input id="endpicker-input2"  
                        name="end"
                        type="text" aria-label="Date" autocomplete="off">
                        <span class="tui-ico-date"></span>
                        <div id="endpicker-container2" style="margin-left: -1px;"></div>
                    </div><!-- //.tui-datepicker-input end -->
                
            </div>
            <div id="giveTourArea" class="give_popup_content">
                <div><label for="areaText" class="element_title">만나는 장소</label><input name="meetText" id="areaText"/></div>
                <div><span class="element_title">여행 장소<em>*</em></span><select  name="city"  title="areaSelect" id="areaSelect">
                	<%for(City city : allCityList){ %>
                    <option value="<%=city.getNoCity()%>"><%=city.getCity() %></option>
                    <%} %>
                </select></div>
            </div>
            <div id="giveTourTheme" class="give_popup_content">
                <span class="element_title">테마<em>*</em></span>
                <div>
                    <label>로컬<input type="checkbox" id="localCheck" name="theme" value="L"/></label>
                    <label>역사<input type="checkbox" id="historyCheck" name="theme" value="H"/></label>
                    <label>체험<input type="checkbox" id="expCheck" name="theme" value="E"/></label>
                    <label>쇼핑<input type="checkbox" id="shopCheck" name="theme" value="S"/></label>
                    <label>자연<input type="checkbox" id="naturalCheck" name="theme" value="N"/></label>
                    <label>레포츠<input type="checkbox" id="reportCheck" name="theme" value="P"/></label>
                </div>
            </div><!-- //#giveTourTheme end -->
            <div id="giveNumber" class="give_popup_content">
                <span class="element_title">인원<em>*</em></span>
                <div>
                    <select id="giveNumGender">
                        <option>남</option>
                        <option>여</option>
                    </select>
                    <select id="giveNumAge">
                        <option value="10">10대</option>
                        <option value="20">20대</option>
                        <option value="30">30대</option>
                        <option value="40">40대</option>
                        <option value="50">50대</option>
                        <option value="60">60대</option>
                        <option value="70">70대 이상</option>
                    </select>
                    <button type="button" ><i class="fas fa-minus"></i></button>
                    <input value="1" id="giveNumCount">
                    <button type="button" ><i class="fas fa-plus"></i></button>
                    <button type="button" id="addUser">추가하기</button>
                </div>
            </div><!-- //#giveNumber end -->
            <div id="giveNumBox" class="give_popup_content">
                <script type="text/template" id="giveAddUser">
					
                    <div class="give_num_content"><@=user.age@>대, <@=user.gender@>, <@=user.count@>명
						<input type="hidden" name="age" value="<@=user.age@>"/>
						<input type="hidden" name="gender" value="<@=user.gender@>"/>
						<input type="hidden" name="count" value="<@=user.count@>"/>
                        <button><i class="far fa-times-circle"></i></button>
                    </div>
                </script>
                
            </div><!-- //#giveNumBox end -->
            <div id="priceBox" class="give_popup_content">
                <div><label for="areaText" class="element_title">1인당 총 예상금액(성인)</label>&#8361;<input
                        id="givePriceText" name="price"/></div>
            </div>
            <button id="givePopupBtn">완료</button>
            </form>
        </div><!-- //#givePopupContents end -->
    </div><!-- //#givePopupForm end -->
</div><!-- //#newGivePopup end -->

<div class="content_wrap">
        <div class="content">
            <h2 id="nameBox"><%=pageUser.getName()%>님의 페이지</h2>
            <div id="profile">
                <div id="imgBox">
                    <% if (user.getFileName()!=null) { %>
                         <img id="profileImgBox" src="img/<%=user.getFileName() %>"/>
                        <%} else { %>
                        <img id="profileImgBox" src="img/default.jpg"/>
                	<%} %>
                    <%--<div id="imgCount">1/10</div> --%>
                </div>
                <div id="profileContent">
                    <div id="beeBox">
                    	<%if(beeList.size()==0){ %>
                    		<div id="tourBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way">프로필을 작성하세요</div></div>
                    		<div id="koBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way">한국어로 된 투어를 개설해주세요</div></div>
	                        <div id="honeyBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way">한국어 외 다른 언어로 투어를 개설해주세요</div></div>
	                        <div id="bumbleBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way"><p>여러 외국인을 만나</p>누적 point를 1,000점 이상 모아주세요</div></div>
	                        <div id="wasp" class="bee"><img src="img/bee_default.png"/><div class="levelup_way"><p>관광통역 안내사 자격증을</p> beeum 메일로 보내주세요</div></div>
                        <%} else{%>
                    	<%for(int i = 0; i<beeList.size() ; i++){ 
                    		if(beeList.get(i).getType().equals("T")){
                    	%>
                        <div id="tourBee" class="bee"><img src="img/bee_tourBee%20.png"/><div class="levelup_way">여행을 떠나보세요</div></div>
                        <%break;
                        }else if(i==beeList.size()-1){ %>
                        <div id="tourBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way">프로필을 작성하세요</div></div>
                        <%}} %>
                        
                        <%for(int i = 0; i<beeList.size() ; i++){ 
                    		if(beeList.get(i).getType().equals("K")){
                    	%>
                        <div id="tourBee" class="bee"><img src="img/bee_koBee%20.png"/><div class="levelup_way">한국어로 외국인과 여행하세요</div></div>
                        <%break;
                        }else if(i==beeList.size()-1){ %>
                        <div id="koBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way">한국어로 된 투어를 개설해주세요</div></div>
                        <%}} %>
                        
                        <%for(int i = 0; i<beeList.size() ; i++){ 
                    		if(beeList.get(i).getType().equals("H")){
                    	%>
                        <div id="tourBee" class="bee"><img src="img/bee_honeyBee.png"/><div class="levelup_way">훌륭한 외국어 실력으로 외국인과 여행하세요</div></div>
                        <%break;
                        }else if(i==beeList.size()-1){ %>
                        <div id="honeyBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way">한국어 외 다른 언어로 투어를 개설해주세요</div></div>
                        <%}} %>
                                                
                        <%for(int i = 0; i<beeList.size() ; i++){ 
                    		if(beeList.get(i).getType().equals("B")){
                    	%>
                        <div id="tourBee" class="bee"><img src="img/bee_bumbleBee.png"/><div class="levelup_way">당신은 훌륭한 가이드입니다! 우리나라를 소개해주세요</div></div>
                        <%break;
                        }else if(i==beeList.size()-1){ %>
                        <div id="bumbleBee" class="bee"><img src="img/bee_default.png"/><div class="levelup_way"><p>여러 외국인을 만나</p>누적 point를 1,000점 이상 모아주세요</div></div>
                        <%}} %>
                                                
                        
                        <%for(int i = 0; i<beeList.size() ; i++){ 
                    		if(beeList.get(i).getType().equals("W")){
                    	%>
                        <div id="tourBee" class="bee"><img src="img/bee_wasp.png"/><div class="levelup_way">당신이 진정한 전문 가이드 !!</div></div>
                        <%break;
                        }else if(i==beeList.size()-1){ %>
                        <div id="wasp" class="bee"><img src="img/bee_default.png"/><div class="levelup_way"><p>관광통역 안내사 자격증을</p> beeum 메일로 보내주세요</div></div>
                        <%}}} %>
                                                
                    </div>
                    <div id="shortIntroductionBox">
                    	<% if(profile!=null){ %>
                    	<i class="fas fa-<%= profile.getGender().equals("F")? "fe": "" %>male"></i><span id="age"> <%=now-Integer.parseInt(a.substring(0,4))+1%> / </span><em
                            class="short_introduction"><%=profile.getShortIntro()%></em>
                            <%} %></div>
                    <div id="languageBox"><% for( String lang : langList){ %><span class="language"><%=lang %></span><% }%></div>
                    <div id="areaBox"><%for(City city : cityList) {%><span class="area"><%=city.getUpCity()!=null? city.getUpCity()+"/" : "" %><%=city.getCity() %></span><%} %></div>
                    <div id="contactBox">
                        <ol class="contact">
                        	<%if(contactList.size()==0){ %>
	                            <li>메일</li>
	                            <li>페이스북</li>
	                            <li>인스타그램</li>
	                            <li>트위터</li>                            
                        	<%}
                        	else{
                        		for(int i = 0; i< contactList.size(); i++){
                        	
                        		if(contactList.get(i).getType().equals("E")){
                        		%>
                        			<li class="on">메일<div><span><%=contactList.get(i).getAccount() %></span></div></li>
                      			<%
                      				break;
                      			} else if(contactList.size()-1 == i){ %>
                            		<li>메일</li>
                            <%}} %>
                            
                            <%for(int i = 0; i< contactList.size(); i++){
                        		if(contactList.get(i).getType().equals("F")){
                        		%>
                        			<li class="on">페이스북<div><span><%=contactList.get(i).getAccount() %></span></div></li>
                      			<%
                      				break;
                      			} else if(contactList.size()-1 == i){ %>
                            		<li>페이스북</li>
                            <%}} %>
                            
                            <%for(int i = 0; i< contactList.size(); i++){
                        		if(contactList.get(i).getType().equals("T")){
                        		%>
                        			<li class="on">트위터<div><span><%=contactList.get(i).getAccount() %></span></div></li>
                      			<%
                      				break;
                      			} else if(contactList.size()-1 == i){ %>
                            		<li>트위터</li>
                            <%}}} %>
                            
                            <%for(int i = 0; i< contactList.size(); i++){
                        		if(contactList.get(i).getType().equals("I")){
                        		%>
                        			<li class="on">인스타<div><span><%=contactList.get(i).getAccount() %></span></div></li>
                      			<%
                      				break;
                      			} else if(contactList.size()-1 == i){ %>
                            		<li>인스타</li>
                            <%}} %>
                            
                        </ol>
                    </div>
                    
                    <% if(loginUser!=null&&loginUser.getNoUser()==pageUser.getNoUser()) { %>
                    <div class="my_btn_box on">
                        <button type="button" onclick="location.href='updateProfileForm.jsp'" id="profileUpdateBtn"><i class="far fa-edit"></i> 프로필 수정</button>
                        <button type="button" onclick="" id="calenderUpdateBtn"><i class="far fa-calendar-alt"></i> 일정 수정</button>
                    </div>
                    <%}else { %>
                    <div class="your_btn_box on">
                        <button type="button"  onclick="" id="sandMessageBtn"><i class="far fa-comments"></i> 메세지 보내기</button>
                        <button type="button"  onclick="location.href='#newGivePopup'" id="sandQuestionBtn"><i class="fas fa-clipboard-list"></i> 투어 요청</button>
                    </div>
                    <%} %>
                    <div class="score_box">
                        <ul>
                            <li>
                                <div class="score_img"><img src="img/rotten%20tomato_<%if(profile!=null){if(profile.getLocalScore()>80){out.print(5);}else if(profile.getLocalScore()>60){out.print(4);}else if(profile.getLocalScore()>40){out.print(3);}else if(profile.getLocalScore()>20){out.print(2);}else if(profile.getLocalScore()>0){out.print(1);}else{out.print("default");}}else{out.print("default");} %>.png"/></div>
                                <span class="score_text"><i class="far fa-comment-alt"></i> <%=profile!=null?profile.getlReviewCnt() : 0 %></span>
                            </li>
                            <li>
                                <div class="score_img"><img src="img/rotten%20tomato_<%if(profile!=null){if(profile.getTravelScore()>80){out.print(5);}else if(profile.getTravelScore()>60){out.print(4);}else if(profile.getTravelScore()>40){out.print(3);}else if(profile.getTravelScore()>20){out.print(2);}else if(profile.getTravelScore()>0){out.print(1);}else{out.print("default");}}else{out.print("default");} %>.png"/></div>
                                <span class="score_text"><i class="far fa-comment-alt"></i> <%=profile!=null?profile.gettReviewCnt() :0 %></span>
                            </li>
                        </ul>
                    </div><!-- //.score_box end -->
                    <div class="heart"><i class="fas fa-heart"></i></div>
                    <div class="stack_point_box">
                        <span class="point_box">누적포인트</span>
                        <span class="point_text"><%=profile!=null? NumberUtil.toNumFormat(profile.getPoint()):"0"%>P</span>
                    </div>
                    <div class="honey_count_box">
                        <div class="honey_img"><img src="img/honey.png"/> </div>
                        <span class="honey_count"><%=profile!=null? NumberUtil.toNumFormat(profile.getHoney()):"0"%>개</span>
                    </div>
                </div><!-- //#profileContent end -->
				<%if(profile != null){ %>
                <div id="moreProfile">
                	<%if(profile.getLongIntro() != null){ %>
                    <div id="introduction" class="more_list title introduction">자기 소개</div>
                    <div id="introductionContent" class="more_list content introduction"><%=profile.getLongIntro()%></div>
                    <%} %>
                    <% if(careerList.size()>0){%>
                    <div id="record" class="more_list title record">이력 사항</div>
                    <div id="recordContent" class="more_list content record">
                        <ul>
                        	<%for(Career career : careerList){ %>
                            <li><%=career.getStartDate()/100+ " / "+ career.getStartDate()%100 %>  <%=career.getEndDate()!=0 ?" - "+ career.getEndDate()/100+" / "+ career.getEndDate()%100 : "" %> : <%=career.getContent() %></li>
                            <%} %>
                        </ul>
                    </div><!-- //#recordContent end -->
                    <%} %>
                    <%if(licenseList.size()>0){ %>
                    <div id="licence" class="more_list title ">자격증</div>
                    <div id="licenceContent" class="more_list content licence">
                    <%for(int i = 0; i< licenseList.size(); i++){ %>
                    	<%=licenseList.get(i).getLicense()%>
                     	<%if(licenseList.size()-1!=i){ out.print("/ ");} %>
                    <%}//for() end %>
                    </div>
                    <%}// if() end  %>
                </div><!-- //#moreProfile end -->
                <div id="moreBtn"><span>더 보기</span> <i class="fas fa-angle-down"></i></div>
                	<%} %>
            </div><!-- //#profile end -->
            <div id="userTour">
                <div id="leftTab">
                    <dl>
                        <dt>투어</dt>
                        <!-- a요소에 on 붙이기-->
                        <dd><a class="on"  href="" data-page="myTour">개설된 투어</a><em>(<%=myTourList.size() %>)</em></dd>
                        <dd><a href="" data-page="ingTour">진행중인 투어</a><em>(0)</em></dd>
                        <dd><a href="" data-page="completeTour">완료된 투어</a><em>(0)</em></dd>
                        <%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                        <dd><a href="" data-page="receiveTour">제안받은 투어</a><em>(<%=suggestCount %>)</em></dd>
                        <dd><a href="" data-page="suggestTour">제안한 투어</a><em>(<%=getSuggestCont %>)</em></dd>
                        <%} %>
                        <%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                        <dd><a href="" data-page="requestTour">요청받은 투어</a><em>(<%=onlyMeReqTour.size() %>)</em></dd>
                        <%} %>
                        <dd><a href="" data-page="giveTour">요청한 투어</a><em>(<%=reqTour.size() %>)</em></dd>
                        <%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                        <dt>위시리스트</dt>
                        <dd><a href="" data-page="likeTour">투어</a><em>(0)</em></dd>
                        <dd><a href="" data-page="likeUser">Bees</a><em>(0)</em></dd>
                        <%} %>
                        <dt>후기/메세지</dt>
                        <dd><a href="" data-page="receiveReview" class="get_review">받은 후기</a><em>.</em></dd>
                        <dd><a href="" data-page="fiveReview" class="writh_review">쓴 후기</a><em>.</em></dd>
                        <dd><a href="" data-page="message">메세지</a><em>(0)</em></dd>
                    </dl>
                </div><!-- //#leftTab end -->
                <div id="rightBox">
                
                    <div id="myTour" class="tab_content on">
                    	<%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                	    <div id="gogogo" class="giveTourContent"><p><i class="fas fa-plus-circle"></i></p>새로운 투어를 생성!
                	    </div>
                	    <%} %>
                	    <%for(Tour tour : myTourList){ %>
						<div class="tour"  data-tourNum="<%=tour.getNoTour()%>">
						<div class="tour_click">
							<input value = "<%=tour.getNoTour()%>" class="detailPage" type="hidden"/>
    					<div class="profile">
        					<div class="profile_pic">
        						<img class="pro_pic" src="img/<%=tour.getProfilePic()%>"/>
        					</div><!-- //.profile_pic end-->
        					<div class="profile_level">
        								<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("T")){
                    					%>
                        				<div class="level">
											<img src="img/bee_tourBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("K")){
                    					%>
                        				<div class="level">
											<img src="img/bee_koBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("H")){
                    					%>
                        				<div class="level">
											<img src="img/bee_honeyBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("B")){
                    					%>
                        				<div class="level">
											<img src="img/bee_bumbleBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("W")){
                    					%>
                        				<div class="level">
											<img src="img/bee_wasp.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
        					</div><!-- //.profile_level end -->
        					<div class="profile_name">&nbsp;<%=tour.getName() %></div><!--//profile_name-->
    					</div><!-- //.profile end -->
    					<div class="tour_pic">
    						<img class="tour_picture" src="img/<%=tour.getTourPic() %>"/>
        					<%-- <div class="heart"><i class="fas fa-heart"></i></div><!--//heart-->--%>
    					</div><!-- //.tour_pic end -->
    					<div class="tour_info"><%=tour.getCity() %> <%=ThemeUtil.themePrint(tour.getTheme())%>투어 </div><!--//tour_info-->
    					<div class="tour_title"><%=tour.getTitle() %></div><!--//tour_title-->
    					<div class="tour_score_price">
        					<div class="tour_score">
            					<div class="honey"><img class="honey_img" src="img/rotten tomato_<%if(0==(int)tour.getScore()/1){ out.print("default"); } else {out.print((int)tour.getScore());} %>.png"></div>
            					<div class="score"><i class="far fa-comment-alt"></i><%=tour.getReviewCount() %></div>
        					</div><!-- //.tour_score end -->
        					<div class="tour_price">&#8361;<%=NumberUtil.toNumFormat(tour.getPrice()) %> (1인)</div><!--//tour_price-->
    					</div><!-- //.tour_score_price end -->
    					<!--my 넣을 때 마이페이지-->
    					</div>
    					<div class="my_tour_btn my">
        					<button>종료하기</button>
    					</div>
    					<!--none 추가하면 종료한 투어-->
    					<div class="my_end_tour"><div>종료된 투어</div></div>
					</div><!-- //.tour end -->
					<%} %>
                    </div><!-- //#myTour end -->
                    <!--  -->
                    <!--  -->
                    <!--  -->
                    <div id="ingTour" class="tab_content">
                        <div class="tour">
                            <div class="profile">
                                <div class="profile_pic">
                                    <img class="pro_pic" src="img/pic2.png"/>
                                </div><!--//profile_pic-->
                                <div class="profile_level">
            						<div class="level">
										<img src="img/bee_tourBee%20.png" width="24" height="24"/>								
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_koBee%20.png" width="24" height="24"/>	
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_honeyBee.png" width="24" height="24"/>	
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_bumbleBee.png" width="24" height="24"/>	
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_wasp%20.png" width="24" height="24"/>
									</div><!--//level-->
                                </div><!-- //.profile_level end -->
                                <div class="profile_name">&nbsp;김아무개</div><!--//profile_name-->
                            </div><!-- //.profile end -->
                            <div class="tour_pic">
                                <img class="tour_picture" src="img/pic2.png"/>
                                <div class="heart"><i class="fas fa-heart"></i></div><!--//heart-->
                                <div class="tour_date">2018-11-05~2018-11-12</div>
                            </div><!-- //.tour_pic end -->
                            <div class="tour_info">제주도 역사투어</div><!--//tour_info-->
                            <div class="tour_title">제주도 역사 박물관 방문</div><!--//tour_title-->
                            <div class="tour_score_price">
                                <div class="tour_score">
                                    <div class="honey"><img class="honey_img" src="img/honey.png"></div>
                                    <div class="score">(72%, 35)</div>
                                </div><!-- //.tour_score end -->
                                <div class="tour_price">&#8361;10,000 (1인)</div><!--//tour_price-->
                            </div><!-- //.tour_score_price end -->
                            <!--my 넣을 때 마이페이지-->
                            <div class="ing_tour_btn my">
                                <button>신고하기</button><button>후기작성</button>
                            </div>
                        </div><!-- //.tour end -->
                    </div><!-- //#ingTour end -->
                    <!--  -->
                    <!--  -->
                    <!--  -->
                    <div id="completeTour" class="tab_content">
                        <div class="tour">
                            <div class="profile">
                                <div class="profile_pic">
                                    <img class="pro_pic" src="img/pic2.png"/>
                                </div><!-- //.profile_pic end -->
                                <div class="profile_level">
                                	<div class="level">
										<img src="img/bee_tourBee%20.png" width="24" height="24"/>								
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_koBee%20.png" width="24" height="24"/>	
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_honeyBee.png" width="24" height="24"/>	
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_bumbleBee.png" width="24" height="24"/>	
									</div><!--//level-->
            						<div class="level">
										<img src="img/bee_wasp%20.png" width="24" height="24"/>
									</div><!--//level-->
                                </div><!-- ///profile_level end -->
                                <div class="profile_name">&nbsp;김아무개</div><!--//profile_name-->
                            </div><!-- //.profile end -->
                            <div class="tour_pic">
                                <img class="tour_picture" src="img/pic2.png"/>
                                <div class="heart"><i class="fas fa-heart"></i></div><!--//heart-->
                                <div class="tour_date">2018-11-05~2018-11-12</div>
                            </div><!-- //.tour_pic end -->
                            <div class="tour_info">제주도 역사투어 </div><!--//tour_info-->
                            <div class="tour_title">제주도 역사 박물관 방문</div><!--//tour_title-->
                            <div class="tour_score_price">
                                <div class="tour_score">
                                    <div class="honey"><img class="honey_img" src="img/honey.png"></div>
                                    <div class="score">(72%, 35)</div>
                                </div><!-- //.tour_score end -->
                                <div class="tour_price">&#8361;10,000 (1인)</div><!--//tour_price-->
                            </div><!--//.tour_score_price end-->
                            <!--my 넣을 때 마이페이지-->
                            <div class="my_tour_btn my">
                                <button>신고하기</button>
                            </div>
                        </div><!-- //.tour end-->
                    </div><!-- //#completeTour end -->
                    <!--  -->
                    <!--  -->
                    <!--  -->
                    <div id="requestTour" class="tab_content">
                    <% for( RequestTour requestTour:onlyMeReqTour){ %>
                        <div class="request_box">
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="img/<%=requestTour.getFileName() %>" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                    	<%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("T")){ %>
                                        <div class="bee_icon"><img src="img/bee_tourBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("K")){ %>
                                        <div class="bee_icon"><img src="img/bee_koBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("H")){ %>
                                        <div class="bee_icon"><img src="img/bee_honeyBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("B")){ %>
                                        <div class="bee_icon"><img src="img/bee_bumbleBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("W")){ %>
                                        <div class="bee_icon"><img src="img/bee_wasp.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name"><%=requestTour.getName() %></div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getStartDate()) %></span> ~</div>
                                <div class="end_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getEndDate()) %></span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div><%=requestTour.getCity() %></div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                            <%for(String s : requestTour.getThemeListStr()){ %>
                                <div class="theme_tour"><%=ThemeUtil.themePrint(s)%></div>
                            <%} %>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                            <%for(TravelersDetail travelersDetail:requestTour.getTravList()){ %>
                                <div class="tourist_detail"><span><%=travelersDetail.getAge() %></span>대, <span><%=travelersDetail.getGender().equals("M")?"남":"여" %></span>, <span><%=travelersDetail.getPax() %></span>명</div>
                            <%} %>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                    <div class="hive"><img src="/img/rotten tomato_<%if(profile.getLocalScore()>80){out.print(5);}else if(requestTour.getScore()>60){out.print(4);}else if(requestTour.getScore()>40){out.print(3);}else if(requestTour.getScore()>20){out.print(2);}else if(requestTour.getScore()>0){out.print(1);}else{out.print("default");} %>.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i><%=requestTour.getCnt() %>개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span><%=new DecimalFormat("###,###,###").format(requestTour.getBudget()) %></span>/1인 <p>(성인기준)</p></div>
                            </div><!-- //.value end -->
                            <div class="request_box_cover"><button class="sandQuestionBtn" type="button">제안하기</button><button class="delete_request_tour" type="button">삭제하기</button></div>
                        </div><!-- //.request_box end -->
                    <%} %>
                    </div><!-- //#requestTour end -->
                    <!--  -->
                    <!--  -->
                    <!--  -->
                    <div id="suggestTour" class="tab_content">
                    <%for( RequestTour requestTour: suggestReqList){ %>
                        <div class="suggest_tour">
                        <div class="request_box">
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="img/<%=requestTour.getFileName() %>" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                    	<%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("T")){ %>
                                        <div class="bee_icon"><img src="img/bee_tourBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("K")){ %>
                                        <div class="bee_icon"><img src="img/bee_koBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("H")){ %>
                                        <div class="bee_icon"><img src="img/bee_honeyBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("B")){ %>
                                        <div class="bee_icon"><img src="img/bee_bumbleBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("W")){ %>
                                        <div class="bee_icon"><img src="img/bee_wasp.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name"><%=requestTour.getName() %></div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getStartDate()) %></span> ~</div>
                                <div class="end_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getEndDate()) %></span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div><%=requestTour.getCity() %></div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                           	<%for(String s : requestTour.getThemeListStr()){ %>
                                <div class="theme_tour"><%=ThemeUtil.themePrint(s)%></div>
                            <%} %>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                            <%for(TravelersDetail travelersDetail:requestTour.getTravList()){ %>
                                <div class="tourist_detail"><span><%=travelersDetail.getAge() %></span>대, <span><%=travelersDetail.getGender().equals("M")?"남":"여" %></span>, <span><%=travelersDetail.getPax() %></span>명</div>
                            <%} %>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                
                                    <div class="hive"><img src="/img/rotten tomato_<%if(requestTour.getScore()>80){out.print(5);}else if(requestTour.getScore()>60){out.print(4);}else if(requestTour.getScore()>40){out.print(3);}else if(requestTour.getScore()>20){out.print(2);}else if(requestTour.getScore()>0){out.print(1);}else{out.print("default");} %>.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i><%=requestTour.getCnt() %>개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span><%=new DecimalFormat("###,###,###").format(requestTour.getBudget()) %></span>/1인 <p>(성인기준)</p></div>
                            </div><!-- //.value end -->
                            <div class="request_box_cover"><button class="sandQuestionBtn" type="button">삭제하기</button></div>
                        </div><!-- //.request_box end -->
                            <!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!---->
                            <%for(Tour tour:requestTour.getSugTourList()){ %>
                            <div class="tour"  data-tourNum="<%=tour.getNoTour()%>">
						<div class="tour_click">
							<input value = "<%=tour.getNoTour()%>" class="detailPage" type="hidden"/>
    					<div class="profile">
        					<div class="profile_pic">
        						<img class="pro_pic" src="img/<%=tour.getProfilePic()%>"/>
        					</div><!-- //.profile_pic end-->
        					<div class="profile_level">
        								<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("T")){
                    					%>
                        				<div class="level">
											<img src="img/bee_tourBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("K")){
                    					%>
                        				<div class="level">
											<img src="img/bee_koBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("H")){
                    					%>
                        				<div class="level">
											<img src="img/bee_honeyBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("B")){
                    					%>
                        				<div class="level">
											<img src="img/bee_bumbleBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("W")){
                    					%>
                        				<div class="level">
											<img src="img/bee_wasp.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
        					</div><!-- //.profile_level end -->
        					<div class="profile_name">&nbsp;<%=tour.getName() %></div><!--//profile_name-->
    					</div><!-- //.profile end -->
    					<div class="tour_pic">
    						<img class="tour_picture" src="img/<%=tour.getTourPic() %>"/>
        					<%-- <div class="heart"><i class="fas fa-heart"></i></div><!--//heart-->--%>
    					</div><!-- //.tour_pic end -->
    					<div class="tour_info"><%=tour.getCity() %> <%=ThemeUtil.themePrint(tour.getTheme())%>투어 </div><!--//tour_info-->
    					<div class="tour_title"><%=tour.getTitle() %></div><!--//tour_title-->
    					<div class="tour_score_price">
        					<div class="tour_score">
            					<div class="honey"><img class="honey_img" src="img/rotten tomato_<%if(0==(int)tour.getScore()/1){ out.print("default"); } else {out.print((int)tour.getScore());} %>.png"></div>
            					<div class="score"><i class="far fa-comment-alt"></i><%=tour.getReviewCount() %></div>
        					</div><!-- //.tour_score end -->
        					<div class="tour_price">&#8361;<%=NumberUtil.toNumFormat(tour.getPrice()) %> (1인)</div><!--//tour_price-->
    					</div><!-- //.tour_score_price end -->
    					<!--my 넣을 때 마이페이지-->
    					</div>
                            </div><!-- //.tour end -->
                            <%} %>
                        </div><!-- //.suggest_tour_Box end-->
                        <%} %>
                    </div><!-- //#sugestTour end -->
                    <!--  -->
                    <!--  -->
                    <!--  -->
                    <%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                    <div id="receiveTour" class="tab_content">
                    	<% for( RequestTour requestTour:reqTour){ %>
                    	<div class="suggest_tour">
                        <div class="request_box">
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="img/<%=requestTour.getFileName() %>" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                    	<%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("T")){ %>
                                        <div class="bee_icon"><img src="img/bee_tourBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("K")){ %>
                                        <div class="bee_icon"><img src="img/bee_koBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("H")){ %>
                                        <div class="bee_icon"><img src="img/bee_honeyBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("B")){ %>
                                        <div class="bee_icon"><img src="img/bee_bumbleBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("W")){ %>
                                        <div class="bee_icon"><img src="img/bee_wasp.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name"><%=requestTour.getName() %></div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getStartDate()) %></span> ~</div>
                                <div class="end_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getEndDate()) %></span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div><%=requestTour.getCity() %></div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                           	<%for(String s : requestTour.getThemeListStr()){ %>
                                <div class="theme_tour"><%=ThemeUtil.themePrint(s)%></div>
                            <%} %>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                            <%for(TravelersDetail travelersDetail:requestTour.getTravList()){ %>
                                <div class="tourist_detail"><span><%=travelersDetail.getAge() %></span>대, <span><%=travelersDetail.getGender().equals("M")?"남":"여" %></span>, <span><%=travelersDetail.getPax() %></span>명</div>
                            <%} %>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                
                                    <div class="hive"><img src="/img/rotten tomato_<%if(requestTour.getScore()>80){out.print(5);}else if(requestTour.getScore()>60){out.print(4);}else if(requestTour.getScore()>40){out.print(3);}else if(requestTour.getScore()>20){out.print(2);}else if(requestTour.getScore()>0){out.print(1);}else{out.print("default");} %>.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i><%=requestTour.getCnt() %>개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span><%=new DecimalFormat("###,###,###").format(requestTour.getBudget()) %></span>/1인 <p>(성인기준)</p></div>
                            </div><!-- //.value end -->
                            <div class="request_box_cover"><button class="sandQuestionBtn" type="button">삭제하기</button></div>
                        </div><!-- //.request_box end -->
                            <!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!---->
                            <%for(Tour tour:requestTour.getSugTourList()){ %>
                            <div class="tour"  data-tourNum="<%=tour.getNoTour()%>">
						<div class="tour_click">
							<input value = "<%=tour.getNoTour()%>" class="detailPage" type="hidden"/>
    					<div class="profile">
        					<div class="profile_pic">
        						<img class="pro_pic" src="img/<%=tour.getProfilePic()%>"/>
        					</div><!-- //.profile_pic end-->
        					<div class="profile_level">
        								<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("T")){
                    					%>
                        				<div class="level">
											<img src="img/bee_tourBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("K")){
                    					%>
                        				<div class="level">
											<img src="img/bee_koBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("H")){
                    					%>
                        				<div class="level">
											<img src="img/bee_honeyBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("B")){
                    					%>
                        				<div class="level">
											<img src="img/bee_bumbleBee.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
                        				
                        				<%for(int i = 0; i<tour.getBeeList().size() ; i++){ 
              					      		if(tour.getBeeList().get(i).getType().equals("W")){
                    					%>
                        				<div class="level">
											<img src="img/bee_wasp.png" width="24" height="24"/>								
										</div><!--//level-->
                        				<%break;
                        				}else if(i==tour.getBeeList().size()-1){ %>
                        				<div class="level">
											<img src="img/bee_default.png" width="24" height="24"/>								
										</div><!--//level-->                        				
                        				<%}} %>
        					</div><!-- //.profile_level end -->
        					<div class="profile_name">&nbsp;<%=tour.getName() %></div><!--//profile_name-->
    					</div><!-- //.profile end -->
    					<div class="tour_pic">
    						<img class="tour_picture" src="img/<%=tour.getTourPic() %>"/>
        					<%-- <div class="heart"><i class="fas fa-heart"></i></div><!--//heart-->--%>
    					</div><!-- //.tour_pic end -->
    					<div class="tour_info"><%=tour.getCity() %> <%=ThemeUtil.themePrint(tour.getTheme())%>투어 </div><!--//tour_info-->
    					<div class="tour_title"><%=tour.getTitle() %></div><!--//tour_title-->
    					<div class="tour_score_price">
        					<div class="tour_score">
            					<div class="honey"><img class="honey_img" src="img/rotten tomato_<%if(0==(int)tour.getScore()/1){ out.print("default"); } else {out.print((int)tour.getScore());} %>.png"></div>
            					<div class="score"><i class="far fa-comment-alt"></i><%=tour.getReviewCount() %></div>
        					</div><!-- //.tour_score end -->
        					<div class="tour_price">&#8361;<%=NumberUtil.toNumFormat(tour.getPrice()) %> (1인)</div><!--//tour_price-->
    					</div><!-- //.tour_score_price end -->
    					<!--my 넣을 때 마이페이지-->
    					</div>
                            </div><!-- //.tour end -->
                            <%} %>
                        </div><!-- //.suggest_tour end-->
                        <%} %>
                    </div><!-- //#receiveTour end -->
                    <%} %>
                    <div id="giveTour" class="tab_content">
                    	<%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                        <div id="newGiveTour" class="giveTourContent"><p><i class="fas fa-plus-circle"></i></p>나의 여행을
                            요청하세요
                        </div>
                        <%}  %>
                        <% for( RequestTour requestTour:reqTour){ %>
                        <div class="request_box">
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="img/<%=requestTour.getFileName() %>" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                    	
                                    	<%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("T")){ %>
                                        <div class="bee_icon"><img src="img/bee_tourBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("K")){ %>
                                        <div class="bee_icon"><img src="img/bee_koBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("H")){ %>
                                        <div class="bee_icon"><img src="img/bee_honeyBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("B")){ %>
                                        <div class="bee_icon"><img src="img/bee_bumbleBee.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                        <%if(requestTour.getBeeList()!=null&&requestTour.getBeeList().contains("W")){ %>
                                        <div class="bee_icon"><img src="img/bee_wasp.png"/></div>
                                        <%} else{ %>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
                                        <%} %>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name"><%=requestTour.getName() %></div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getStartDate()) %></span> ~</div>
                                <div class="end_date"><span><%=new SimpleDateFormat("yyyy년 MM월 dd일").format(requestTour.getEndDate()) %></span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div><%=requestTour.getCity() %></div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                           	<%for(String s : requestTour.getThemeListStr()){ %>
                                <div class="theme_tour"><%=ThemeUtil.themePrint(s)%></div>
                            <%} %>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                            <%for(TravelersDetail travelersDetail:requestTour.getTravList()){ %>
                                <div class="tourist_detail"><span><%=travelersDetail.getAge() %></span>대, <span><%=travelersDetail.getGender().equals("M")?"남":"여" %></span>, <span><%=travelersDetail.getPax() %></span>명</div>
                            <%} %>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                
                                    <div class="hive"><img src="/img/rotten tomato_<%if(requestTour.getScore()>80){out.print(5);}else if(requestTour.getScore()>60){out.print(4);}else if(requestTour.getScore()>40){out.print(3);}else if(requestTour.getScore()>20){out.print(2);}else if(requestTour.getScore()>0){out.print(1);}else{out.print("default");} %>.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i><%=requestTour.getCnt() %>개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span><%=new DecimalFormat("###,###,###").format(requestTour.getBudget()) %></span>/1인 <p>(성인기준)</p></div>
                            </div><!-- //.value end -->
                            <div class="request_box_cover"><button class="sandQuestionBtn" type="button">삭제하기</button></div>
                        </div><!-- //.request_box end -->
                        <%} %>
                    </div><!-- //#giveTour end -->
                    
                    <%if(loginUser!=null && loginUser.getNoUser() == pageUser.getNoUser()){ %>
                    <div id="likeTour" class="tab_content">
                        <!--///없을때 !!!-->
                        <div class="not_like no">
                            <div class="top"><i class="fas fa-heart"></i></div>
                            <div class="middle">위시리스트가 비어있습니다.</div>
                            <div class="bottom">마음에 드는 투어를 추가해보세요</div>
                        </div>
                        <!--///없을때 !!!-->
                    </div><!-- //#likeTour end -->
                    
                    <!--언더스코어 템플릿 Tourlike id replayLike-->
                    
                    
                    <div id="likeUser" class="tab_content">
                        <!--///없을때 !!!-->
                        <div class="not_like no">
                            <div class="top"><i class="fas fa-heart"></i></div>
                            <div class="middle">위시리스트가 비어있습니다.</div>
                            <div class="bottom">마음에 드는 Bees를 추가해보세요</div>
                        </div><!-- //.not_like end -->
                    </div> <!-- //#likeUser end -->
                    
                    
                    <%} %>
                    <script type="text/template" id="replaytour">
					<div class="tour">
    					<div class="profile">
        					<div class="profile_pic">
            					<img class="pro_pic" src="img/pic2.png"/>
        					</div><!-- //.profile_pic end-->
        					<div class="profile_level">
            					<div class="level">
									<img src="img/bee_tourBee%20.png" width="24" height="24"/>								
								</div><!--//level-->
            					<div class="level">
									<img src="img/bee_koBee%20.png" width="24" height="24"/>	
								</div><!--//level-->
            					<div class="level">
									<img src="img/bee_honeyBee.png" width="24" height="24"/>	
								</div><!--//level-->
            					<div class="level">
									<img src="img/bee_bumbleBee.png" width="24" height="24"/>	
								</div><!--//level-->
            					<div class="level">
									<img src="img/bee_wasp%20.png" width="24" height="24"/>
								</div><!--//level-->
        					</div><!-- //.profile_level end -->
        					<div class="profile_name">&nbsp;김아무개</div><!--//profile_name-->
    					</div><!-- //.profile end -->
    					<div class="tour_pic">
        					<img class="tour_picture" src="img/pic2.png"/>
        					<div class="heart"><i class="fas fa-heart"></i></div><!--//heart-->
    					</div><!-- //.tour_pic end -->
    					<div class="tour_info">제주도 역사투어 </div><!--//tour_info-->
    					<div class="tour_title">제주도 역사 박물관 방문</div><!--//tour_title-->
    					<div class="tour_score_price">
        					<div class="tour_score">
            					<div class="honey"><img class="honey_img" src="img/honey.png"></div>
            					<div class="score">(72%, 35)</div>
        					</div><!-- //.tour_score end -->
        					<div class="tour_price">&#8361;10,000 (1인)</div><!--//tour_price-->
    					</div><!-- //.tour_score_price end -->
    					<!--my 넣을 때 마이페이지-->
    					<div class="my_tour_btn my">
        					<button>종료하기</button>
    					</div>
    					<!--none 추가하면 종료한 투어-->
    					<div class="my_end_tour"><div>종료된 투어</div></div>
					</div><!-- //.tour end -->
					</script>
                    <script type="text/template" id="replayTourLike">
                        <div class="like_tour_box">
                            <div class="like_tour_img">
                                <img src="img/Desert.jpg"/>
                                <div class="heart"><i class="fas fa-heart"></i></div>
                            </div>
                            <div class="like_tour_theme">지역·(테마)투어·기간</div>
                            <div class="like_tour_title">제주도 3박4일고고띠</div>
                            <div class="like_tour_price">
                                <div class="like_tour_score">
                                    <div class="tour_score_img"></div>
                                    <div class="tour_score_text"><i class="far fa-comment-alt"></i> 12</div>
                                </div>
                                <div class="like_tour_pay"><p>&#8361;<em>99,999</em></p>1인(성인기준)</div>
                            </div>
                        </div><!-- //.like_tour_box end -->
                    </script>
                    <!--end 언더스코어 템플릿 id replayLike-->
                    <script type="text/template" id="replayUserLike">
                        <div class="like_bee_box">
                            <div class="like_bee_img">
                                <img src="img/Desert.jpg">
                                <div class="heart"><i class="fas fa-heart"></i></div>
                            </div>
                            <div class="like_bee_user">
                                <div class="like_user_img"><img src="img/gong.jpg"/></div>
                                <div class="like_user_bees">
                                    <div class="bee"><img src="img/bee_tourBee%20.png"/></div>
                                    <div class="bee"><img src="img/bee_koBee%20.png"/></div>
                                    <div class="bee"><img src="img/bee_honeyBee.png"/></div>
                                    <div class="bee"><img src="img/bee_bumbleBee.png"/></div>
                                    <div class="bee"><img src="img/bee_wasp%20.png"/></div>
                                </div>
                                <div class="like_user_name">황동현</div>
                            </div>
                            <div class="like_bee_area">충남·천안</div>
                            <div class="like_bee_score">
                                <div class="tour_bee_img"><img src=""/></div>
                                <div class="bee_score_text"><i class="far fa-comment-alt"></i> 12</div>
                            </div>
                        </div>
                    </script>
                    <div id="receiveReview" class="tab_content">
                    	<div class="btn_review_box"><button class="on">Tour</button><button>Local</button></div>
                    
                    	
                        
                    </div>
                    
                    <div id="fiveReview" class="tab_content">
                    	<div class="btn_review_box"><button>Tour</button><button>Local</button></div>
                    	
                    </div>
                    <script type="text/template" id="ReplayBtnBox">
                    <div class="btn_review_box"><button class="oneB">Tour</button><button class="twoB">Local</button></div>
					</script>
                    <script type="text/template" id="noReplayTmp">
                    <div class="not_like no">
                            <div class="top"><i class="fas fa-heart"></i></div>
                            <div class="middle">받은 후기가 없습니다!</div>
                            <div class="bottom">새로운 여행을 다녀오시고 후기를 받으세요</div>
                        </div>
                    </script>
                    <script type="text/template" id="replayTmp">
					<@_.each(json, function(a){@>
					
						<div class="review_box">
                            <div class="review_last_line">
                                <div class="tour_title"><@=a.city@>·<@=tourName(a.theme)@> 투어·<@=a.title@></div>
                                <div class="evaluation">
                                    <div class="hive value"><img src="img/rotten tomato_<@if(a.hive>80){@>5<@}else if(a.hive>60){@>4<@}else if(a.hive>40){@>3<@}else if(a.hive>20){@>2<@}else if(a.hive>0){@>1<@}else{@>default<@}@>.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_hover_box">
                                        <h3>Tour Bee 평가</h3>
                                        <div class=""></div>
                                        <h3>Local Bee 평가</h3>
                                        <div class=""></div>
                                    </div><!-- .review_hover_box end -->
                                    <div class="review_num value"><i class="far fa-comment-alt"></i></div>
                                </div><!-- //.evaluation end -->
                            </div><!-- //.review_last_line end -->

                            <div class="review_first_line">
                                <div class="writer_photo"><img class="writer_img" src="img/<@=a.senderFile@>"></div>
                                <div class="writer_info">
                                    <div class="writer_bee_level">
                                        <@if(a.senderBees.includes("T")){@>
                                        <div class="writer_bee_icon"><img src="img/bee_tourBee.png"/></div>
										<@}else{@>
                                        <div class="writer_bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.senderBees.includes("K")){@>
                                        <div class="writer_bee_icon"><img src="img/bee_koBee.png"/></div>
										<@}else{@>
                                        <div class="writer_bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.senderBees.includes("H")){@>
                                        <div class="writer_bee_icon"><img src="img/bee_honeyBee.png"/></div>
										<@}else{@>
                                        <div class="writer_bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.senderBees.includes("B")){@>
                                        <div class="writer_bee_icon"><img src="img/bee_bumbleBee.png"/></div>
										<@}else{@>
                                        <div class="writer_bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.senderBees.includes("W")){@>
                                        <div class="writer_bee_icon"><img src="img/bee_wasp.png"/></div>
										<@}else{@>
                                        <div class="writer_bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
                                    </div><!-- //.writer_bee_level end -->
                                    <div class="reg_date"><@=moment(a.regDate).format("YYYY.MM.DD")@></div>
                                    <div class="writer_name"><@=a.senderName@></div>
                                </div><!-- //.writer_info end -->
                                <div class="bee_info">
                                    <div class="bee_photo"><img class="bee_img" src="img/<@=a.getterFile@>"></div>
                                    <div class="bee_level">
										<@if(a.getterBees.includes("T")){@>
                                        <div class="bee_icon"><img src="img/bee_tourBee.png"/></div>
										<@}else{@>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.getterBees.includes("K")){@>
                                        <div class="bee_icon"><img src="img/bee_koBee.png"/></div>
										<@}else{@>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.getterBees.includes("H")){@>
                                        <div class="bee_icon"><img src="img/bee_honeyBee.png"/></div>
										<@}else{@>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.getterBees.includes("B")){@>
                                        <div class="bee_icon"><img src="img/bee_bumbleBee.png"/></div>
										<@}else{@>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
										<@if(a.getterBees.includes("W")){@>
                                        <div class="bee_icon"><img src="img/bee_wasp.png"/></div>
										<@}else{@>
                                        <div class="bee_icon"><img src="img/bee_default.png"/></div>
										<@}@>
                                    </div><!-- //.bee_level end -->
                                    <div class="bee_name"><@=a.getterName@></div>
                                </div><!-- //.bee_info end -->
                            </div><!-- //.review_first_line end -->
                            <div class="review_second_line">
                                <div class="review_contents"><@=a.content@></div>
                                <div class="review_photos">
                                    <img class="review_img" src="img/<@=a.tourFile@>">
                                </div>
                            </div><!-- //.review_second_line -->
                        </div><!-- //.review_box end -->
					<@})@>
                    </script>
                    
                    <div id="message" class="tab_content">
                        <div id="messageBoxOne">
                            <div class="left_box">구 분</div>
                            <div class="right_box">주의 사항</div>
                        </div>
                        <div id="messageBoxTwo">
                            <div class="left_box">메세지 <span>(8)</span></div>
                            <div class="right_box"><a href="#">김현수</a>
                                <button class="report_user">신고</button>
                            </div>
                        </div>
                        <div id="messageUserBox">
                            <!--템플릿 예상-->
                            <div class="like_bee_user">
                                <div class="like_user_img"><img src="img/gong.jpg"/> </div>
                                <div class="like_user_bees">
                                    <div class="bee"><img src="img/bee_tourBee%20.png"/></div>
                                    <div class="bee"><img src="img/bee_koBee%20.png"/></div>
                                    <div class="bee"><img src="img/bee_honeyBee.png"/></div>
                                    <div class="bee"><img src="img/bee_bumbleBee.png"/></div>
                                    <div class="bee"><img src="img/bee_wasp%20.png"/></div>
                                </div>
                                <div class="like_user_name">황동현</div>
                                <div class="last_text"></div>
                            </div>
                            <!--템플릿 엔드-->
                            <div id="conversationBox">
                                <div id="messageScroll"></div>
                                <div class="your_message">
                                    <img class="profile_img" src="img/gong.jpg"/>
                                    <div class="user_name">황동현</div>
                                    <div class="message_content"><p>헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤</p></div>
                                    <div class="message_time"><p>2018-10-26</p>10:26</div>
                                </div> <!--// end your_message-->
                                <div class="your_message">
                                    <img class="profile_img" src="img/gong.jpg"/>
                                    <div class="user_name">황동현</div>
                                    <div class="message_content"><p>헤헤헤헤헤헤헤헤헤</p></div>
                                    <div class="message_time"><p>2018-10-26</p>10:26</div>
                                </div> <!--// end your_message-->
                                <div class="my_message">
                                    <img class="profile_img" src="img/gong.jpg"/>
                                    <div class="user_name">황동현</div>
                                    <div class="message_content"><p>뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥 뿌에에엥
                                        뿌에에엥 </p></div>
                                    <div class="message_time"><p>2018-10-26</p>10:26</div>
                                </div><!-- // end my_message-->
                                <div class="your_message">
                                    <img class="profile_img" src="img/gong.jpg"/>
                                    <div class="user_name">황동현</div>
                                    <div class="message_content"><p>헤헤헤헤헤헤헤zzzzzzzzzzzzzzzz헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤헤</p></div>
                                    <div class="message_time"><p>2018-10-26</p>10:26</div>
                                </div> <!--// end your_message-->
                                <div class="my_message">
                                    <img class="profile_img" src="img/gong.jpg"/>
                                    <div class="user_name">황동현</div>
                                    <div class="message_content"><p>z</p></div>
                                    <div class="message_time"><p>2018-10-26</p>10:26</div>
                                </div><!-- // end my_message-->
                                <div class="my_message">
                                    <img class="profile_img" src="img/gong.jpg"/>
                                    <div class="user_name">황동현</div>
                                    <div class="message_content"><p>z</p></div>
                                    <div class="message_time"><p>2018-10-26</p>10:26</div>
                                </div><!-- // end my_message-->
                            </div><!-- end #conversationBox-->
                            <div id="messageTextBox">
                                <button id="iceBreaking">아이스 브레이킹</button>
                                <textarea id="textNow"></textarea>
                                <button id="sendMessage">보내기</button>
                            </div><!-- end #messageTextBox-->
                        </div><!-- end #messageUserBox-->
                    </div>
                </div><!-- //#rightBox end-->
            </div><!--userTour end -->
        </div><!-- //.content end -->
</div><!--content_wrap--> 

<%@ include file="/WEB-INF/template/footer.jsp" %>    
<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/moment.min.js"></script>
<script src="/js/moment-with-locales.js"></script>
    <script src="/js/tui-time-picker.min.js"></script>
    <script src="/js/tui-date-picker.min.js"></script>
    <script src="/js/jquery.dropdown.js"></script>
<script src="/js/fix-footer.js"></script>
<script>

	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};

    var moreFlag = 0;
    var $moreBtn = $('#moreBtn i');
    var likeTourTmp = _.template($('#replayTourLike').html());
    var likeUserTmp = _.template($('#replayUserLike').html());
    var ReviewTmp = _.template($('#replayTmp').html());
    var noReviewTmp = _.template($('#noReplayTmp').html());
    var ReplayBtnBox = _.template($('#ReplayBtnBox').html());
    var replaytour = _.template($('#replaytour').html());

    

    /******************이거 투어 위시*/
    for (var i = 0; i < 8; i++) {
        $('#likeTour').append(likeTourTmp);
    }
    /***************/
    /********/
    for (var i = 0; i < 8; i++) {
        $('#likeUser').append(likeUserTmp);
    }
    /************/

    $('#leftTab a').click(function (e) {
        e.preventDefault();
        $('#leftTab a').removeClass('on');
        $(this).addClass('on');
        var page = "#" + $(this).data("page");
        $('.tab_content').removeClass('on');
        $(page).addClass('on');
    });
    $('#moreBtn').click(function () {
        if (moreFlag == 0) {
            moreFlag++;
            $('#moreProfile').slideToggle(100);
            $('#moreBtn span').text('숨기기');
            $moreBtn.removeClass('fa-angle-down')
                .addClass('fa-angle-up');
        } else {
            moreFlag--;
            $('#moreProfile').slideToggle(100);
            $('#moreBtn span').text('더 보기');
            $moreBtn.addClass('fa-angle-down')
                .removeClass('fa-angle-up');
        }
    });
    
    $('.heart').click(function () {
        $(this).children().toggleClass('fas').toggleClass('far');
    });
    $(".search").click(function () {
        $(".keyword-search-form").show();
        $(".search").hide();
    });
    $(".close").click(function () {
        $(".keyword-search-form").hide();
        $(".search").show();
    });
    $(".agree_check").change(function () {
        //alert("test");
        $(".lbl_agree").toggleClass("check");
    });
    $("#cancel").click(function () {
        $("#registerPopup").hide();
    });
    $("#register").click(function () {
        $("#registerPopup").show();
    });
    $("#login").click(function () {
        $("#logInPopup").show();
    });
    $("#cancelLogin").click(function () {
        $("#logInPopup").hide();
    });
    $("#toRegister").click(function () {
        $("#registerPopup").show();
        $("#logInPopup").hide()
    });
    $("#toLogIn").click(function () {
        $("#logInPopup").show();
        $("#registerPopup").hide();
    });
    $("#findPwdWrapper").click(function () {
        $("#logInPopup").hide();
        $("#findPwdPopup").show();
    });
    $("#cancelFindPwd").click(function () {
        $("#findPwdPopup").hide();
    });
    $('#newGiveTour').click(function () {
        $('#newGivePopup').show();
    });
    $('.cancel_find_pwd .fa-times-circle').click(function () {
        $('.cancel_find_pwd').parent().parent().hide();
    });
    $('#giveTourTheme input').change(function () {
        $(this).parent().toggleClass("on");
    });

    //    투어요청하기 사람 생성
    var tempAddUser = _.template($('#giveAddUser').html());
    $('#addUser').click(function () {
        var userAge =  $('#giveNumAge').val();
        var userGender = $('#giveNumGender').val();
        var userCount = $('#giveNumCount').val();
        var user = {
        		"age": userAge,
        		"gender": userGender,
        		"count": userCount
        		};
        $('#giveNumBox').append(tempAddUser({"user":user}));
    });
    $('#giveNumBox').on('click', "button", function () {
        $(this).parent().remove();
    });


    //투어 제안하기
    $('.suggest_check input').change(function () {
        $(this).parent().toggleClass('on');
        if ($(this).parent().children(1).hasClass('far')) {
            $(this).parent().children(1).removeClass('far').addClass('fas');
        } else {
            $(this).parent().children(1).removeClass('fas').addClass('far');
        }
    });

    $('.fa-minus').click(function () {
        var value = $('#giveNumCount').val()-1;
        $('#giveNumCount').val(value);
    });
    $('.fa-plus').click(function () {
        var value = $('#giveNumCount').val()-(-1);
        $('#giveNumCount').val(value);
    });

    $('#sandQuestionBtn').click(function () {
        $('#newGivePopup').show();
    });

    //메세지 신고하기
    $('.report_user').click(function () {
        $('#reportUserPopup').show();
    });

    $('#iceBreaking').click(function () {
        $('#iceBreakingPopup').show();
    });

    $('.my_tour_btn button').click(function () {
        if($(this).text()=="종료하기"){
            $(this).text("다시 시작하기");
        }else{
            $(this).text("종료하기");
        }
        $(this).parent().next().toggleClass('none');
    });
    
    

    $(window).resize(setFixedPosition);

    function setFixedPosition() {

        var wWidth = $(document).width();
        var left = (wWidth-1050)/2;
        var right = (wWidth-1080)/2;

        console.log(left);
        console.log(right);

        $(".navigator").css("right",right-90);
    }

    setFixedPosition();
    
    $('.receive_tour .sandQuestionBtn').click(function () {
        $(this).parent().parent().parent().remove();
    });
    $('.suggest_tour .sandQuestionBtn').click(function () {
        $(this).parent().parent().parent().remove();
    });
    $('.receive_tour .tour').click(function () {
        var tourNo = $(this).data("tourNo");
        location.href="/tourDetail.jsp?tourNo="+tourNo;
    });    

    $(".arrow_to_top").click(function (e) {
        e.preventDefault();
        $("html, body").animate({ scrollTop:0} , "slow");
    })//$(".arrow_to_top").click() end


    $(".arrow_to_bottom").click(function (e) {
        e.preventDefault();
        $("html, body").animate({ scrollTop: $(document).height() }, "slow");

    })//$(".arrow_to_bottom").click() end

    $(".navigation").click(function () {
        alert("페이지 준비중입니다.")
    });//$(".navigation").click() end

    $('#gogogo').click(function(){
    	location.href="/registerTourBasic.jsp"
    });
    $('#myTour .tour_click').click(function () {
    	<%--alert($(this).data("tourNum"));
    	alert($(this).find('.detailPage').val());--%>
    	location.href="/detailedTour.jsp?noTour=" +$(this).find('.detailPage').val();
	});
    
    var today = new Date();

    var picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input',
            container: '#endpicker-container'
        }
    });

    var picker2 = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input2',
            container: '#startpicker-container2'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input2',
            container: '#endpicker-container2'
        }
    });
    function review(a, b, c){
	    $.ajax({
	    	url:"/ajax/profileReview.jsp",
	    	data:{
	    		"userNo":<%=userNo%>,
	    		"type": a,
	    		"who": b},
    		dataType:"json",
    		type:"post",
    		error:function(){
    			alert("에러");
    		},
    		success:function(json){
    			$('#receiveReview').empty();
    			$('#receiveReview').append(ReplayBtnBox());
    			$('#fiveReview').empty();
    			$('#fiveReview').append(ReplayBtnBox());
    			if(c=="a"){
    				if(json.length==0){
    					$('#receiveReview').append(noReviewTmp());
        			}else{
        				$('#receiveReview').append(ReviewTmp({"json":json}));
        			}
    				
    			}else if(c=="b"){
    				if(json.length==0){
    					$('#fiveReview').append(noReviewTmp());
        			}else{
        				$('#fiveReview').append(ReviewTmp({"json":json}));
        			}
    			}
    			if(c=="b" && b=="L"){
    				$('#fiveReview .oneB').addClass('on');
    			}else if(c=="b" && b=="T"){
    				$('#fiveReview .twoB').addClass('on');
    			}else if(c=="a" && b=="L"){
    				$('#receiveReview .oneB').addClass('on');
    			}else if(c=="a" && b=="T"){
    				$('#receiveReview .twoB').addClass('on');
    			}  
    		}
	    });
    }
  /*   
    ReviewTmp;
    noReviewTmp;
    ReplayBtnBox
    
    receiveReview
    fiveReview */
    
    $('.get_review').click(function(){
    	review("G", "L", "a");
    	$('#receiveReview .oneB').addClass('on');
    });
    
    $('.writh_review').click(function(){
    	review("W", "L", "b");
    	$('#fiveReview .oneB').addClass('on');
    });
    
    $('#receiveReview').on('click', '.oneB', function(){
    	review("G", "L", "a");
    	$(this).addClass('on');
    });
    
    $('#receiveReview').on('click', '.twoB', function(){
    	review("G", "T", "a");
    	$(this).addClass('on');
    });
    
    $('#fiveReview').on('click', '.oneB', function(){
    	review("W", "L", "b");
    	$(this).addClass('on');
    });
    $('#fiveReview').on('click', '.twoB', function(){
    	review("W", "T", "b");
    	$(this).addClass('on');
    });
    
    
    
    
    function tourName(a){
    	if(a=="L") {
			return "로컬";
		}else if(a=="H") {
			return "역사";
		}else if(a=="N") {
			return "자연";
		}else if(a=="E") {
			return "체험";
		}else if(a=="P") {
			return "레포츠";
		}else if(a=="S") {
			return "쇼핑";
		}		
    }
    
    
</script>

</body>
</html>        
    