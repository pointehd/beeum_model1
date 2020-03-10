<%@page import="java.util.ArrayList"%>
<%@page import="com.beeum.beeum.vo.AvalBee"%>
<%@page import="com.beeum.beeum.dao.AvalBeesDAO"%>
<%@page import="com.beeum.beeum.dao.ToTravelerReviewsDAO"%>
<%@page import="com.beeum.beeum.vo.ToTravelerReview"%>
<%@page import="com.beeum.beeum.util.PaginateUtil"%>
<%@page import="com.beeum.beeum.vo.ToLocalReview"%>
<%@page import="java.util.List"%>
<%@page import="com.beeum.beeum.dao.ToLocalReviewsDAO"%>
<%@page import="com.beeum.beeum.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
	String[] regions = request.getParameterValues("region");

	String[] themes = request.getParameterValues("theme");
	
	String bee = request.getParameter("bee");
	System.out.println(bee);
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>review</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>

    /*///////////////////////////*/

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
        font-weight: bold;
        font-size: 30px;
        text-align: center;
        margin: 25px;
    }

    #wrap {
        width: 1080px;
        min-height: 900px;
        position: relative;
        /*background: #EC407A;*/
    }

    #reviews {
        /*border: 1px solid #424242;*/
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        width: 950px;
        min-height: 800px;
        position: relative;
        left: 100px;
        /*background: #FBC02D;*/
    }

    #titleWrap {
        /*border: 1px solid #424242;*/
        position: relative;
        width: 880px;
        height: 50px;
        left: 70px;
        line-height: 50px;
        text-align: center;
        font-size: 30px;
        /*background: #EC407A;*/
    }

    #reviewTitle {
        padding: 10px;
    }

    #reviewTabs {
        position: absolute;
        right: 25px;
        top: 10px;
    }

    .review_tabs {
        height: 25px;
    }

    #reviewsWrap {
        position: relative;
        /*border: 1px solid #424242;*/
        /*background: #00B0FF;*/
        width: 880px;
        min-height: 800px;
        overflow: hidden;
        left: 70px;
    }

    .review_box {
        /*border: 1px solid #424242;*/
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);position: relative;
        border: 1px solid #FAE100;
        width: 840px;
        height: 300px;/* 임시로 min-height 후기 내용 길이 논의 */
        margin-bottom: 0px;
        margin-top: 30px;
        left: 15px;
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
        /*border: 1px solid lightgray;*/
        text-align: center;
        line-height: 40px;
        position: relative;
        margin: 5px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
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

    .bee_icon {
        width: 30px;
        height: 30px;
        /*border: 1px solid lightgray;*/
        text-align: center;
        line-height: 30px;
        float: left;
        position: relative;
        margin-left: 2px;
        top: -40px;
        left: 84px;
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
    }

    .bee_name {
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

    .popup {
        width: 600px;
        height: 450px;
        position: fixed;
        left: 50%;
        top: 50%;
        margin-left: -300px;
        border-radius: 10px;
        margin-top:-225px;
        display: none;
        z-index: 999;
    }

    .full_popup {
        width: 100%;
        height: 100%;
        left: 0;
        display: none;
        top: 0;
        z-index: 88;
        position: fixed;
        background: rgba(0,0,0,.8);
    }
    .wrap button {
        display: block;
        border: none;
        outline: none;
        cursor: pointer;
        position: absolute;/* 차지하지 않으면서 3층 positioning context 기준 */
        font-size: 40px;
        font-weight: bold;
        background: none;
        color: #edf4fc;
        text-shadow: 5px 5px 5px #424242;
    }

    .wrap button:hover {
        color: black;
        text-shadow: 3px 3px 3px #424242;
    }

    #leftBtn {
        top: 50%;
        left: 5%;
    }

    #rightBtn {
        top: 50%;
        right: 5%;
    }

    .wrap {
        width: 600px;
        height: 450px;
        border: 1px solid #424242;
        position: relative;/* 차지하면서 3층 positioning context 지정 self*/
        margin: auto;/* 위로 20px 수평 가운데 */
        /*line-height: 450px;*/
        top: 50%;
        margin-top: -225px;
        overflow: hidden;/* 하나씩만 보여주기 */
    }

    .photo_box {
        width: 6000px;
        height: 450px;
        position: absolute;/* 차지 안하고 3층 */
        left: 0;
        /* cubic bezier */
        transition: .5s cubic-bezier(.82,.01,.18,.99);
        /* transition 없이 하면 무한대로 보이게 할 수 有 */
    }

    .review_imgs {
        float: left;
        width: 600px;
        height: 450px;
        border-radius: 10px;
        /*display: none;*/
    }



    .review_last_line {
        position: relative;
        width: 840px;
        height: 50px;
        /*background: coral;*/
    }

    .tour_title {
        position: relative;
        width: 590px;
        height: 50px;
        line-height: 50px;
        text-indent: 15px;
        /*background: #00C853;*/
    }

    .evaluation {
        position: relative;
        width: 250px;
        height: 50px;
        left: 590px;
        top: -45px;
        /*background: maroon;*/
    }

    .value {
        float: left;
    }

    .review_hover_box1 {
        display: none;
        position: absolute;
        min-width: 235px;
        height: 90px;
        background-color: #FAE100;
        top: 12px;
        right: 265px;
        z-index: 999;
    }

    .review_hover_box1::after {
        content: "";
        display: block;
        width: 0;
        height: 0;
        position: absolute;
        border-bottom: 20px solid transparent;
        border-left: 20px solid #FAE100;
        top: 0px;
        right: -20px;
        z-index: 1000;
    }

    .review_hover_box1 h3, .review_hover_box2 h3 {
        padding: 10px;
        text-indent: 5px;
        font-weight: bold;
    }

    .tour_bee_evaluation {
        width: 210px;
        height: 42px;
        border: 1px solid #424242;
        position: relative;
        left: 10px;
        font-size: 30px;
        text-align: center;
        color: lightgray;
    }

    .value_box {
        width: 30px;
        height: 30px;
        /*margin: 5px;*/
        /*border: 1px solid #424242;*/
        float: left;
        position: relative;
    	margin-left: 10px;
    	margin-top: 5px;
    }
    
/*     .value_box:first-child {
    	color: #000;
    }
 */
    .review_hover_box2 {
        display: none;
        position: absolute;
        min-width: 500px;
        height: 205px;
        background-color: #FAE100;
        top: 12px;
        right: 265px;
        z-index: 999;
    }

    .review_hover_box2::after {
        content: "";
        display: block;
        width: 0;
        height: 0;
        position: absolute;
        border-bottom: 20px solid transparent;
        border-left: 20px solid #FAE100;
        top: 0px;
        right: -20px;
        z-index: 1000;
    }

    .local_bee_evaluation {
        width: 480px;
        height: 150px;
        border: 1px solid #424242;
        position: relative;
        left: 10px;
        top: 3px;
    }

    .hive:hover .review_hover_box1.rhb {
        display: block;
    }

    .hive:hover .review_hover_box2.rhb {
        display: block;
    }

    .hive_img {
        width: 40px;
        height: 40px;
        top: 5px;
        position: relative;
    }

/*     .review_num {
        position: relative;
        left: 5px;
        top: 15px;
    } */

    #reviewFilter {
        /*border:  1px solid #424242;*/
        border: none;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        border-radius: 10px;
        position: fixed;
        width: 170px;
        min-height: 180px;
        top: 300px;
        /*left: 420px;*/
        background: #FFFFFF;
    }

    #locationFilter, #themeFilter, #beeFilter {
        border-bottom: 1px solid lightgrey;
        height: 70px;
        padding: 5px 100px 5px 10px;
        line-height: 1.5em;
    }

    #beeFilter {
        border-bottom: none;
    }

    .find_review_category {
        display: block;
        height: 20px;
        font-weight: bold;
        line-height: 20px;
    }

    .select_review_category {
        /*margin-top: 5px;*/
        margin-bottom: 5px;
        width: 100px;
    }

    .find_regions, .find_theme, .find_bees {
        position: relative;
        height: 30px;
        width: 150px;
        top: 0px;
        left: 0px;
    }
    
/*
페이징 CSS
*/
.paginate {
	font-size:22px;
	text-align:center;
	height:50px;
	line-height:50px;
	font-weight:500;
	margin: 10px;
}

.paginate a, 
.paginate span,
.paginate strong{
	color:#858585;
	text-decoration:none;
	padding:9px 14px;
	border:1px solid transparent;
	transition:.1s ease;
}

.paginate span {
	border-color:#E1E1E1;
	cursor: not-allowed;
}

.paginate a:hover {
	background:#14BAB6;
	border-color:#fff;
	font-weight:bold;
	color:#fff;
}

.paginate strong {
	background:#FAE100;
	border-color:#FAE100;
	color:#000;
	cursor: not-allowed;
	font-weight:bold;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

/*
비활성화
*/
.paginate span.next,
.paginate span.prev {
	border-color:#E1E1E1;
	color:#E1E1E1;
	cursor:default;
	cursor:not-allowed;
}

</style>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div class="content_wrap">
    
        <div id="content">
            <div id="subTitle"><h2>BEEUM의 실시간 후기를 확인하세요~:)</h2></div>
            <div id="wrap">
                <div id="reviews">
                    <div id="titleWrap">
                        <div id="reviewTitle"><h3>Reviews to our Bees!</h3></div>
                        <div id="reviewTabs">
                            <select class="review_tabs">
                                <option value="regDate">최신순</option>
                                <option value="hive">평점순</option>
                            </select>
                        </div><!-- //reviewTabs end -->
                    </div><!-- //#titleWrap end -->
                    <div id="reviewsWrap">
                    
                    
                    	<!-- 여기가 바로 중요한 내용이 들어갈 곳입니다. -->
                    
                    
                    </div><!-- //#reviewsWrap end -->
                    
                </div><!-- //#reviews end -->
            </div><!-- //#wrap end -->
        </div><!-- //#content end -->
    </div><!--content_wrap-->
<%@ include file="/WEB-INF/template/footer.jsp" %>
<div id="reviewFilter">
    <div id="locationFilter">
        <label class="find_review_category"><div class="select_review_category">지역</div>
            <div class="find_regions">
                <select id="findRegions" style="display:none" name="region" multiple>
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
        <label class="find_review_category"><div class="select_review_category">테마</div>
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
    <div id="beeFilter">
        <label class="find_review_category"><div class="select_review_category">To.</div>
            <div class="find_bees">
                <select style="display:none" name="bee">
                    <option <%if(bee!=null && bee.equals("T")) {%> selected <%} %> value="T">Tour Bee</option>
                    <option <%if(bee!=null && bee.equals("L")) {%> selected <%} %> value="L">Local Bee</option>
                </select>
            </div>
        </label>
    </div><!-- //#beeFilter end -->
</div><!-- //#reviewFilter end -->
<div class="full_popup"></div>
<div class="popup full">
    <div class="wrap">
        <div class="photo_box">
            <!-- <img class="review_imgs" src="/img/r1.JPG">
            <img class="review_imgs" src="/img/r2.JPG">
            <img class="review_imgs" src="/img/r3.JPG">
            <img class="review_imgs" src="/img/r4.JPG">
            <img class="review_imgs" src="/img/r5.JPG">
            
            <img class="review_imgs" src="/img/r7.JPG">
            <img class="review_imgs" src="/img/r8.JPG">
            <img class="review_imgs" src="/img/r9.JPG">
            <img class="review_imgs" src="/img/r10.JPG"> -->
        </div><!-- //.photo_box end -->
        <button id="leftBtn"><i class="fas fa-angle-left"></i></button>
        <button id="rightBtn"><i class="fas fa-angle-right"></i></button>
    </div><!-- //.wrap end -->
</div><!-- //.popup full end -->
                    
			<script type="text/template" id="reviewTmp">

				<@ if(bee=='L') {@>
	
                    <@ _.each(lReviews, function(lReview) {
                    
                    	var beeTypes = [];

						for(var i = 0; i < lReview.beeList.length ; i++) {
							beeTypes.push(lReview.beeList[i].type);
						}//for end
						console.log(beeTypes);

						var beeTypesTwo = [];

						for(var i = 0; i < lReview.beeListTwo.length ; i++) {
							beeTypesTwo.push(lReview.beeListTwo[i].type);
						}//for end
						console.log(beeTypes);@>
                    
						    <div class="review_box">
						        <div class="review_last_line">
						            <div class="tour_title"><@=lReview.title @></div>
						            <div class="evaluation">
						                <div class="hive value">
						                    <img src="/img/rotten tomato_<@if(lReview.hive==0){@>default<@}else if(0<lReview.hive && lReview.hive<=100){@>1<@}else if(101<=lReview.hive && lReview.hive<=200){@>2<@}else if(201<=lReview.hive && lReview.hive<=300){@>3<@}else if(301<=lReview.hive && lReview.hive<=400){@>4<@}else{@>5<@}@>.png" alt="임시로" class="hive_img">
						                    <div class="review_hover_box1">
						                        <h3>Tour Bee로서 받은 평가</h3>
						                        <div class="tour_bee_evaluation">
						                            <div class="value_box"></div>
						                            <div class="value_box"></div>
						                            <div class="value_box"></div>
						                            <div class="value_box"></div>
						                            <div class="value_box"></div>
						                        </div><!-- //.tour_bee_evaluation end -->
						                    </div><!-- .review_hover_box1 end -->
						                    <div class="review_hover_box2 rhb">
						                        <h3>Local Bee로서 받은 평가</h3>
						                        <div class="local_bee_evaluation chart-area">
													
						                        </div><!-- //.local_bee_evaluation end -->
						                    </div><!-- //.review_hover_box2 end -->
						                </div><!-- //.hive end -->
						            </div><!-- //.evaluation end -->
						        </div><!-- //.review_last_line end -->
						
						        <div class="review_first_line">
						            <div class="writer_photo"><img class="writer_img" src="/img/<@=lReview.tFileName@>"></div>
						            <div class="writer_info">
						                <div class="writer_bee_level">
						           
											<@	if(beeTypes.includes('T')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_tourBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                    							</div>
											<@	}<!-- //if~else end --> @>

											<@	if(beeTypes.includes('K')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_koBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                       								<img src="/img/bee_default.png" width="40" height="40"/>
                    							</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypes.includes('H')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_honeyBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypes.includes('B')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_bumbleBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypes.includes('W')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_wasp.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                   								</div>
											<@  }<!-- //if~else end --> @>
						                					                	
						                </div><!-- //.writer_bee_level end -->
						                
						                <div class="reg_date"><@=moment(lReview.regDate).format("YYYY-MM-DD") @></div>
						                <div class="writer_name"><@=lReview.tName@></div>
						            </div><!-- //.writer_info end -->
						            <div class="bee_info">
						                <div class="bee_photo"><img class="bee_img" src="/img/<@=lReview.lFileName@>"></div>
						                <div class="bee_level">
						                
											<@	if(beeTypesTwo.includes('T')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_tourBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                    							</div>
											<@	}<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('K')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_koBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                       								<img src="/img/bee_default.png" width="30" height=30"/>
                    							</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('H')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_honeyBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('B')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_bumbleBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('W')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_wasp.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

						                </div><!-- //.bee_level end -->
						                <div class="bee_name"><@=lReview.lName@></div>
						            </div><!-- //.bee_info end -->
						        </div><!-- //.review_first_line end -->
						        <div class="review_second_line">
						            <div class="review_contents"><@=lReview.content@></div>
						            <div class="review_photos">
						                <img class="review_img" src="/img/<@=lReview.rFileName@>">
										<input value="<@=lReview.noTlr@>" type="hidden"/>
						            </div><!-- //.review_photos end -->
						        </div><!-- //.review_second_line -->
    						</div><!-- //.review_box end -->
    						
						<@})@>

				<@}else {@>

					<@ _.each(tReviews, function(tReview) {
                    
                    	var beeTypes = [];

						for(var i = 0; i < tReview.beeList.length ; i++) {
							beeTypes.push(tReview.beeList[i].type);
						}//for end
						console.log(beeTypes);

						var beeTypesTwo = [];

						for(var i = 0; i < tReview.beeListTwo.length ; i++) {
							beeTypesTwo.push(tReview.beeListTwo[i].type);
						}//for end
						console.log(beeTypes);
                    
                   	@>

						    <div class="review_box">
						        <div class="review_last_line">
						            <div class="tour_title"><@=tReview.title @></div>
						            <div class="evaluation">
						                <div class="hive value">
						                    <img src="/img/rotten tomato_<@if(tReview.hive==0){@>default<@}else if(0<tReview.hive && tReview.hive<=20){@>1<@}else if(21<=tReview.hive && tReview.hive<=40){@>2<@}else if(41<=tReview.hive && tReview.hive<=60){@>3<@}else if(61<=tReview.hive && tReview.hive<=80){@>4<@}else{@>5<@}@>.png" alt="임시로" class="hive_img">
						                    <div class="review_hover_box1 rhb">
						                        <h3>Tour Bee로서 받은 평가</h3>
						                        <div class="tour_bee_evaluation">
													<@if(0<=tReview.hive && tReview.hive<=20){@>
														<div class="value_box"><i class="far fa-grin-hearts"></i></div>
						                            	<div class="value_box"><i class="far fa-laugh-beam"></i></div>
						                            	<div class="value_box"><i class="far fa-smile"></i></div>
						                            	<div class="value_box"><i class="far fa-frown"></i></div>
						                            	<div class="value_box" style="color:#000"><i class="far fa-angry"></i></div>
													<@}else if(21<=tReview.hive && tReview.hive<=40){@>
														<div class="value_box"><i class="far fa-grin-hearts"></i></div>
						                            	<div class="value_box"><i class="far fa-laugh-beam"></i></div>
						                            	<div class="value_box"><i class="far fa-smile"></i></div>
						                            	<div class="value_box" style="color:#000"><i class="far fa-frown"></i></div>
						                            	<div class="value_box"><i class="far fa-angry"></i></div>
													<@}else if(41<=tReview.hive && tReview.hive<=60){@>
														<div class="value_box"><i class="far fa-grin-hearts"></i></div>
						                            	<div class="value_box"><i class="far fa-laugh-beam"></i></div>
						                            	<div class="value_box" style="color:#000"><i class="far fa-smile"></i></div>
						                            	<div class="value_box"><i class="far fa-frown"></i></div>
						                            	<div class="value_box"><i class="far fa-angry"></i></div>
													<@}else if(61<=tReview.hive && tReview.hive<=80){@>
														<div class="value_box"><i class="far fa-grin-hearts"></i></div>
						                            	<div class="value_box" style="color:#000"><i class="far fa-laugh-beam"></i></div>
						                           		<div class="value_box"><i class="far fa-smile"></i></div>
						                            	<div class="value_box"><i class="far fa-frown"></i></div>
						                            	<div class="value_box"><i class="far fa-angry"></i></div>
													<@}else{@>
														<div class="value_box" style="color:#000"><i class="far fa-grin-hearts"></i></div>
						                            	<div class="value_box"><i class="far fa-laugh-beam"></i></div>
						                            	<div class="value_box"><i class="far fa-smile"></i></div>
						                            	<div class="value_box"><i class="far fa-frown"></i></div>
						                            	<div class="value_box"><i class="far fa-angry"></i></div>		
													<@}@>
						                        </div><!-- //.tour_bee_evaluation end -->
						                    </div><!-- .review_hover_box1 end -->
						                    <div class="review_hover_box2">
						                        <h3>Local Bee로서 받은 평가</h3>
						                        <div class="local_bee_evaluation chart-area">
													
						                        </div><!-- //.local_bee_evaluation end -->
						                    </div><!-- //.review_hover_box2 end -->
						                </div><!-- //.hive end -->
						            </div><!-- //.evaluation end -->
						        </div><!-- //.review_last_line end -->
						
						        <div class="review_first_line">
						            <div class="writer_photo"><img class="writer_img" src="/img/<@=tReview.lFileName@>"></div>
						            <div class="writer_info">
						                <div class="writer_bee_level">
						           
											<@	if(beeTypes.includes('T')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_tourBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                    							</div>
											<@	}<!-- //if~else end --> @>

											<@	if(beeTypes.includes('K')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_koBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                       								<img src="/img/bee_default.png" width="40" height="40"/>
                    							</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypes.includes('H')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_honeyBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypes.includes('B')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_bumbleBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypes.includes('W')) {@>
												<div class="writer_bee_icon">
                           							<img src="/img/bee_wasp.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="writer_bee_icon">
                        							<img src="/img/bee_default.png" width="40" height="40"/>
                   								</div>
											<@  }<!-- //if~else end --> @>
						                					                	
						                </div><!-- //.writer_bee_level end -->
						                
						                <div class="reg_date"><@=moment(tReview.regDate).format('YYYY-MM-DD')@></div>
						                <div class="writer_name"><@=tReview.lName@></div>
						            </div><!-- //.writer_info end -->
						            <div class="bee_info">
						                <div class="bee_photo"><img class="bee_img" src="/img/<@=tReview.tFileName@>"></div>
						                <div class="bee_level">
						                
											<@	if(beeTypesTwo.includes('T')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_tourBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                    							</div>
											<@	}<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('K')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_koBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                       								<img src="/img/bee_default.png" width="30" height=30"/>
                    							</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('H')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_honeyBee.png" width="40" height="40"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('B')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_bumbleBee.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

											<@	if(beeTypesTwo.includes('W')) {@>
												<div class="bee_icon">
                           							<img src="/img/bee_wasp.png" width="30" height="30"/>
                   								</div>
											<@  }else {@>
												<div class="bee_icon">
                        							<img src="/img/bee_default.png" width="30" height="30"/>
                   								</div>
											<@  }<!-- //if~else end --> @>

						                </div><!-- //.bee_level end -->
						                <div class="bee_name"><@=tReview.tName@></div>
						            </div><!-- //.bee_info end -->
						        </div><!-- //.review_first_line end -->
						        <div class="review_second_line">
						            <div class="review_contents"><@=tReview.content@></div>
						            <div class="review_photos">
						                <img class="review_img" src="/img/<@=tReview.rFileName@>">
										<input value="<@=tReview.noTtr@>" type="hidden"/>	
						            </div><!-- //.review_photos end -->
						        </div><!-- //.review_second_line -->
    						</div><!-- //.review_box end -->
    						
						<@})@>
						<@}@>

			</script>
                    
    <script src="/js/jquery.js"></script>
    <script src="/js/fix-footer.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script src="/js/jquery.dropdown.js"></script>
    <script src="/js/tui-chart-all.js"></script>
    <script src="/js/moment-with-locales.js"></script>
    <script>
    
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
	
    jQuery.ajaxSettings.traditional = true;
    
    var page = 1;
    var region = [1,207,150,173,135,141,198,156,46,27,260,277,218,241,88,110,257,293];
    var theme = ['L','H','E','N','P','S'];
    var bee = ['L'];
    var order = "regDate";
        
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

        function setFixedPosition() {

            var wWidth = $(document).width();
            var left = (wWidth-1070)/2;
            var right = (wWidth-1080)/2;

            console.log(left);
            console.log(right);

            $("#reviewFilter").css("left",left);
            $(".navigator").css("right",right-90); 
        }

        setFixedPosition();
        
        var sTop = $(window).scrollTop();
        var tmp = _.template($("#reviewTmp").html());

        $(".hive_img").hover(function () {
            $(".review_hover_box").toggle();
        });//


        //alert("크크");

        $("#reviewsWrap").on("click",".review_photos",function () {
            // alert("tet");
            //e.preventDefault();
            
            /////////////////////

        	var reviewNum = $(this).find('input').val();
            
            $.ajax({
            	url:"/ajax/getReviewImgs.jsp",
        		data:{"review":reviewNum, "type":bee},
        		dataType:'json',
        		type:"post",
        		error:function() {
        			alert("에러");
        		},
        		success:function(json) {
        			$('.photo_box').empty();
        			photoCount =0;
        			_.each(json, function(photo){
        				$('.photo_box').append($("<img class=\"review_imgs\" src=\"/img/"+photo+"\">"));
        				photoCount++;
        			})
            	}
            });
            
            /////////////////////
            
            $('.full_popup').show();
            $('.popup').show();
            $(this).next().show();
        
        });//.review_photos click() end
        
        
        var x = 0;
		var photoCount = 0;
        $("#leftBtn").click(function () {

            x -= 600;

            console.log(x);

            /*
                ==: 항등 연산자
                =: 대입 연산자
            */

            if(x == -(600*photoCount)) {
                x = 0;
            }//if() end

            $(".photo_box").css("left",x);

        }); //leftBtn click() end

        $('#rightBtn').click(function () {
            x += 600;
            console.log(x);

            if(x == 600) {
                x = -((photoCount-1)*600);
            }//if() end

            $(".photo_box").css("left",x);

        }); //rightBtn click() end
        
        
        

        $(".full_popup").on("click",function () {
            $(this).hide();
            $('.popup').hide();
        });//$popup click() end


        $(window).scroll(function () {

            //스크롤탑
            sTop = $(window).scrollTop();
            if (sTop >= 150) {
                $("#reviewFilter").css({'position': 'fixed', top: 150});
            }
            else {
                $("#reviewFilter").css({'position': 'absolute', top: 300})
            }

            //브라우저의 높이
            var wTop = $(window).height();

            //문서의 높이
            var dTop = $(document).height();
            
            if ((dTop - 350) <= wTop + sTop) {
            	
            	page++;
            	
            	//getReviews();

                //언더스코어 템플릿을 이용해서 추가
               // for (var i = 0; i < 20; i++) {

                //    $("#requestsWrap").append(tmp());
                //}//for() end
            }//if end


        });//window scroll() end
        
        $('.review_tabs').change(function() {
			
			order = $(this).val();
			
			//alert(order);
        	
        	//console.log(order);
        	
        	getReviews();
			
		})

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
            	
            	getReviews();
            	
            }

        });/*$('.find_regions').dropdown() end*/

    	$(".find_regions .dropdown-clear-all").click(function () {
    		//alert("");
    		region = [1,207,150,173,135,141,198,156,46,27,260,277,218,241,88,110,257,293];
    		getReviews();
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
            	
            	getReviews();
            	
            }

        });/*$('.find_theme').dropdown() end*/

    	$(".find_theme .dropdown-clear-all").click(function () {
    		//alert("");
    		theme = ['L','H','E','N','P','S'];
    		getReviews();
		});
        
        $('.find_bees').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: 5,

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
            	
				bee = this.$select.val();
            	
            	console.log(bee);
            	
            	getReviews();
            }

        });/*$('.find_bees').dropdown() end*/

        $(".find_bees .dropdown-clear-all").click(function () {
    		//alert("");
    		bee = 'L';
    		getReviews();
		});
        
        

        ///////////////////////////////////
 		 
        
		
		
        
        
        $(".arrow_to_top").click(function (e) {
            e.preventDefault();
            $("html, body").animate({scrollTop:0}, "slow");
        })//$(".arrow_to_top").click() end


        $(".arrow_to_bottom").click(function (e) {
            // e.preventDefault();
            // $("html, body").animate({scrollTop: $(document).height()}, "slow");

            alert("사용할 수 없는 기능입니다.")

        })//$(".arrow_to_bottom").click() end

        $(".navigation").click(function () {
            alert("페이지 준비중입니다.");
        });//$(".navigation").click() end

        $('.header_left a').eq(3).addClass('on');
        
		function getReviews() {
        	
        	$.ajax({
        		url:"/ajax/getReviews.jsp",
        		data:{
        			"page":page,
        			"theme":theme,
        			"region":region,
        			"bee":bee,
        			"order":order
        		},
        		dataType:'json',//넘어오는 데이터의 타입을 지정
        		type:"post",
        		error:function() {
        			alert("에러");
        		},
        		success:function(json) {
        			
        			
        			if(bee=='L') {
        				
        				$("#reviewsWrap").html(tmp({lReviews:json, bee:"L"}));
        				
        				var idx = 0;
        				_.each(json, function(a){
        			        var data = {
        			            categories: ['투어일치', '매너', '언어', '가성비', '코스'],
        			            series: [
        			                {
        			                    data: [a.matchScore, a.mannerScore , a.langScore , a.priceScore , a.courseScore ]
        			                }
        			            ]
        			        };
        			        var options = {
        			            chart: {
        			                width: 480,
        			                height: 150
        			                // title: 'Monthly Revenue',
        			                // format: '1,000'
        			            },
        			            yAxis: {
        			                title: '평가항목'
        			            },
        			            xAxis: {
        			                // title: '점수',
        			                min: 0,
        			                max: 100,
        			                suffix: '점'
        			            },
        			            series: {
        			                showLabel: true
        			            },
        			            legend:{
        			                visible:false
        			            },
        			            chartExportMenu:{
        			                visible:false
        			            }
        			        };
        			        var theme = {
        			            series: {
        			                colors: [
        			                    '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
        			                    '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
        			                ]
        			            }
        			        };
        			        
        			        // var container = document.querySelector('.chart-area');
        			        var chart = tui.chart.barChart($(".chart-area").eq(idx++).get(0), data, options);

        			        // For apply theme

        			        // tui.chart.registerTheme('myTheme', theme);
        			        // options.theme = 'myTheme';
        			        
        					})
        				
        				
        			}else if(bee=='T'){
        				
        				$("#reviewsWrap").html(tmp({tReviews:json, bee:"T"}));
        				
        			}else{
        				
        				//alert("안나옴");
        			
        			}
        			
        		}

        	});//$.ajax end
        	
        }//getReviews() end
        
        
        getReviews();


    </script>
</body>
</html>        