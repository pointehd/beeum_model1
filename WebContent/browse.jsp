<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>browse</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>

    /*/////////////////////////*/


    #content {
        width: 1080px;
        min-height: 10px;
        background-color: #FFFFFF;
        margin: auto;
        position: relative;
        overflow: hidden;
        font-family: 'Nanum Gothic Coding', monospace;
    }

    #content h2 {
        padding: 10px;
        font-weight: bold;
        font-size: 20px;
    }

    #map {
        width: 1080px;
        height: 350px;
        margin-bottom: -30px;
    }

    #mapApi {
        width: 1050px;
        min-height: 300px;
        /*border: 1px solid #424242;*/
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        border-radius: 10px;
        margin: auto;
    }

    #map h2 {
        text-indent: 10px;
    }

    .box {
        position: relative;
        width: 1080px;
        padding: 10px 10px;
        margin-top: 40px;
    }

    .detail_look {
        border: 1px solid #424242;

        padding: 5px;
        right: 40px;
        top: 15px;
    }

    .line {
        position: absolute;
        /*background: #00B0FF;*/
    }

    .detail_look a {
        cursor: pointer;
        text-decoration: none;
        color: #000;
    }

    .detail_look a:hover {
        font-weight: bold;
    }

    #tours, #locals, #travelers, #reviews {
        width: 1050px;
        min-height: 320px;
        /*border: 1px solid #424242;*/
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        position: relative;
        top:40px;
    }

    #tours {
        min-height: 330px;
    }

    #locals {
        min-height: 270px;
    }

    #travelers {
        min-height: 320px;
    }

    #reviews {
        min-height: 320px;
        padding-top: 5px;
    }

    /*투어 css*/

    .tour_search_result {
        width: 240px;
        min-height: 250px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin: 10px;
        float: left;
        font-size: 15px;
        position: relative;
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
		border-radius: 10px 0 0 0;
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
        /*border: 1px solid #424242;*/

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
        border-radius: 10px 0px 0px 0px;
    }

    .tour_picture {
        width: 240px;
        height: 100px;
    }
    .tour_search_result .heart {
        width: 30px;
        height: 30px;
        position: absolute;
        top:60px;
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
        border-top:  1px solid lightgray;
        text-indent: 10px;
    }
    .tour_search_result .tour_title {
        width:240px;
        height: 30px;
        line-height: 30px;
        border-top:  1px solid lightgray;
        text-indent: 10px;
    }
    .tour_score_price {
        width: 240px;
        height: 87px;
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
    .honey_img {
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
        bottom: 0;
        right: 0;
        text-align: center;
        line-height: 87px;
    }


    /*로컬 css*/

    .local_search_result {
        width: 240px;
        height: 250px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin: 10px;
        float: left;
        font-size: 15px;
        position: relative;
    }

    .like_bee_img {
        width: 240px;
        height: 100px;
        background: #ffecb3;
        border-bottom: 1px solid lightgray;
        position: relative;
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
        background: blue;
    }

    .like_user_bees {
        position: absolute;
        width: 179px;
        height: 30px;
        /*background: red;*/
        top: 3px;
        left: 65px;
    }

    .like_user_bees .bee {
        width: 25px;
        height: 25px;
        font-size: 15px;
        line-height: 25px;
        float: left;
    }

    .bee {
        /*width: 45px;
        height: 45px;
        border: 1px solid #424242;*/
        border-radius: 2px;
        margin: 0 5px 0 0;
        /*background: red;*/
        float: left;
        font-size: 20px;
        line-height: 45px;
        font-weight: bold;
        text-align: center;
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

    .heart:hover {
        transform: scale(1.1);
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

    /*여행자  css*/

    .traveler_search_result {
        width: 240px;
        height: 300px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin: 10px;
        position: relative;
        float: left;
        font-size: 15px;
    }

    .traveler_search_result .bee_intro {
        height: 55px;
        border-bottom: 1px solid lightgray;
        position: relative;
    }

    .traveler_search_result .bee_pic {
        width: 40px;
        height: 40px;
        position: absolute;
        top: 7px;
        left: 5px;
    }

    .traveler_search_result .bees_icon {
        position: relative;
    }

    .traveler_search_result .bee_icon {
        /*border: 1px solid #424242;*/
        float: left;
        /*width: 15px;
        height: 15px;*/
        margin: 5px;
        text-align: center;

        position: relative;
        left: 50px;
    }

    .traveler_search_result .bee_name {
        position: absolute;
        border: 1px solid transparent;
        width: 100px;
        height: 20px;
        left: 55px;
        bottom: 2px;
    }

	.traveler_search_result .bees_icon {
		position:absolute;
		width:210px;
		height: 25px;
	}

	.traveler_search_result .bee_icon {
		/*border: 1px solid #424242;*/
		float: left;
		width: 24px;
		height: 24px;
		margin: 0 2px 0 2px;
		text-align: center;
		position: relative;
		top: 3px;
	}
	
	.traveler_search_result .bee_icon img{
		width:24px;
		height:24px;
	}

	.traveler_search_result .bee_name {
		position: absolute;
		border: 1px solid transparent;
		width: 100px;
		height: 20px;
		bottom: 0;
	}

    .traveler_search_result .selected_date {
        height: 30px;
        border-bottom: 1px solid lightgray;
        padding: 5px;
    }

    .traveler_search_result .start_date {
        text-indent: 8px;
    }

    .traveler_search_result .end_date {
        text-align: right;
    }

    .traveler_search_result .selected_area {
        height: 30px;
        border-bottom: 1px solid lightgray;
        line-height: 30px;
        text-indent: 10px;
    }

    .traveler_search_result .selected_theme {
        height: 60px;
        border-bottom: 1px solid lightgray;
    }

    .traveler_search_result .theme_tour {
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

    .traveler_search_result .selected_tourist {
        border-bottom: 1px solid lightgray;
        height: 60px;
    }

    .traveler_search_result .tourist_detail {
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

    .traveler_search_result .value {
        height: 50px;
    }

    .traveler_search_result .evaluation {
        position: absolute;
        /*border: 1px solid #424242;*/
        bottom: 3px;
        left: 50px;
    }

    .traveler_search_result .hive_img {
        position: relative;
        left: 8px;
        width: 30px;
        height: 30px;
    }

    .traveler_search_result .price {
        /*border: 1px solid #424242;*/
        width: 100px;
        position: absolute;
        right: 30px;
        bottom: 10px;
    }

    /*후기 css*/

    .review_search_result {
    	border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);position: relative;
        border: 1px solid #FAE100;
        width: 840px;
        height: 300px;/* 임시로 min-height 후기 내용 길이 논의 */
        margin-bottom: 0px;
        margin-top: 50px;
        left: 15px;
    }

    .review_search_result .review_first_line {
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
    }

    .review_search_result .writer_info {
        position: absolute;
        /*overflow: hidden;*/
        /*border: 1px solid #424242;*/
        /*background: #FBC02D;*/
        width: 460px;
        height: 100px;
        left: 145px;
    }

    .review_search_result .writer_bee_level {
        position: relative;
        height: 50px;
    }

    .review_search_result .writer_bee_icon {
        width: 40px;
        height: 40px;
        float: left;
        /*border: 1px solid #424242;*/
        text-align: center;
        line-height: 40px;
        position: relative;
        margin: 5px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
    }

    .review_search_result .reg_date {
        position: absolute;
        height: 50px;
        width: 100px;
        line-height: 50px;
        text-align: center;
        right: 20px;
        top: 0px;
        /*background: #EC407A;*/
    }

    .review_search_result .writer_name {
        position: absolute;
        height: 50px;
        width: 460px;
        text-indent: 10px;
        text-align: left;
        line-height: 50px;
        /*background: #00C853;*/
    }

    .review_search_result .bee_info {
        /*background: aquamarine;*/
        width: 230px;
        height: 100px;
        position: absolute;
        left: 590px;
    }

    .review_search_result .bee_img {
        width: 80px;
        height: 60px;
        position: relative;
        top: 20px;
    }

    .review_search_result .bee_level {
        position: relative;
        height: 50px;
    }

    .review_search_result .bee_icon {
        width: 30px;
        height: 30px;
        /*border: 1px solid #424242;*/
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

    .review_search_result .bee_name {
        position: absolute;
        top: 60px;
        left: 80px;
        text-indent: 3px;
    }

    .review_search_result .review_second_line {
        position: relative;
        /*border: 1px solid #424242;*/
        width: 840px;
        height: 150px;
    }

    .review_search_result .review_contents {
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

    .review_search_result .review_photos {
        position: absolute;
        width: 240px;
        height: 120px;
        border: 1px solid lightgray;
        border-radius: 10px;
        right: 6px;
        top: 13px;
        cursor: pointer;
    }

    .review_search_result .review_img {
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



    .review_search_result .review_last_line {
        position: relative;
        width: 840px;
        height: 50px;
        /*background: coral;*/
    }

    .review_search_result .tour_title {
        position: relative;
        width: 590px;
        height: 50px;
        line-height: 50px;
        text-indent: 15px;
        /*background: #00C853;*/
    }

    .review_search_result .evaluation {
        position: relative;
        width: 250px;
        height: 50px;
        left: 590px;
        top: -45px;
        /*background: maroon;*/
    }

    .review_search_result .value {
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
    }

    .value_box {
        width: 30px;
        height: 30px;
        margin: 5px;
        border: 1px solid #424242;
        float: left;
        position: relative;
    }

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

    .review_search_result .hive_img {
        width: 40px;
        height: 40px;
        top: 5px;
        position: relative;
    }


    .review_search_result .review_num {
        position: relative;
        left: 5px;
        top: 15px;
    }

</style>
<body>  

<%@ include file="/WEB-INF/template/header.jsp" %>

    <div class="content_wrap">
        <div id="content">
            <div id="map"><h2>지도</h2>
                <div id="mapApi" style="width:1050px;height:250px;"></div>
            </div><!-- //#map end -->
            <div class="box">
                <div class="line"><h2>투어</h2></div>
                <div class="detail_look line"><a href="/searchTour.jsp">자세히 보기 <i class="fas fa-angle-right"></i></a></div>
                <div id="tours">
                <%--<%for(int i=0; i<4;i ++){ --%>
                    <div class="tour_search_result">
                    <div class="profile">
                        <div class="profile_pic">
                            <img class="pro_pic" src="/img/img3.png"/>
                        </div><!--//profile_pic-->
                        <div class="profile_level">
                                <div class="level">
                                    <img src="img/bee_tourBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_koBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_honeyBee.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                        </div><!--//profile_level-->
                        <div class="profile_name">&nbsp;윤강운</div><!--//profile_name-->
                    </div><!--//profile-->
                    <div class="tour_pic">
                        <img class="tour_picture" src="/img/blueH.png"/>
                        <div class="heart"><i class="far fa-heart"></i></div><!--//heart-->
                    </div><!--//tour_pic-->
                    <div class="tour_info">서울 자연투어 2018-11-20~2018-11-20</div><!--//tour_info-->
                    <div class="tour_title">blue house의 조용한 정취를!</div><!--//tour_title-->
                    <div class="tour_score_price">
                        <div class="tour_score">
                            <div class="honey"><img class="honey_img" src="/img/rotten tomato_3.png"></div>
                            <div class="score">(80%, 20)</div>
                        </div><!--//tour_score-->
                        <div class="tour_price">&#8361;10,000 (1인)</div><!--//tour_price-->
                    </div><!--//tour_score_price-->
                	</div><!-- //.tour_search_result end -->
 <%-- tour2--%>
                         <div class="tour_search_result">
                    <div class="profile">
                        <div class="profile_pic">
                            <img class="pro_pic" src="/img/image1.jpg"/>
                        </div><!--//profile_pic-->
                        <div class="profile_level">
                                <div class="level">
                                    <img src="img/bee_tourBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_koBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                        </div><!--//profile_level-->
                        <div class="profile_name">&nbsp;김현</div><!--//profile_name-->
                    </div><!--//profile-->
                    <div class="tour_pic">
                        <img class="tour_picture" src="/img/gwangM.jpg"/>
                        <div class="heart"><i class="far fa-heart"></i></div><!--//heart-->
                    </div><!--//tour_pic-->
                    <div class="tour_info">서울 로컬투어 2018-11-30~2018-11-30</div><!--//tour_info-->
                    <div class="tour_title">광장시장에서 로컬의 맛을 느...</div><!--//tour_title-->
                    <div class="tour_score_price">
                        <div class="tour_score">
                            <div class="honey"><img class="honey_img" src="/img/rotten tomato_2.png"></div>
                            <div class="score">(60%, 10)</div>
                        </div><!--//tour_score-->
                        <div class="tour_price">&#8361;40,000 (1인)</div><!--//tour_price-->
                    </div><!--//tour_score_price-->
                	</div><!-- //.tour_search_result end -->
 <%--tour3 --%>          	
                              <div class="tour_search_result">
                    <div class="profile">
                        <div class="profile_pic">
                            <img class="pro_pic" src="/img/img4.jpg"/>
                        </div><!--//profile_pic-->
                        <div class="profile_level">
                                <div class="level">
                                    <img src="img/bee_tourBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_koBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_honeyBee.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                        </div><!--//profile_level-->
                        <div class="profile_name">&nbsp;하재훈</div><!--//profile_name-->
                    </div><!--//profile-->
                    <div class="tour_pic">
                        <img class="tour_picture" src="/img/dojang.png"/>
                        <div class="heart"><i class="far fa-heart"></i></div><!--//heart-->
                    </div><!--//tour_pic-->
                    <div class="tour_info">서울 체험투어 2018-12-14~2018-12-14</div><!--//tour_info-->
                    <div class="tour_title">인사동에서 나만의 도장..</div><!--//tour_title-->
                    <div class="tour_score_price">
                        <div class="tour_score">
                            <div class="honey"><img class="honey_img" src="/img/rotten tomato_3.png"></div>
                            <div class="score">(72%, 35)</div>
                        </div><!--//tour_score-->
                        <div class="tour_price">&#8361;20,000 (1인)</div><!--//tour_price-->
                    </div><!--//tour_score_price-->
                	</div><!-- //.tour_search_result end -->
 <%--tour4 --%>
                              <div class="tour_search_result">
                    <div class="profile">
                        <div class="profile_pic">
                            <img class="pro_pic" src="/img/img2.jpg"/>
                        </div><!--//profile_pic-->
                        <div class="profile_level">
                                <div class="level">
                                    <img src="img/bee_tourBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_koBee%20.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_honeyBee.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                                <div class="level">
                                    <img src="img/bee_default.png" width="24" height="24">
                                </div><!--//level-->
                        </div><!--//profile_level-->
                        <div class="profile_name">&nbsp;방미리</div><!--//profile_name-->
                    </div><!--//profile-->
                    <div class="tour_pic">
                        <img class="tour_picture" src="/img/hanbok.jpg"/>
                        <div class="heart"><i class="far fa-heart"></i></div><!--//heart-->
                    </div><!--//tour_pic-->
                    <div class="tour_info">서울 역사투어 2018-12-28~2018-12-28</div><!--//tour_info-->
                    <div class="tour_title">경복궁에서 조선시대 공주...</div><!--//tour_title-->
                    <div class="tour_score_price">
                        <div class="tour_score">
                            <div class="honey"><img class="honey_img" src="/img/rotten tomato_1.png"></div>
                            <div class="score">(50%, 5)</div>
                        </div><!--//tour_score-->
                        <div class="tour_price">&#8361;30,000 (1인)</div><!--//tour_price-->
                    </div><!--//tour_score_price-->
                	</div><!-- //.tour_search_result end -->
 
               	<%--<%} --%>
              	                	                
                </div><!-- //#tours end -->
            </div><!-- //.box end -->
            <div class="box">
                <div class="line"><h2>로컬</h2></div>
                <div class="detail_look line"><a href="/searchLocal.jsp">자세히 보기 <i class="fas fa-angle-right"></i></a></div>
                <div id="locals">
                	<%--<%for(int i=0; i<4;i ++){ --%>
                	<%--local1 --%>
                    <div class="local_search_result">
                            <div class="like_bee_img"><img src="img/img9.jpg" width="240" height="100"/>
                                <div class="heart"><i class="far fa-heart"></i></div>
                            </div><!-- //.like_bee_img end -->
                            <div class="like_bee_user">
                                <div class="like_user_img"><img src="/img/img3.png" width="60" height="60"/></div>
                                <div class="like_user_bees">
                                    <div class="bee">
                                        <img src="img/bee_tourBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_koBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_honeyBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_bumbleBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_wasp%20.png" width="25" height="25"/>
                                    </div>
                                </div><!-- //.like_user_bees end -->
                                <div class="like_user_name">박지훈</div>
                            </div><!-- //.like_bee_user end -->
                            <div class="like_bee_area">충남·천안</div>
                            <div class="like_bee_score">
                                <div class="tour_bee_img"></div>
                                <div class="bee_score_text">(80%,12)</div>
                            </div><!-- //.like_bee_score end -->
                    </div><!-- //.local_search_result end -->
                    <%--local2 --%>
                                        <div class="local_search_result">
                            <div class="like_bee_img"><img src="img/img10.jpg" width="240" height="100"/>
                                <div class="heart"><i class="far fa-heart"></i></div>
                            </div><!-- //.like_bee_img end -->
                            <div class="like_bee_user">
                                <div class="like_user_img"><img src="/img/image1.jpg" width="60" height="60"/></div>
                                <div class="like_user_bees">
                                    <div class="bee">
                                        <img src="img/bee_tourBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_koBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_honeyBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_bumbleBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_wasp%20.png" width="25" height="25"/>
                                    </div>
                                </div><!-- //.like_user_bees end -->
                                <div class="like_user_name">황동현</div>
                            </div><!-- //.like_bee_user end -->
                            <div class="like_bee_area">충남·천안</div>
                            <div class="like_bee_score">
                                <div class="tour_bee_img"></div>
                                <div class="bee_score_text">(80%,12)</div>
                            </div><!-- //.like_bee_score end -->
                    </div><!-- //.local_search_result end -->
                    <%--local3 --%>
                                        <div class="local_search_result">
                            <div class="like_bee_img"><img src="img/img11.jpg" width="240" height="100"/>
                                <div class="heart"><i class="far fa-heart"></i></div>
                            </div><!-- //.like_bee_img end -->
                            <div class="like_bee_user">
                                <div class="like_user_img"><img src="/img/img4.jpg" width="60" height="60"/></div>
                                <div class="like_user_bees">
                                    <div class="bee">
                                        <img src="img/bee_tourBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_koBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_honeyBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_bumbleBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_wasp%20.png" width="25" height="25"/>
                                    </div>
                                </div><!-- //.like_user_bees end -->
                                <div class="like_user_name">황동현</div>
                            </div><!-- //.like_bee_user end -->
                            <div class="like_bee_area">충남·천안</div>
                            <div class="like_bee_score">
                                <div class="tour_bee_img"></div>
                                <div class="bee_score_text">(80%,12)</div>
                            </div><!-- //.like_bee_score end -->
                    </div><!-- //.local_search_result end -->
                    <%--local4 --%>
                                        <div class="local_search_result">
                            <div class="like_bee_img"><img src="img/img12.jpg" width="240" height="100"/>
                                <div class="heart"><i class="far fa-heart"></i></div>
                            </div><!-- //.like_bee_img end -->
                            <div class="like_bee_user">
                                <div class="like_user_img"><img src="/img/img2.jpg" width="60" height="60"/></div>
                                <div class="like_user_bees">
                                    <div class="bee">
                                        <img src="img/bee_tourBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_koBee%20.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_honeyBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_bumbleBee.png" width="25" height="25"/>
                                    </div>
                                    <div class="bee">
                                        <img src="img/bee_wasp%20.png" width="25" height="25"/>
                                    </div>
                                </div><!-- //.like_user_bees end -->
                                <div class="like_user_name">황동현</div>
                            </div><!-- //.like_bee_user end -->
                            <div class="like_bee_area">충남·천안</div>
                            <div class="like_bee_score">
                                <div class="tour_bee_img"></div>
                                <div class="bee_score_text">(80%,12)</div>
                            </div><!-- //.like_bee_score end -->
                    </div><!-- //.local_search_result end -->
 					<%--<%} --%>
                </div><!-- //#locals end -->
            </div><!-- //.box end -->
            <div class="box">
                <div class="line"><h2>여행자</h2></div>
                <div class="detail_look line"><a href="searchTraveler.jsp">자세히 보기 <i class="fas fa-angle-right"></i></a></div>
                <div id="travelers">
                	<%--<%for(int i=0; i<4;i ++){ --%>
                    <div class="traveler_search_result">
                        <!--<div class="request_box">-->
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="/img/img5.jpg" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                        <div class="bee_icon">
                                            <img src="img/bee_tourBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_koBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_honeyBee.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name">윤강운</div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span>2018.10.31, 14:00</span> ~</div>
                                <div class="end_date"><span>2018.10.31, 17:00</span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div>강원도 평창군</div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                                <div class="theme_tour">로컬</div>
                                <div class="theme_tour">역사</div>
                                <div class="theme_tour">체험</div>
                                <div class="theme_tour">쇼핑</div>
                                <div class="theme_tour">자연</div>
                                <div class="theme_tour">레포츠</div>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                                <div class="tourist_detail"><span>10</span>대, <span>남</span>, <span>2</span>명</div>
                                <div class="tourist_detail"><span>30</span>대, <span>여</span>, <span>1</span>명</div>
                                <div class="tourist_detail"><span>40</span>대, <span>여</span>, <span>1</span>명</div>
                                <div class="tourist_detail"><span>50</span>대, <span>여</span>, <span>1</span>명</div>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                    <div class="hive"><img src="/img/rotten tomato_2.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i>10개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span>10,000</span>/1인 (성인기준)</div>
                            </div><!-- //.value end -->
                    </div><!-- //.traveler_search_result end -->
                    <%--traveler2 --%>
                                        <div class="traveler_search_result">
                        <!--<div class="request_box">-->
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="/img/img6.jpg" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                        <div class="bee_icon">
                                            <img src="img/bee_tourBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_koBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name">김현</div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span>2018.10.31, 14:00</span> ~</div>
                                <div class="end_date"><span>2018.10.31, 17:00</span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div>강원도 평창군</div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                                <div class="theme_tour">로컬</div>
                                <div class="theme_tour">역사</div>
                                <div class="theme_tour">체험</div>
                                <div class="theme_tour">쇼핑</div>
                                <div class="theme_tour">자연</div>
                                <div class="theme_tour">레포츠</div>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                                <div class="tourist_detail"><span>10</span>대, <span>남</span>, <span>2</span>명</div>
                                <div class="tourist_detail"><span>20</span>대, <span>여</span>, <span>1</span>명</div>
                                <div class="tourist_detail"><span>20</span>대, <span>여</span>, <span>3</span>명</div>
                                <div class="tourist_detail"><span>40</span>대, <span>여</span>, <span>1</span>명</div>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                    <div class="hive"><img src="/img/rotten tomato_3.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i>10개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span>30,000</span>/1인 (성인기준)</div>
                            </div><!-- //.value end -->
                    </div><!-- //.traveler_search_result end -->
                    <%--traveler3 --%>
                                        <div class="traveler_search_result">
                        <!--<div class="request_box">-->
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="/img/img7.jpg" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                        <div class="bee_icon">
                                            <img src="img/bee_tourBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_koBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_honeyBee.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src=img/bee_default.png width="24" height="24">
                                        </div>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name">하재훈</div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span>2018.10.31, 14:00</span> ~</div>
                                <div class="end_date"><span>2018.10.31, 17:00</span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div>강원도 평창군</div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                                <div class="theme_tour">로컬</div>
                                <div class="theme_tour">역사</div>
                                <div class="theme_tour">체험</div>
                                <div class="theme_tour">쇼핑</div>
                                <div class="theme_tour">자연</div>
                                <div class="theme_tour">레포츠</div>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                                <div class="tourist_detail"><span>10</span>대, <span>남</span>, <span>2</span>명</div>
                                <div class="tourist_detail"><span>20</span>대, <span>여</span>, <span>1</span>명</div>
                                <div class="tourist_detail"><span>20</span>대, <span>여</span>, <span>1</span>명</div>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                    <div class="hive"><img src="/img/rotten tomato_3.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i>10개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span>100,000</span>/1인 (성인기준)</div>
                            </div><!-- //.value end -->
                    </div><!-- //.traveler_search_result end -->
                    <%--traveler4 --%>
                                        <div class="traveler_search_result">
                        <!--<div class="request_box">-->
                            <div class="bee_intro">
                                <div class="bee_photo"><img class="bee_pic" src="/img/img8.jpg" alt="selfie"></div>
                                <div class="bee_right">
                                    <div class="bees_icon">
                                        <div class="bee_icon">
                                            <img src="img/bee_tourBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_koBee%20.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_honeyBee.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                        <div class="bee_icon">
                                            <img src="img/bee_default.png" width="24" height="24">
                                        </div>
                                    </div><!-- //.bees_icon end -->
                                    <div class="bee_name">방미리</div>
                                </div><!-- //.bee_right end -->
                            </div><!-- //.beeIntro end -->
                            <div class="selected_date">
                                <div class="start_date"><span>2018.10.31, 14:00</span> ~</div>
                                <div class="end_date"><span>2018.10.31, 17:00</span></div>
                            </div><!-- //.selected_date end -->
                            <div class="selected_area">
                                <div>강원도 평창군</div>
                            </div><!-- //.selected_area end -->
                            <div class="selected_theme">
                                <div class="theme_tour">로컬</div>
                                <div class="theme_tour">역사</div>
                                <div class="theme_tour">체험</div>
                                <div class="theme_tour">쇼핑</div>
                                <div class="theme_tour">자연</div>
                                <div class="theme_tour">레포츠</div>
                            </div><!-- //.selected_theme end -->
                            <div class=selected_tourist>
                                <div class="tourist_detail"><span>30</span>대, <span>남</span>, <span>2</span>명</div>
                                <div class="tourist_detail"><span>20</span>대, <span>여</span>, <span>7</span>명</div>
                            </div><!-- //.selected_tourist end -->
                            <div class="value">
                                <div class="evaluation">
                                    <div class="hive"><img src="/img/rotten tomato_3.png" alt="임시로" class="hive_img"></div>
                                    <div class="review_num"><i class="far fa-comment-alt"></i>10개</div>
                                </div><!-- //.evaluation end -->
                                <div class="price">&#8361;<span>30,000</span>/1인 (성인기준)</div>
                            </div><!-- //.value end -->
                    </div><!-- //.traveler_search_result end -->
                   <%--  <%} %>--%>
                </div><!-- //#travelers end -->
            </div><!-- //.box end -->
            <div class="box reviews">
                <div class="line"><h2>후기 (<span>50</span>)</h2></div>
                <div class="detail_look line"><a href="review.jsp">자세히 보기 <i class="fas fa-angle-right"></i></a></div>
                <div id="reviews">

                </div><!-- //#reviews end -->
            </div><!-- //.box end -->
        </div><!-- //#content end -->
    </div><!-- //#content_wrap end -->

<%@ include file="/WEB-INF/template/footer.jsp" %>
<div class="full_popup"></div>
<div class="popup full">
    <div class="wrap">
        <div class="photo_box">
            <img class="review_imgs" src="/img/r1.JPG">
            <img class="review_imgs" src="/img/r2.JPG">
            <img class="review_imgs" src="/img/r3.JPG">
            <img class="review_imgs" src="/img/r4.JPG">
            <img class="review_imgs" src="/img/r5.JPG">
            <img class="review_imgs" src="/img/r6.JPG">
            <img class="review_imgs" src="/img/r7.JPG">
            <img class="review_imgs" src="/img/r8.JPG">
            <img class="review_imgs" src="/img/r9.JPG">
            <img class="review_imgs" src="/img/r10.JPG">
        </div><!-- //.photo_box end -->
        <button id="leftBtn"><i class="fas fa-angle-left"></i></button>
        <button id="rightBtn"><i class="fas fa-angle-right"></i></button>
    </div><!-- //.wrap end -->
</div><!-- //.popup full end -->
<script type="text/template" id="replayTmp">

    <div class="review_search_result">
        <div class="review_last_line">
            <div class="tour_title">강원도·레포츠 투어·짧았던 올림픽의 아쉬움을 달래보세요~</div>
            <div class="evaluation">
                <div class="hive value">
                    <img src="/img/hive_default.png" alt="임시로" class="hive_img">
                    <div class="review_hover_box1 rhb">
                        <h3>Tour Bee로서 받은 평가</h3>
                        <div class="tour_bee_evaluation">
                            <div class="value_box"></div>
                            <div class="value_box"></div>
                            <div class="value_box"></div>
                            <div class="value_box"></div>
                            <div class="value_box"></div>
                        </div><!-- //.tour_bee_evaluation end -->
                    </div><!-- .review_hover_box1 end -->
                    <div class="review_hover_box2 ">
                        <h3>Local Bee로서 받은 평가</h3>
                        <div class="local_bee_evaluation chart-area">

                        </div><!-- //.local_bee_evaluation end -->
                    </div><!-- //.review_hover_box2 end -->
                </div><!-- //.hive end -->
                <div class="review_num value"> <i class="far fa-comment-alt"></i> 10개</div>
            </div><!-- //.evaluation end -->
        </div><!-- //.review_last_line end -->

        <div class="review_first_line">
            <div class="writer_photo"><img class="writer_img" src="/img/s1.jpg"></div>
            <div class="writer_info">
                <div class="writer_bee_level">
                    <div class="writer_bee_icon">
                        <img src="/img/bee_tourBee%20.png" width="40" height="40"/>
                    </div>
                    <div class="writer_bee_icon">
                        <img src="/img/bee_koBee%20.png" width="40" height="40"/>
                    </div>
                    <div class="writer_bee_icon">
                        <img src="/img/bee_honeyBee.png" width="40" height="40"/>
                    </div>
                    <div class="writer_bee_icon">
                        <img src="/img/bee_bumbleBee.png" width="40" height="40"/>
                    </div>
                    <div class="writer_bee_icon">
                        <img src="/img/bee_wasp%20.png" width="40" height="40"/>
                    </div>
                </div><!-- //.writer_bee_level end -->
                <div class="reg_date">2018.10.27</div>
                <div class="writer_name">김현수</div>
            </div><!-- //.writer_info end -->
            <div class="bee_info">
                <div class="bee_photo"><img class="bee_img" src="/img/s1.jpg"></div>
                <div class="bee_level">
                    <div class="bee_icon">
                        <img src="/img/bee_tourBee%20.png" width="30" height="30"/>
                    </div>
                    <div class="bee_icon">
                        <img src="/img/bee_koBee%20.png" width="30" height="30"/>
                    </div>
                    <div class="bee_icon">
                        <img src="/img/bee_honeyBee.png" width="30" height="30"/>
                    </div>
                    <div class="bee_icon">
                        <img src="/img/bee_bumbleBee.png" width="30" height="30"/>
                    </div>
                    <div class="bee_icon">
                        <img src="/img/bee_wasp%20.png" width="30" height="30"/>
                    </div>
                </div><!-- //.bee_level end -->
                <div class="bee_name">황동현</div>
            </div><!-- //.bee_info end -->
        </div><!-- //.review_first_line end -->
        <div class="review_second_line">
            <div class="review_contents">우리 동현님과의 여행을 잊을 수 없을 거에요.</div>
            <div class="review_photos">
                <img class="review_img" src="/img/r1.JPG">
            </div><!-- //.review_photos end -->
        </div><!-- //.review_second_line -->
    </div><!-- //.review_search_result end -->

</script>

    <script src="/js/jquery.js"></script>
	<script src="/js/fix-footer.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a7b0ce1d3ae300dc78f74818909e4d9&libraries=services"></script>
    <script src="/js/tui-chart-all.js"></script>
    <script>
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
            var left = (wWidth-1050)/2;
            var right = (wWidth-1080)/2;

            console.log(left);
            console.log(right);

            $(".navigator").css("right",right-72);
        }

        setFixedPosition();
        
        ///////////////////////////////

        var container = document.getElementById('mapApi');
        var options = {
//            center: new daum.maps.LatLng(37.4810847, 126.95216470000003),
            center: new daum.maps.LatLng(37.580093, 126.976536),
            level: 3
        };

        var map = new daum.maps.Map(container, options);

//        var markerPosition  = new daum.maps.LatLng(37.4810847, 126.95216470000003);
        var markerPosition  = new daum.maps.LatLng(37.580093, 126.976536);

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        ////////////////////////////////////////////
        
        $('.heart').click(function () {
            $(this).children().toggleClass('far').toggleClass('fas');
        });//.heart click() end
        
        ///////////////////////////////////////////

        $(".review_search_result .hive_img").hover(function () {
            $(".review_hover_box").toggle();
        });//
        
        $("#reviews").on("click",".review_photos",function () {
            // alert("tet");
            //e.preventDefault();
            $('.full_popup').show();
            $('.popup').show();
            $(this).next().show();
        });//.review_photos click() end

        $(".full_popup").on("click",function () {
            $(this).hide();
            $('.popup').hide();
        });//$popup click() end
        
        //////////////////////////////////////
        var tmp = _.template($("#replayTmp").html());
        
        for(var i = 0 ; i<3 ; i++) {

            $("#reviews").append(tmp());

        }//for() end
        
        //////////////////////////////////////
        
        var x = 0;
        
        $("#leftBtn").click(function () {

            x -= 600;

            console.log(x);

            /*
                ==: 항등 연산자
                =: 대입 연산자
            */

            if(x == -6000) {
                x = 0;
            }//if() end

            $(".photo_box").css("left",x);

        }); //leftBtn click() end

        $('#rightBtn').click(function () {
            x += 600;
            console.log(x);

            if(x == 600) {
                x = -5400;
            }//if() end

            $(".photo_box").css("left",x);

        }); //rightBtn click() end
        
        ///////////////////////////////////////
        
        $(window).scroll(function () {

            //스크롤탑
            var sTop = $(this).scrollTop();

            //브라우저의 높이
            var wTop = $(window).height();

            //문서의 높이
            var dTop = $(document).height();

            if((dTop-30)<=wTop+sTop) {

                //언더스코어 템플릿을 이용해서 추가

                for(var i = 0 ; i<20 ; i++) {

                    $("#reviews").append(tmp());
                    
                    var charArea = $(".chart-area:last").get(0);

                    tui.chart.barChart(charArea, data, options);

                }//for() end

            }//if end

            //console.log("스크롤탑:"+sTop+"/브라우저높이:"+wTop+"/문서높이:"+dTop);

        });//window scroll() end
        
        //////////////////////////////////////////////////////
        
        var data = {
                categories: ['투어일치', '매너', '언어', '가성비', '코스'],
                series: [
                    {
                        data: [10, 20, 30, 40, 50]
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

            // For apply theme

            // tui.chart.registerTheme('myTheme', theme);
            // options.theme = 'myTheme';

			////////////////////////////////////
            
            
            $(".chart-area").each(function () {
                // var container = document.querySelector('.chart-area');
                var chart = tui.chart.barChart(this, data, options);

                console.log(chart);

            }); 
            
            //////////////////////////////////////////
            
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
                alert("페이지 준비중입니다.")
            });//$(".navigation").click() end


    </script>
</body>
</html>      