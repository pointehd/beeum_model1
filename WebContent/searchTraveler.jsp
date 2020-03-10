<%@page import="com.beeum.beeum.dao.ToTravelerReviewsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String[] regions = request.getParameterValues("region");
	//중복 선택이 가능하기 때문에 getParameterValues
	//""안에 있는 것은 name과 같게 해야 한다.
	//여러개를 받아올 수 있기 때문에 String 배열형으로 받아온다.

	String[] themes = request.getParameterValues("theme");
	//theme도 마찬가지
	
	String[] bees = request.getParameterValues("bee");
	
%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>serachTraveler</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>

    /*/////////////////////*/

    #content {
        width: 1080px;
        min-height: 10px;
        /*background-color: #ECEFF1;*/
        margin: auto;
        position: relative;
        overflow: hidden;
        font-family: 'Nanum Gothic Coding', monospace;
    }

    #subTitle {
        position: relative;
        left: 40px;
        margin: 25px;
    }

   #subTitle h3 {
        font-weight: bold;
        font-size: 30px;
        text-align: center;
    }

    #wrap {
        width: 1080px;
        height: auto;
        position: relative;
    }

    #requests {
        width: 950px;
        min-height: 800px;
        /*border: 1px solid #424242;*/
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        border-radius: 10px;
        position: relative;
        left: 100px;
    }

    #requestsWrap {
        width: 880px;
        min-height: 300px;
        position: relative;
        
        left: 70px;
    }
    
    #requestsWrap::after {
    	content: "";
    	display: block;
    	clear: both;
    }

    .request_box {
        /*margin: 20px 30px 0 0;*/
        margin-left: 40px;
        margin-top: 30px;
        width: 240px;
        min-height: 300px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        position: relative;
        float: left;
        font-size: 15px;
        box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    .bee_intro {
        min-height: 50px;
        border-bottom: 1px solid #FAE100;
        position: relative;
    }

    .bee_pic {
        width: 40px;
        height: 40px;
        position: absolute;
        top: 5px;
        left: 5px;
    }

    .bees_icon {
        position: relative;
    }

    .bee_icon {
        /*border: 1px solid lightgray;*/
        float: left;
        width: 15px;
        height: 15px;
        margin: 5px;
        text-align: center;
        position: relative;
        left: 50px;
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
    }

    .bee_name {
        position: absolute;
        border: 1px solid transparent;
        width: 100px;
        height: 20px;
        left: 55px;
        bottom: 2px;
    }

    .selected_date {
        min-height: 30px;
        border-bottom: 1px solid #FAE100;
        padding: 5px;
    }

    .start_date {
        text-indent: 8px;
    }

    .end_date {
        text-align: right;
    }

    .selected_area {
        min-height: 30px;
        border-bottom: 1px solid #FAE100;
        line-height: 30px;
        text-indent: 10px;
    }

    .selected_theme {
        min-height: 60px;
        border-bottom: 1px solid #FAE100;
    }

    .theme_tour {
        border: 1px solid lightgray;
        border-radius: 10px;
        text-align: center;
        width: 60px;
        min-height: 20px;
        line-height: 20px;
        margin: 4px 9px;
        float: left;
        /*padding: 3px;*/
    }

    .selected_tourist {
        border-bottom: 1px solid #FAE100;
        min-height: 60px;
    }

    .tourist_detail {
        border: 1px solid lightgray;
        border-radius: 10px;
        text-align: center;
        min-width: 100px;
        height: 20px;
        line-height: 20px;
        margin: 4px 8px;
        float: left;
        /*padding: 1px;*/
    }

    .value {
        min-height: 50px;
    }

    .evaluation {
        position: absolute;
        /*border: 1px solid #424242;*/
        bottom: 3px;
        left: 50px;
    }

    .hive_img {
        position: relative;
        left: 8px;
        width: 30px;
        height: 30px;
    }

    .price {
        /*border: 1px solid #424242;*/
        width: 100px;
        position: absolute;
        right: 30px;
        bottom: 10px;
    }
/*     //////////////////////// */
        #slider-range {
        width: 130px;
        left: 10px;
    }
    
        #rangeSlider {
        width: 150px;
        height: 30px;
		/*margin-left: 10px;
        padding-bottom: 8px;*/
    }
/* //////////////////////////////////////// */
    #requestFilter {
        background: #FFFFFF;
        width: 175px;
        min-height: 500px;
        /*border: 1px solid #424242;*/
        position: fixed;
        top: 300px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        border-radius: 10px;
    }

    #dateFilter, #locationFilter, #themeFilter, #genderFilter, #numFilter, #ageFilter, #priceFilter {
        border-bottom: 1px solid lightgrey;
        min-height: 70px;
        padding: 5px 100px 5px 10px;
        line-height: 1.5em;
    }

    #dateFilter {
        min-height: 130px;
    }

    #dateFilter span {
        display: inline-block;
        padding: 5px;
    }

    .tui-datepicker-input {
        width: 100px;
        height: 25px;
        z-index: 999;
        border: none;
        padding: 5px;
        line-height: 25px;
    }

    .tui-datepicker-input:nth-child(1) {
        z-index: 1000;
    }

    #startpicker-input, #endpicker-input {
        border: 1px solid lightgrey;
        border-radius: 3px;
        height: 30px;
    }

    .find_traveler_category {
        /*background-color: #999999;*/
        display: block;
        height: 20px;
        font-weight: bold;
        line-height: 20px;
        /*min-width: 150px;*/
    }
    
    #genderFilter .find_traveler_category, #numFilter .find_traveler_category, #ageFilter .find_traveler_category, #priceFilter .find_traveler_category    {
    	min-width: 150px;
    }

    .select_traveler_category {
        margin-top: 5px;
        margin-bottom: 5px;
        width: 100px;
        font-weight: bold;
    }

    .find_regions, .find_theme, .find_gender, .find_num, .find_age  {
        position: relative;
        height: 30px;
        width: 150px;
        top: 0px;
        left: 0px;
    }

    .find_age {
        margin-top: 5px;
    }

    #numFilter button {
        width: 23px;
        height: 23px;
        border: 1px solid #424242;
        text-align: center;
        border-radius: 20px;
        background: transparent;
        text-indent: 0px;
        padding: 4px 3px;
        outline: none;
        cursor: pointer;
    }

    #giveNumCount {
        width: 50px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgrey;
        height: 25px;
    }

    #priceFilter {
        border-bottom: none;
    }

    #rangeSlider {
        position: absolute;
        bottom: 25px;
    }

	#priceFilter input {
		width: 150px;
		margin-bottom: 5px;
	}

    /************팝업 시작*********/
    .request_box_cover{
        width: 240px;
        height: 300px;
        background: rgba(80, 80, 80, .7);
        border-radius: 10px;
        position:absolute;
        left:0;
        top: 0;
        text-align: center;
        display: none;
    }
    .request_box:hover .request_box_cover{
        display: block;
    }
    .request_box_cover button{
        width: 200px;
        height: 40px;
        margin-top: 130px;
        cursor: pointer;
        border:none;
        border-radius: 10px;
        background: #fcc200;
        font-size: 15px;
        font-weight: bold;
        font-family: 'Nanum Gothic Coding', monospace;
    }

    #suggestPopup{
        width: 100%;
        height: 100%;
        position: fixed;
        /*display: none;*/
        top: 0;
        left: 0;
        z-index: 2;
        background: rgba(0, 0, 0, .8);
    }

    #cancelSuggestPopup:hover{
        color: #424242;
    }

    #cancelSuggestPopup{
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
    	z-index:1000;
    }

    #suggestTourContent {
        width: 870px;
        height: 540px;
        /*background:red;*/
        position: relative;
        overflow-y: scroll;
    }

    #suggestPopup{
        width: 100%;
        height: 100%;
        position: fixed;
        display: none;
        top: 0;
        left: 0;
        z-index: 2;
        background: rgba(0, 0, 0, .8);
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


    #cancelSuggestPopup{
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

    #cancelSuggestPopup:hover{
        color: #424242;
    }
    .popup_title h1 {
        text-align: center;
        text-decoration: underline;
        /*background-color: #64b5f6;*/
        font-family: 'Gothic A1', sans-serif;
        font-size: 25px;
        padding: 10px;
        font-weight: bold;
    }
    #suggestPopupBtn,
    #newTourBtn {
        position: relative;
        width: 300px;
        height: 40px;
        display: block;
        float: right;
        font-family: 'Gothic A1', sans-serif;
        font-size: 20px;
        margin-right: 30px;
        font-weight: bold;
        box-shadow: 0 5px 5px 0 gray;
        background-color: #FFEE58;
        transition: 0.2s ease;
        border: none;
        border-radius: 3px 3px 1px 1px;
    }
    .popup_sub_title h2 {
        text-align: center;
        font-size: 16px;
        font-family: 'Gothic A1', sans-serif;
        font-weight: bold;
    }
    #suggestTourContent {
        width: 870px;
        height: 540px;
        /*background:red;*/
        position: relative;
        overflow-y: scroll;
    }
    .like_tour_box {
        width: 240px;
        height: 250px;
        border: 1px solid #424242;
        margin: 10px 20px;
        float: left;
        font-size: 15px;
        position: relative;
    }

    .like_tour_img {
        width: 240px;
        height: 100px;
        background: #ffecb3;
        border-bottom: 1px solid #424242;
        position: relative;
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
        border-bottom: 1px solid #424242;
        text-indent: 8px;
    }

    .like_tour_score {
        width: 80px;
        height: 87px;
        margin-left: 5px;
        padding-right: 5px;
        /*background: red;*/
        float: left;
        border-right: 1px solid #424242;
    }

    .tour_score_img {
        width: 80px;
        height: 60px;
        border-bottom: 1px solid #424242;
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
    /************팝업 종료*********/

</style>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div class="content_wrap">
        <div id="content">
            <div id="subTitle"><h3>Please Be Our Bees! 저희의 Bee가 되어주세요~:)</h3></div>
            <div id="wrap">
                <div id="requests">
                    <div id="requestsWrap">
						 
						 
						 <!-- 여기가 바로 중요한 내용이 들어갈 곳입니다. -->
						 
						 
                    </div><!-- //#requestsWrap end -->
                </div><!-- //#requests end -->
            </div><!-- //#wrap end -->
        </div><!-- //#content end -->
    </div><!--content_wrap-->
<%@ include file="/WEB-INF/template/footer.jsp" %>
<div id="requestFilter">
    <div id="dateFilter">
        <h2 class="find_traveler_category"><div id="select_traveler_category">날짜</div>
            <div class="row">
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                    <input id="startpicker-input" name="start" type="text" aria-label="Date">
                    <span class="tui-ico-date"></span>
                    <div id="startpicker-container" style="margin-left: -1px;"></div>
                </div><!-- //.tui-datepicker-input end -->
                <span>to</span>
                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                    <input id="endpicker-input" name="end" type="text" aria-label="Date">
                    <span class="tui-ico-date"></span>
                    <div id="endpicker-container" style="margin-left: -1px;"></div>
                </div><!-- //.tui-datepicker-input end -->
            </div><!-- //.row end -->
        </h2>
    </div><!-- //#dateFilter end -->
    <div id="locationFilter">
        <label class="find_traveler_category"><div class="select_traveler_category">지역</div>
            <div class="find_regions">
                <select id="findRegions" style="display:none" name="region" multiple required>
                	<!-- <option selected value="293">전국</option> -->
                    <option
                    <%
                    if(regions!=null){
                    boolean isSeoul = false;
                    
                    //regions 배열에 있는 각각의 값들을 변수 region으로 설정
                    for(String region : regions) {
                    	//문자열 값비교는 ==가 아닌 equals!!!!!
                    	if(region.equals("1")) {
                    		//regions배열에서 가져온 값 중 하나인 region이라는 변수의 문자열이 "1"과 같으면
                    		isSeoul = true;	
                    		//isSeoul이라는 변수의 값을 true로 하고 
                    		break;
                    		//for문을 멈춘다.
                    	}//if end
                    	
                    }//for end
					//isSeoul이 true이면 selected이다.                    
                    if(isSeoul) { %>
                    selected
                    <%}  }%>
                    value="1">서울특별시</option>
                     
                    <option 
                    <%
                    if(regions!=null){
                    boolean isIncheon = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("207")) {
                    		isIncheon = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isIncheon) { %>
                    selected
                    <%}  }%>
                    value="207">인천광역시</option>
                    
                    <option
                    <%
                    if(regions!=null){
                    boolean isDaejeon = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("150")) {
                    		isDaejeon = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isDaejeon) { %>
                    selected
                    <%}  }%>
                    value="150">대전광역시</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isSejong = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("173")) {
                    		isSejong = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isSejong) { %>
                    selected
                    <%} } %>
                    value="173">세종특별자치시</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isGwangju = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("135")) {
                    		isGwangju = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isGwangju) { %>
                    selected
                    <%} } %>
                    value="135">광주광역시</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    
                    boolean isDaegu = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("141")) {
                    		isDaegu = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isDaegu) { %>
                    selected
                    <%}  }%>
                    
                    value="141">대구광역시</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isUlsan = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("198")) {
                    		isUlsan = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isUlsan) { %>
                    selected
                    <%} } %>
                    value="198">울산광역시</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isBusan = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("156")) {
                    		isBusan = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isBusan) { %>
                    selected
                    <%}  }%>
                    value="156">부산광역시</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isGyeonggi = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("46")) {
                    		isGyeonggi = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isGyeonggi) { %>
                    selected
                    <%}  }%>
                    value="46">경기도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isGangwon = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("27")) {
                    		isGangwon = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isGangwon) { %>
                    selected
                    <%}  }%>
                    value="27">강원도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isChungnam = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("260")) {
                    		isChungnam = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isChungnam) { %>
                    selected
                    <%}  }%>
                    value="260">충청남도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isChungbuk = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("277")) {
                    		isChungbuk = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isChungbuk) { %>
                    selected
                    <%}  }%>
                    value="277">충청북도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isJeollanam = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("218")) {
                    		isJeollanam = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isJeollanam) { %>
                    selected
                    <%}  }%>
                    value="218">전라남도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isJeollabuk = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("241")) {
                    		isJeollabuk = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isJeollabuk) { %>
                    selected
                    <%}  }%>
                    value="241">전라북도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isGyeongnam = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("88")) {
                    		isGyeongnam = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isGyeongnam) { %>
                    selected
                    <%}  }%>
                    value="88">경상남도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isGyeongbuk = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("110")) {
                    		isGyeongbuk = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isGyeongbuk) { %>
                    selected
                    <%}  }%>
                    value="110">경상북도</option>
                    
                    <option 
                    <%
                    if(regions!=null){
                    boolean isJeju = false;
                    
                    for(String region : regions) {
                    	
                    	if(region.equals("257")) {
                    		isJeju = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isJeju) { %>
                    selected
                    <%}  }%>
                    value="257">제주특별자치도</option>
                </select>
            </div>
        </label>
    </div><!-- //#locationFilter end -->
    <div id="themeFilter">
        <label class="find_traveler_category"><div class="select_traveler_category">테마</div>
            <div class="find_theme">
                <select style="display:none" name="theme" multiple>
                    <option 
                    <%
                    if(themes!=null){
                    boolean isLocal = false;
                    
                    for(String theme : themes) {
                    	
                    	if(theme.equals("L")) {
                    		isLocal = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isLocal) { %>
                    selected
                    <%}}  %>
                    value="L">로컬 투어</option>
                    
                    <option 
                    <%
                    if(themes!=null){
                    boolean isHistory = false;
                    
                    for(String theme : themes) {
                    	
                    	if(theme.equals("H")) {
                    		isHistory = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isHistory) { %>
                    selected
                    <%} } %>
                    value="H">역사 투어</option>
                    
                    <option 
                    <%
                    if(themes!=null){
                    
                    boolean isExp = false;
                    
                    for(String theme : themes) {
                    	
                    	if(theme.equals("E")) {
                    		isExp = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isExp) { %>
                    selected
                    <%}  }%>
                    value="E">체험 투어</option>
                    
                    <option 
                    <%
                    if(themes!=null){
                    boolean isShop = false;
                    
                    for(String theme : themes) {
                    	
                    	if(theme.equals("S")) {
                    		isShop = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isShop) { %>
                    selected
                    <%}  }%>
                    value="S">쇼핑 투어</option>
                    
                    <option 
                    <%
                    if(themes!=null){
                    boolean isNature = false;
                    
                    for(String theme : themes) {
                    	
                    	if(theme.equals("N")) {
                    		isNature = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isNature) { %>
                    selected
                    <%}}  %>
                    value="N">자연 투어</option>
                    
                    <option 
                    <%
                    if(themes!=null){
                    boolean isLeports = false;
                    
                    for(String theme : themes) {
                    	
                    	if(theme.equals("P")) {
                    		isLeports = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isLeports) { %>
                    selected
                    <%}  }%>
                    value="P">레포츠 투어</option>
                </select>
            </div>
        </label>
    </div><!-- //#themeFilter end -->
    <div id="genderFilter">
        <label class="find_traveler_category"><div class="select_traveler_category">희망 성별</div>
            <div class="find_gender">
                <select style="display:none" name="gender" multiple required>
                    <option value="M">남</option>
                    <option value="F">여</option>
                </select>
            </div><!-- //.find_gender end -->
        </label>
    </div><!-- //#genderFilter end -->
    <div id="numFilter">
        <label><div class="select_traveler_category">최대 인원</div>
            <div class="find_num">
                <button type="button"><i class="fas fa-minus"></i></button>
                <input name="num" placeholder="1" id="giveNumCount">
                <button type="button"><i class="fas fa-plus"></i></button>
            </div><!-- //.find_num end -->
        </label>
    </div><!-- //#numfilter end -->
    <div id="ageFilter">
        <label class="find_traveler_category">희망 연령대
            <div class="find_age">
                <select style="display:none" name="age" required>
                    <option value="null">상관없음</option> 
                    <option value="10">10대</option>
                    <option value="20">20대</option>
                    <option value="30">30대</option>
                    <option value="40">40대</option>
                    <option value="50">50대</option>
                    <option value="60">60대</option>
                    <option value="70">70대~</option>
                </select>
            </div><!-- //.find_age end -->
        </label>
    </div><!-- //#ageFilter end -->
    <div id="priceFilter">
        <label class="find_traveler_category">최저 금액
            <div id="rangeSlider">
                <!-- <input name="price" type="range" class="range-slider" value="23" /> -->
                <input type="text" class="range-slider" readonly style="border:0; color:+#3B3C3C; font-weight:bold;">
            	<div id="slider-range"></div>
            </div>
        </label>
    </div><!-- //#priceFilter end -->
</div><!-- //#requestFilter end -->
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
                    <div class="suggest_check">
                    	<label>
                    		<i class="far fa-check-circle"></i><input type="checkbox"/>
                    	</label>
                    </div><!-- //.suggest_check end -->
                </div><!-- //.like_tour_img end -->
                <div class="like_tour_theme">지역·(테마)투어·기간</div>
                <div class="like_tour_title">제주도 3박4일고고띠</div>
                <div class="like_tour_price">
                    <div class="like_tour_score">
                        <div class="tour_score_img"><img src="img/rotten%20tomato_3.png"/> </div>
                        <div class="tour_score_text">(80%,12)</div>
                    </div><!-- //.like_tour_score end -->
                    <div class="like_tour_pay"><p>&#8361;<em>99,999</em></p>1인(성인기준)</div>
                </div><!-- //.like_tour_price end -->
            </div><!-- //.like_tour_box end -->
        </div><!-- //#suggestTourContent end -->
        <button id="suggestPopupBtn">완료</button>
        <button id="newTourBtn">새로만들기</button>
    </div><!-- //#suggestPopupForm end -->
</div><!-- //#suggestPopup end -->
<script type="text/template" id="requestTourTmp">

<@ _.each(tours, function(tour) { 

	var beeTypes = [];

	for(var i = 0; i < tour.beeList.length ; i++) {
		beeTypes.push(tour.beeList[i].type);
	}//for end
	console.log(beeTypes);

@>
    <div class="request_box">
        <div class="bee_intro">
            <div class="bee_photo"><img class="bee_pic" src="/img/<@=tour.fileName@>" alt="selfie"></div>
            <div class="bee_right">
                <div class="bees_icon">

					<@	if(beeTypes.includes('T')) {@>
							<div class="bee_icon">
                           		<img src="/img/bee_tourBee.png" width="15" height="15"/>
                   			</div>
					<@  }else {@>
							<div class="bee_icon">
                        		<img src="/img/bee_default.png" width="15" height="15"/>
                    		</div>
					<@	}<!-- //if~else end --> @>

					<@	if(beeTypes.includes('K')) {@>
							<div class="bee_icon">
                           		<img src="/img/bee_koBee.png" width="15" height="15"/>
                   			</div>
					<@  }else {@>
							<div class="bee_icon">
                       			<img src="/img/bee_default.png" width="15" height="15"/>
                    		</div>
					<@  }<!-- //if~else end --> @>

					<@	if(beeTypes.includes('H')) {@>
							<div class="bee_icon">
                           		<img src="/img/bee_honeyBee.png" width="15" height="15"/>
                   			</div>
					<@  }else {@>
							<div class="bee_icon">
                        		<img src="/img/bee_default.png" width="15" height="15"/>
                   			</div>
					<@  }<!-- //if~else end --> @>

					<@	if(beeTypes.includes('B')) {@>
							<div class="bee_icon">
                           		<img src="/img/bee_bumbleBee.png" width="15" height="15"/>
                   			</div>
					<@  }else {@>
							<div class="bee_icon">
                        		<img src="/img/bee_default.png" width="15" height="15"/>
                   			</div>
					<@  }<!-- //if~else end --> @>

					<@	if(beeTypes.includes('W')) {@>
							<div class="bee_icon">
                           		<img src="/img/bee_wasp.png" width="15" height="15"/>
                   			</div>
					<@  }else {@>
							<div class="bee_icon">
                        		<img src="/img/bee_default.png" width="15" height="15"/>
                   			</div>
					<@  }<!-- //if~else end --> @>

                </div><!-- //.bees_icon end -->
                <div class="bee_name"><@=tour.name @></div>
            </div><!-- //.bee_right end -->
        </div><!-- //.beeIntro end -->
        <div class="selected_date">
            <div class="start_date"><span><@=moment(tour.startDate).format("YYYY년 MM월 DD일")@></span> ~</div>
            <div class="end_date"><span><@=moment(tour.endDate).format("YYYY년 MM월 DD일")@></span></div>
        </div><!-- //.selected_date end -->
        <div class="selected_area">
            <div><@=tour.city@></div>
        </div><!-- //.selected_area end -->
        <div class="selected_theme">

            <@ _.each(tour.themeList,function(theme) {  @>
				<div class="theme_tour"><@if(theme.theme=="L"){ @>로컬<@}else if(theme.theme=="H"){@>역사<@}else if(theme.theme=="N"){@>자연<@}else if(theme.theme=="E"){@>체험<@}else if(theme.theme=="S"){@>쇼핑<@}else{@>레포츠<@}@></div>
			<@}) @>

        </div><!-- //.selected_theme end -->
        <div class=selected_tourist>

			<@ _.each(tour.travelers,function(traveler) {  @>
            	<div class="tourist_detail">
					<span><@=traveler.age@></span>대, <span><@if(traveler.gender=="M"){ @>남<@}else{@>여<@}@></span>, <span><@=traveler.pax@></span>명</div>
			<@ }) @>

        </div><!-- //.selected_tourist end -->
        <div class="value">
            <div class="evaluation">
                <div class="hive"><img src="/img/rotten tomato_<@if(tour.hive==0){@>default<@}else if(0<tour.hive && tour.hive<=20){@>1<@}else if(21<=tour.hive && tour.hive<=40){@>2<@}else if(41<=tour.hive && tour.hive<=60){@>3<@}else if(61<=tour.hive && tour.hive<=80){@>4<@}else{@>5<@}@>.png" alt="임시로" class="hive_img"></div>
                <div class="review_num"><i class="far fa-comment-alt"></i> <@=tour.cnt @>개</div>
            </div><!-- //.evaluation end -->
			<%-- getTraveler.jsp ajax에서 set 해준 tour %-->
			<%-- NumberUtil.java에서 관련 method 선언하고 RequestTour vo에서 set해주고 가져온다.--%>
            <div class="price">&#8361;<span><@=tour.budgetStr@></span>/1인 (성인기준)</div>
        </div><!-- //.value end -->
        <div class="request_box_cover"><button class="sandQuestionBtn" type="button">제안하기</button></div>
    </div><!-- //.request_box end -->
<@})@>
</script>

    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script src="/js/tui-code-snippet.min.js"></script>
    <script src="/js/tui-date-picker.min.js"></script>
    <script src="/js/jquery.dropdown.js"></script>
    <script src="/js/jquery.range.js"></script>
    <script src="/js/moment-with-locales.js"></script>
    <script src="/js/multirange.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
        	
    	_.templateSettings = {
    			interpolate: /\<\@\=(.+?)\@\>/gim,
    			evaluate: /\<\@([\s\S]+?)\@\>/gim,
    			escape: /\<\@\-(.+?)\@\>/gim
    			};
    	
        jQuery.ajaxSettings.traditional = true;
    	
        var page = 1;
        var pax = 1000;
    	var gender = ['M','F'];
    	var theme = ['L','H','E','N','P','S'];//배열형
    	var start = moment().format("YYYY-MM-DD");
    	var end = null;
    	var region = [1,207,150,173,135,141,198,156,46,27,260,277,218,241,88,110,257,293];
    	var age = null;
    	var price = null;

        /******************/
        $('.suggest_check input').change(function () {
            $(this).parent().toggleClass('on');
            if ($(this).parent().children(1).hasClass('far')) {
                $(this).parent().children(1).removeClass('far').addClass('fas');
            } else {
                $(this).parent().children(1).removeClass('fas').addClass('far');
            }
        });
        $('.cancel_find_pwd .fa-times-circle').click(function () {
            $('.cancel_find_pwd').parent().parent().hide();
        });

        $('#requestsWrap').on('click', '.sandQuestionBtn', function () {
            $('#suggestPopup').show();
        });
        /******************/

        $(".search").click(function () {
            $(".keyword-search-form").show();
            $(".search").hide();
            $(".keyword-search-input").focus();
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
        })

        $(window).resize(setFixedPosition);
        $(".arrow_to_top").click(function (e) {
            e.preventDefault();
            $("html, body").animate({scrollTop:0} , "slow");
        })//$(".arrow_to_top").click() end


        $(".arrow_to_bottom").click(function (e) {
            // e.preventDefault();
            // $("html, body").animate({scrollTop: $(document).height()}, "slow");

            alert("사용할 수 없는 기능입니다.")

        })//$(".arrow_to_bottom").click() end

        $(".navigation").click(function () {
            alert("페이지 준비중입니다.")
        });//$(".navigation").click() end

        function setFixedPosition() {

            var wWidth = $(document).width();
            var left = (wWidth - 1050) / 2;
            var right = (wWidth - 1080) / 2;

            // console.log(left);
            // console.log(right);

            $("#requestFilter").css("left", left);
            $(".navigator").css("right",right-90); 
        }

        setFixedPosition();
        var sTop = $(window).scrollTop();
        var tmp = _.template($("#requestTourTmp").html());
        
        //for (var i = 0; i < 9; i++) {

         //   $("#requestsWrap").append(tmp());

       // }//for() end
        
        
        $(window).scroll(function () {

            //스크롤탑
            sTop = $(window).scrollTop();
            if (sTop >= 150) {
                $("#requestFilter").css({'position': 'fixed', top: 150});
            }
            else {
                $("#requestFilter").css({'position': 'absolute', top: 300})
            }

            //브라우저의 높이
            var wTop = $(window).height();

            //문서의 높이
            var dTop = $(document).height();

            if ((dTop - 350) <= wTop + sTop) {
            	
            	page++;
            	
            	//getTravelers();

                //언더스코어 템플릿을 이용해서 추가
               // for (var i = 0; i < 20; i++) {

                //    $("#requestsWrap").append(tmp());
                //}//for() end
            }//if end

            // console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop+"/문서높이:"+dTop);

        });//window scroll() end
        
        <% 

        //start라는 name을 가진 것의 값을 가져와서 start라는 변수로 선언 및 대입
		String start = request.getParameter("start");
        //그 변수 start가 null이 아니면 즉, 값을 가지고 있으면
        if(start!=null) { 
        %>
		//그 start 변수에 들어가 있는 값을 startDay로 선언 및 대입한다. 
        var startDay = new Date("<%=start%>");
        
        //그렇지 않으면 즉, start라는 변수에 들어온 값이 없다면
        <%}else { %>
		//현재 날짜 new Date()를 startDay로 선언 및 대입한다. 
        var startDay = new Date();
        
        <%}//if~else end
        
       	 String end = request.getParameter("end");
        
        if(end!=null) { 
        %>

        var endDay = new Date("<%=end%>");
        
        <%}else { %>

        var endDay = new Date();
        
        <%}//if~else end%>

        var picker = tui.DatePicker.createRangePicker({
            startpicker: {
                date: startDay,
                input: '#startpicker-input',
                container: '#startpicker-container'
            },
            endpicker: {
                date: endDay,
                input: '#endpicker-input',
                container: '#endpicker-container'
            }
        });
       
        picker.on("change:start",function() {
        	//alert("change:start");
        	start=$('#startpicker-input').val();
        	getTravelers();
        });
        
        picker.on("change:end",function() {
        	//alert("change:end");
         	end=$('#startpicker-input').val();
        	getTravelers();
        	
        });
        
         
        $('.find_regions').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: Infinity,

            // search field
            input: '<input type="text" maxLength="20" placeholder="검색">',

            // dynamic data here
            // data: [],

            // is search able?
            searchable: true,

            // when there's no result
            searchNoData: '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

            // callback
            choice: function () {
            	
        		region = this.$select.val();
            	
            	console.log(region);
            	
            	getTravelers();
            	
            }

        });/*$('.find_regions').dropdown() end*/
        
    	$(".find_regions .dropdown-clear-all").click(function () {
    		//alert("");
    		region = [1,207,150,173,135,141,198,156,46,27,260,277,218,241,88,110,257,293];
    		getTravelers();
		});

        $('.find_theme').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: 6,

            // search field
            input: '<input type="text" maxLength="20" placeholder="검색">',

            // dynamic data here
            // data: [],

            // is search able?
            searchable: true,

            // when there's no result
            searchNoData: '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

            // callback
            choice: function () {
            	
            	theme = this.$select.val();
            	
            	console.log(theme);
            	
            	getTravelers();
            	
            }

        });/*$('.find_theme').dropdown() end*/
        
    	$(".find_theme .dropdown-clear-all").click(function () {
    		//alert("");
    		theme = ['L','H','E','N','P','S'];
    		getTravelers();
		});

        $('.find_gender').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: 6,

            // search field
            input: '<input type="text" maxLength="20" placeholder="검색">',

            // dynamic data here
            // data: [],

            // is search able?
            searchable: true,

            // when there's no result
            searchNoData: '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

            // callback
            choice: function () {
            	
        		gender = this.$select.val();
            	
            	console.log(gender);
            	
            	getTravelers();
            	
            }//choice end

        });/*$('.find_gender').dropdown() end*/
        
        $(".find_gender .dropdown-clear-all").click(function () {
    		//alert("");
    		gender = ['M','F'];
    		getTravelers();
		});

        $('.find_age').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: Infinity,

            // search field
            input: '<input type="text" maxLength="20" placeholder="검색">',

            // dynamic data here
            // data: [],

            // is search able?
            searchable: true,

            // when there's no result
            searchNoData: '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

            // callback
            choice: function () {
            	
				age = this.$select.val();
            	
            	console.log(age);
            	
            	getTravelers();
            	
            }

        });/* $('.find_age').dropdown() end*/
        
        $(".find_age .dropdown-clear-all").click(function () {
    		//alert("");
    		age = null;
    		getTravelers();
		});

        $('.fa-minus').click(function () {
            var value = $('#giveNumCount').val()-1;
            $('#giveNumCount').val(value);
            pax=$('#giveNumCount').val();
        	getTravelers();            
        });
        $('.fa-plus').click(function () {
            var value = $('#giveNumCount').val()-(-1);
            $('#giveNumCount').val(value);
            //pax=$('#giveNumCount').val();
            pax=$('#giveNumCount').val();
        	getTravelers();
        });
        
        $('#giveNumCount').change(function () {
        	//alert('zz');
        	pax=$('#giveNumCount').val();
        	getTravelers();
		});


/*         $('.range-slider').jRange({
            from: 0,
            to: 11,
            step: 1,
            scale: [1,3,5,7,9,11],
            format: '만원',
            width: 150,
            showLabels: true,
            isRange : true
        }); */

        $(function () {
        	
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 300000,
                values: [0, 300000],
                slide: function (event, ui) {
                    $(".range-slider").val("￦" + numberWithCommas(ui.values[0]) + " ~ ￦" + numberWithCommas(ui.values[1]));

                  price = $("#slider-range").slider("values", 0);
                  getTravelers();
					//console.log($("#slider-range").slider("values", 1));
                }
            });
            
            $(".range-slider").val("￦" + $("#slider-range").slider("values", 0) +
                " ~ ￦" + $("#slider-range").slider("values", 1));
        });
        
        function numberWithCommas(x) {
            x = x.toString();
            var pattern = /(-?\d+)(\d{3})/;
            while (pattern.test(x))
                x = x.replace(pattern, "$1,$2");
            return x;
        }
        
        $('.header_left a').eq(2).addClass('on');

        $("#suggestPopupBtn").click(function(){
        	alert("제안이 완료되었습니다. 마이페이지에서 확인하세요!");
        	$("#suggestPopupForm").hide();
        	$("#suggestPopup").hide();
        });//#suggestPopupBtn click() end
        
        
        
        function getTravelers() {
        	
        	$.ajax({
        		url:"/ajax/getTravelers.jsp",
        		data:{
        			"page":page,
        			"pax":pax,
        			"gender":gender,
        			"theme":theme,
        			"start":start,
        			"end":end,
        			"region":region,
        			"age":age,
        			"price":price
        		},
        		dataType:'json',//넘어오는 데이터의 타입을 지정
        		type:"post",
        		error:function() {
        			alert("에러");
        		},
        		success:function(json) {
        			
        			$("#requestsWrap").html(tmp({tours:json}));
        			
        		}
        	});//$.ajax end
        	
        }//getTravelers() end
        
        
        getTravelers();
   
        
    </script>
    
</body>
</html>        