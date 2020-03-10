<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>registerTourBasic</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>
    #background1080 {
        width: 1080px;
        min-height: 300px;
        border: none;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin: -20px auto;
        font-family: 'Nanum Gothic Coding', monospace;
        margin-bottom: 30px;
    }
    
    .border {
        width: 118px;
        border: 1px solid lightgray;
        border-bottom: none;
        top: 75px;
        position: relative;
    }
    
    #borderPosition1 {
        left: 222px;
    }
    
    #borderPosition2 {
        left: 444px;
    }
    
    #borderPosition3 {
        left: 666px;
    }
    
    #tutorialSelect {
        background: #FAE100;
    }

    #background1080 .contents {
        width: 1000px;
        /*background: #999999;*/
        margin-left: 40px;
        margin-top: 20px;
        padding-top: 20px;
        padding-bottom: 20px;
    }
    
    #tutorial {
        /*background: orange;*/
        margin:0;
        height: 200px;
    }
    
    #tutorialTitle {
        width: 200px;
        height: 50px;
		font-size: 40px;
		font-weight: bold;
		margin: auto;
		padding: 20px;
    }
    
    #tutorialInfo {
        height: 150px;
        /*background: #4AB1E9;*/
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }
    
    .tutorial_box {
        width: 100px;
        height: 100px;
        /*background: indianred;*/
        float: left;
        margin-left:120px;
        margin-top: 25px;
        border: 1px solid lightgray;
        border-radius: 10px;
        text-align: center;
        line-height: 100px;
    }
    
    #tourTitle {
        width: 1000px;
        height: 80px;
        /*background: green;*/
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin-top: 20px;
    }
    
    #tourTitleInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }
    
    #tourTitleText {
        width: 960px;
        height: 30px;
        /*background: lawngreen;*/
        margin-left: 20px;
    }
    
    #tourIntroduction {
        width: 1000px;
        min-height: 200px; /*textarea에 따라 동적으로 변해야 함*/
        /*background: #4AB1E9;*/
        border: 1px solid #FAE100;
        border-radius: 10px;
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin-top: 20px;
    }
    
    #auto_size_textarea {
        width: 940px;
        height: 200px;
        margin-bottom: 10px;
        border-radius: 10px;
        border: 1px solid lightgray;
        padding: 10px;
    }
    
    #tourIntroductionPictureInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }
    
    #tourIntroductionPicture {
        width: 962px;
        height: 200px;
        /*background: #FBC02D;*/
        margin-left: 20px;
        border: 1px solid lightgray;
        border-radius: 10px;
    }
    #tourIntroductionPicture:hover {
    	background: lightgray;
    	cursor: pointer;
    }

    #tourIntroductionTextInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
        margin-top: 10px;
    }

    #tourIntroductionText {
        width: 960px;
        min-height: 200px;
        /*background: lawngreen;*/
        margin-left: 20px;
    }
    
    #region {
        width: 1000px;
        height: 80px;
        /*background: darkgoldenrod;*/
        border: 1px solid #FAE100;
        border-radius: 10px;
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin-top: 20px;
    }
    
    #regionInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }
    
    #regionSelect {
        width: 960px;
        height: 30px;
        /*background: #FBC02D;*/
        margin-left: 20px;
    }
    
    #meetPlace {
        width: 1000px;
        min-height: 630px;
        /*background: #4AB1E9;*/
        margin-top: 20px;
        border: 1px solid #FAE100;
        border-radius: 10px;
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }
    
    #meetPlaceNameInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }
    
    #meetPlaceNameText {
        width: 960px;
        height: 30px;
        /*background: goldenrod;*/
        margin-left: 20px;
    }
    
    #meetPlaceMapInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
        margin-top: 10px;
    }
    
    #meetPlaceMapSearch {
        width: 960px;
        height: 30px;
        /*background: lawngreen;*/
        margin-left: 20px;
    }
    
    #meetPlaceMapAPI {
        width: 960px;
        height: 200px;
        /*background: green;*/
        margin-left: 20px;
        margin-top: 10px;
        border: 1px solid lightgray;
        border-radius: 10px;
    }
    
    #meetPlacePictureInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
        margin-top: 10px;
    }
    
    #meetPlacePicture {
        width: 960px;
        height: 200px;
        /*background: green;*/
        margin-left: 20px;
        border: 1px solid lightgray;
		border-radius: 10px;
    }

    #tutorial h2 {
        font-size: 40px;
        line-height: 50px;
    }
    
    h3 {
        font-size: 20px;
        line-height: 50px;
        font-weight: bold;
    }
    
    #tutorialTitle h3 {
    	font-size: 40px;
    }
    
    .title_textarea {
        width: 960px;
        height: 25px;
        font-size: 15px;
        border-radius: 10px;
        border: 1px solid lightgray;
    }
    
    .title_textarea2 {
        width: 900px;
        height: 25px;
        font-size: 15px;
        border: 1px solid lightgray;
        border-radius: 10px;
    }
    #meetPlaceSearchButton {
        width: 50px;
        height: 25px;
        margin-left: 6px;
    }

    #nextButton {
        width: 100px;
        height: 50px;
        font-size: 20px;
        background: white;
        border: 1px solid lightgray;
        margin-top: 20px;
        margin-left: 900px;
        margin-bottom: 50px;
        font-weight: bold;
        border-radius: 10px;
    }
    #nextButton:hover {
        background: #FAE100;
        cursor: pointer;
    }

    textarea {
        resize: none;
    }

    #thema {
        width: 1000px;
        height: 100px;
        border: 1px solid #FAE100;
        border-radius: 10px;
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin-top: 20px;
    }

    #themaChooseInfo {
        margin-left: 20px;
    }
    
    #themaChoose, #langChoose {
        width: 960px;
        height: 50px;
        /*background: red;*/
        margin-left: 20px;
        /*border: 1px #424242 solid;*/
        position: relative;
    }

    .radio_button {
        display: none;
    }
    .radio_label {
        position: absolute;
        width: 130px;
        height: 30px;
        background: #aaaaaa;
        text-align: center;
        line-height: 30px;
        border-radius: 30px;
        cursor: pointer;
        margin: 10px;
        border: 1px #424242 solid;
    }
    .radio_button:checked+.radio_label {
        background: #FAE100;
        font-weight: bold;
    }
    #themaLocal {
        left: 0;
    }
    #themaHistory {
        left: 160px;
    }
    #themaExperience {
        left: 320px;
    }
    #themaShopping {
        left: 480px;
    }
    #themaNature {
        left: 640px;
    }
    #themaLeports {
        left: 800px;
    }



    #gender, #lang, #time {
        width: 1000px;
        height: 80px;
        /*background: green;*/
        border: 1px solid #FAE100;
        border-radius: 10px;
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        margin-top: 20px;
    }
    #genderInfo, #langInfo, #timeInfo {
        width: 800px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }
    #genderSelect, #timeSelect {
        margin-left: 20px;
    }




    .avail_language{
        display: none;
        cursor: pointer;
    }
    .user_language{
        margin-right: 20px;
        border-radius: 10px;
        position: relative;
        top: 7px;
        /*padding-left: 5px;
        padding-top: 5px;
        padding-bottom: 5px;*/
        padding: 5px 12px;
        font-size: 18px;
        font-family: 'Gothic A1', sans-serif;
    }
    .korean{
        border: 2px solid #00C853;
        color: #00C853;
    }
    .korean:hover{
        transition: 0.3s ease;
        background-color: #00C853;
        color: #FFFFFF;
        font-weight: bold;
    }
    .korean.checked{
        background-color: #00C853;
        color: #FFFFFF;
        font-weight: bold;
    }
    .english.checked{
        background-color: #1E88E5;
        color: #FFFFFF;
        font-weight: bold;
    }
    .english{
        border: 2px solid #1E88E5;
        color: #1E88E5;
    }
    .chinese{
        border: 2px solid #F44336;
        color: #F44336;
    }
    .chinese.checked{
        background-color: #F44336;
        color: #FFFFFF;
        font-weight: bold;
    }
    .arabic{
        border: 2px solid #26A69A;
        color: #26A69A;
    }
    .arabic.checked{
        background-color: #26A69A;
        color: #FFFFFF;
        font-weight: bold;
    }
    .japanese{
        border: 2px solid #FF6E40;
        color: #FF6E40;
    }
    .japanese.checked{
        background-color: #FF6E40;
        color: #FFFFFF;
        font-weight: bold;
    }
    .spanish{
        border: 2px solid #FFAB40;
        color: #FFAB40;
    }
    .spanish.checked{
        background-color: #FFAB40;
        color: #FFFFFF;
        font-weight: bold;
    }
    .russian{
        border: 2px solid #303F9F;
        color: #303F9F;
    }
    .russian.checked{
        background-color: #303F9F;
        color: #FFFFFF;
        font-weight: bold;
    }
    .german{
        border: 2px solid #004D40;
        color: #004D40;
    }
    .german.checked{
        background-color: #004D40;
        color: #FFFFFF;
        font-weight: bold;
    }
    .french{
        border: 2px solid #5D4037;
        color: #5D4037;
    }
    .french.checked{
        background-color: #5D4037;
        color: #FFFFFF;
        font-weight: bold;
    }
    
    
    /**********************************************************/
    
    
    #meetPlacePicture:hover {
    	background: lightgray;
    	cursor: pointer;
    }
    
    

    .full {
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        position: fixed;
    }
    .full2 {
    	
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        position: fixed;
    }

    .off, .off2 {
        display: none;
    }


    #picturePopup, #fullPicturePopup, #picturePopup2, #fullPicturePopup2 {
        background: rgba(0,0,0,.6);

    }
    #picturePopup2,  #fullPicturePopup2  {
    	z-index: 10;
    }
    
    #picturePopupView,  #picturePopupView2 {
        width: 900px;
        height: 350px;
        background: white;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -450px;
        margin-top: -175px;
        border-radius: 40px;
    }
    #pictureView, #pictureView2 {
        width: 800px;
        height: 200px;
        background: #e4e3e2;
        position: relative;
        top: 75px;
        left: 50px;
        overflow: hidden;
    }
    #pictures, #pictures2 {
        width: 1000px;
        height: 200px;
        background: #e4e3e2;
        position:absolute;
        left:0;
        transition: ease .5s;
    }
    #pictures div, #pictures2 div {
        float: left;
    }


    .view_button, .view_button2 {
        width: 40px;
        height: 40px;
        background: #aaaaaa;
        text-align: center;
        line-height: 40px;
        border: none;
        border-radius: 40px;
        font-size: 30px;
        outline: none;
        position: absolute;
    }
    .view_button:hover, .picture_button:hover, .view_button2:hover, .picture_button2:hover {
        background: #FAE100;
        cursor: pointer;
        font-weight: bold;
    }
    #leftButton, #leftButton2 {
        top: 155px; /*350/2-40/2*/
        left: 5px;
    }
    #rightButton, #rightButton2 {
        top: 155px; /*350/2-40/2*/
        right: 5px;
    }
    #closePopupButton, #closePopupButton2 {
        top: 15px;
        right: 15px;
    }
    .picture_button, .picture_button2 {
        width: 100px;
        height: 45px;
        background: #aaaaaa;
        border: none;
        font-size: 17px;
        border-radius: 50px;
        position: absolute;
        bottom: 15px;
        line-height: 45px;
        text-align: center;

    }
    #addButton, #addButton2 {
        position:absolute;
        right: 270px;
        bottom: 0px;
    }
    #doneButton, #doneButton2 {
        right: 50px;
    }

    #popupName, #popupName2 {
        width: 250px;
        height: 50px;
        /*background: #999999;*/
        position: absolute;
        font-size: 30px;
        text-align: center;
        line-height: 50px;
        top: 25px;
        left: 40px;
    }
    /*.picture_element {*/
    /*width: 200px;*/
    /*height: 200px;*/
    /*!*background: red;*!*/
    /*!*opacity: .5;*!*/
    /*position: absolute;*/
    /*}*/
    /*.picture_element:hover {*/

    /*}*/
    .img_box, .img_box2 {
        position: relative;
        width:200px;
        height:200px;
    }
    .small_img, .small_img2 {
        width: 200px;
        height: 200px;
    }
    .small_img:hover, .small_img2:hover {
        opacity: .5;
        cursor: pointer;
    }
    .delete_button, .delete_button2 {
        position: absolute;
        top:5px;
        right:5px;
        background: #aaaaaa;
        border: none;
        border-radius: 50px;
    }
    .delete_button:hover, .delete_button2:hover {
        background: #FAE100;
        cursor: pointer;
    }


    #fullPicturePopup, #fullPicturePopup2 {

        display: none;
    }
    #fullPicture, #fullPicture2 {
        width: 960px;
        height: 540px;
        /*background: #4AB1E9;*/
        position: absolute;
        /*opacity: .3;*/
        left: 50%;
        top: 50%;
        margin-left: -480px;
        margin-top: -270px;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
    }

    #addButton input[type="file"], #addButton2 input[type="file"] {
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0;
    }

    .bar_val_view, .bar_val_view2 {
        border: none;
        margin-left: 10px;
    }
    
    .big_img, .big_img2 {
   		width: 960px;
   		border: none;
   		border-radius : 10px;
   		height: 200px;
   	}
    


</style>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div class="content_wrap">
    <form action="/registerTourCourse.jsp" id="firstForm" method="post">
		<!--  action 추가 -->
		<!-- session으로 받을 것인가 포스트로 받을 것인가 선택의 문제  
			multipartForm data 안하니까 넘어감 왜?!
		-->
	<fieldset>
	<legend class="screen_out">투어 등록</legend>
		<input type="hidden" name="noUser" value="<%=loginUser.getNoUser() %>"/>
        <div class="content">
        <div id="tutorialTitle"><h3>투어등록</h3></div><!--//title end -->
            <div id="background1080">
                <div class="contents">
                    <div id="tutorial">
                        <div id="tutorialInfo">
                            <div class="tutorial_box" id="tutorialSelect">기본 정보</div>
                            <div class="border" id="borderPosition1"></div>
                            <div class="tutorial_box">코스 정보</div>
                            <div class="border" id="borderPosition2"></div>
                            <div class="tutorial_box">가격 정보</div>
                            <div class="border" id="borderPosition3"></div>
                            <div class="tutorial_box">필수 안내</div>
                        </div><!--//tutorialInfo end -->
                    </div><!--//tutorial end -->

                        <div id="tourTitle">
                            <div id="tourTitleInfo"><h3>제목 (투어의 간략한 제목을 지어주세요.)</h3></div><!--//tourTitleInfo end -->
                            <div id="tourTitleText">
                                <input class="title_textarea" name="title" maxlength="50"/>
                            </div><!--//tourTtitleText end-->
                        </div><!--//tourTitle end-->

                        <div id="gender">
                            <div id="genderInfo"><h3>성별 (원하는 여행객 성별을 선택하세요)</h3></div><!--//genderInfo end -->
                            <div id="genderSelect">
                                <select name="gender" required>
                                    <option value="M">남성</option>
                                    <option value="F">여성</option>
                                    <option value="A">상관없음</option>
                                </select>
                            </div><!--//genderSelect end-->
                        </div><!--//gender end-->

                        <div id="lang">
                            <div id="langInfo"><h3>언어</h3></div><!--//langInfo end -->
                            <div id="langChoose">
                                <div>
                                    <label class="user_language korean">
                                        <input class="avail_language" type="checkbox" name="language" value="Korean"/>한국어
                                    </label>
                                    <label class="user_language english">
                                        <input class="avail_language" type="checkbox" name="language" value="English"/>영어
                                    </label>
                                    <label class="user_language chinese">
                                        <input class="avail_language" type="checkbox" name="language" value="Chinese"/>중국어
                                    </label>
                                    <label class="user_language arabic">
                                        <input class="avail_language" type="checkbox" name="language" value="Arabic"/>아랍어
                                    </label>
                                    <label class="user_language japanese">
                                        <input class="avail_language" type="checkbox" name="language" value="Japanese"/>일본어
                                    </label>
                                    <label class="user_language spanish">
                                        <input class="avail_language" type="checkbox" name="language" value="Spanish"/>스페인어
                                    </label>
                                    <label class="user_language russian">
                                        <input class="avail_language" type="checkbox" name="language" value="Russian"/>러시아어
                                    </label>
                                    <label class="user_language german">
                                        <input class="avail_language" type="checkbox" name="language" value="German"/>독일어
                                    </label>
                                    <label class="user_language french">
                                        <input class="avail_language" type="checkbox" name="language" value="French"/>불어
                                    </label>
                                </div>


                            </div><!--//langSelect end-->
                        </div><!--//lang end-->

                        <div id="thema">
                            <div id="themaChooseInfo"><h3>테마 선택(한가지 선택)</h3></div><!--//themaChooseInfo end-->
                            <div id="themaChoose">
                                <input type="radio" name="thema" id="localTour" class="radio_button" value="L"/>
                                <label for="localTour" class="radio_label" id="themaLocal">로컬 투어</label>

                                <input type="radio" name="thema" id="historyTour" class="radio_button" value="H"/>
                                <label for="historyTour" class="radio_label" id="themaHistory">역사 투어</label>

                                <input type="radio" name="thema" id="experienceTour" class="radio_button" value="E" />
                                <label for="experienceTour" class="radio_label" id="themaExperience">체험 투어</label>

                                <input type="radio" name="thema" id="shoppingTour" class="radio_button" value="S" />
                                <label for="shoppingTour" class="radio_label" id="themaShopping">쇼핑 투어</label>

                                <input type="radio" name="thema" id="natureTour" class="radio_button" value="N" />
                                <label for="natureTour" class="radio_label" id="themaNature">자연 투어</label>

                                <input type="radio" name="thema" id="leportsTour" class="radio_button" value="P" />
                                <label for="leportsTour" class="radio_label" id="themaLeports">레포츠 투어</label>


                            </div><!--//themaChoose end-->
                        </div><!--//thema end-->


                        <div id="time">
                            <div id="timeInfo"><h3>투어 신청 가능 시간 (신청 시작 시간 / 신청 마감 시간)</h3></div><!--//timeInfo end -->
                            <div id="timeSelect">
                                <select name="startTime" >
                                    <option selected value="0000">오전 0시</option>
                                    <option value="0100">오전 1시</option> <option value="0200">오전 2시</option> <option value="0300">오전 3시</option> <option value="0400">오전 4시</option> <option value="0500">오전 5시</option>
                                    <option value="0600">오전 6시</option> <option value="0700">오전 7시</option> <option value="0800">오전 8시</option> <option value="0900">오전 9시</option> <option value="1000">오전 10시</option>
                                    <option value="1100">오전 11시</option> <option value="1200">오후 12시</option> <option value="1300">오후 1시</option> <option value="1400">오후 2시</option> <option value="1500">오후 3시</option>
                                    <option value="1600">오후 4시</option> <option value="1700">오후 5시</option> <option value="1800">오후 6시</option> <option value="1900">오후 7시</option> <option value="2000">오후 8시</option>
                                    <option value="2100">오후 9시</option> <option value="2200">오후 10시</option> <option value="2300">오후 11시</option>
                                </select>
                                <select name="lastTime" >
                                    <option value="0100">오전 1시</option> <option value="0200">오전 2시</option> <option value="0300">오전 3시</option> <option value="0400">오전 4시</option> <option value="0500">오전 5시</option>
                                    <option value="0600">오전 6시</option> <option value="0700">오전 7시</option> <option value="0800">오전 8시</option> <option value="0900">오전 9시</option> <option value="1000">오전 10시</option>
                                    <option value="1100">오전 11시</option> <option value="1200">오후 12시</option> <option value="1300">오후 1시</option> <option value="1400">오후 2시</option> <option value="1500">오후 3시</option>
                                    <option value="1600">오후 4시</option> <option value="1700">오후 5시</option> <option value="1800">오후 6시</option> <option value="1900">오후 7시</option> <option value="2000">오후 8시</option>
                                    <option value="2100">오후 9시</option> <option value="2200">오후 10시</option> <option value="2300">오후 11시</option>
                                </select>
                            </div><!--//timeSelect end-->
                        </div><!--//time end-->

                        <div id="tourIntroduction">
                            <div id="tourIntroductionPictureInfo"><h3>투어 대표사진 등록</h3>
                            <!-- 여기에 사진이 append 됨 -->
                            </div><!--//tourIntroductionPictureInfo end -->
                            
                            <div id="tourIntroductionPicture">
                            </div><!--//tourIntroductionPicture end-->

                            <div id="tourIntroductionTextInfo"><h3>투어 설명 등록</h3></div><!--//tourIntroductionTextInfo end-->
                            <div id="tourIntroductionText">

                <textarea name="tourIntroductionText"  maxlength="500" id="auto_size_textarea"
                          onkeyup="textareaSizeAuto(this);" onkeydown="textareaSizeAuto(this)"></textarea>


                            </div><!--//tourIntroductionText end-->
                        </div><!--//tourIntroduction end-->

                        <div id="region">
                            <div id="regionInfo"><h3>지역</h3></div><!--//regionInfo end-->
                            <div id="regionSelect">
                                <select style="display:none" name="region" id="Select" multiple >
                                    <!-- <option value="강원도" selected  disabled>강원도</option>-->
                                    <option value="강원도">강원도</option>
                                    <option value="경기도">경기도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="광주광역시">광주광역시</option>
                                    <option value="대구광역시">대구광역시</option>
                                    <option value="대전광역시">대전광역시</option>
                                    <option value="부산광역시">부산광역시</option>
                                    <option value="서울특별시">서울특별시</option>
                                    <option value="세종특별자치시">세종특별자치시</option>
                                    <option value="울산광역시">울산광역시</option>
                                    <option value="인천광역시">인천광역시</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="제주특별자치도">제주특별자치도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="충청북도">충청북도</option>
                                </select>

                            </div>
                        </div><!--//region end-->

                        <div id="meetPlace">
                            <div id="meetPlaceNameInfo"><h3>만나는 장소 이름 설정</h3></div><!--//meetPlaceNameInfo end-->
                            <div id="meetPlaceNameText"><input class="title_textarea" name="meetPlaceName"   maxlength="50"></textarea>

                            </div><!--//meetPlaceNameText end-->
                            <div id="meetPlaceMapInfo"><h3>만나는 장소</h3></div><!--//meetPlaceMapInfo end-->
                            <div id="meetPlaceMapSearch">
                            	<input id="meetPlaceNameSearch"  type="text" class="title_textarea2"/><button type="button" id="meetPlaceSearchButton">검색</button>
                            	<input id="lng" name= "lng" type="hidden" value=""/>
                            	<input id="lat" name= "lat" type="hidden" value=""/>
                            </div><!--//meetPlaceMapSearch end-->
                            <div id="meetPlaceMapAPI">
                            
                            
                                <div id="map" style="width:960px;height:200px;"></div>
                            

                            </div><!--//meetPlaceMapAPI end-->
                            <div id="meetPlacePictureInfo"><h3>만나는 장소 사진</h3></div><!--//meetPlacePictureInfo end-->
                            <div id="meetPlacePicture">
                            </div><!--//meetPlacePicture end-->
                        </div><!--//meetPlace end-->
                		<button type="submit" id="nextButton">다음</button>
                </div><!--//contents -->
            </div><!--//background end -->
        </div>
        
            <!-- --------------------------------------- -->
    
    <!-- 여기부분1 -->
	<div id="picturePopup" class="full off">
	    <div id="picturePopupView">
	        <button id="closePopupButton" class="view_button" type="button"><i class="fas fa-times"></i></button>
	        <div id="popupName"><i class="far fa-images"></i> 이미지 추가</div>
	        <div id="pictureView">
	            <div id="pictures">
	            </div>
	        </div><!--//popupName-->
	
	        <div id="addButton">
	            <label for="uploadImg1" class="picture_button">업로드</label>
	            <input type="file" id="uploadImg1" accept="image/*" multiple/>
	        </div><!--//addButton  -->
	
	
	        <!--<button id="addButton" class="picture_button">사진 추가</button>-->
	
	        <button id="doneButton" class="picture_button" type="button">완료</button>
	        <button id="leftButton" class="view_button" type="button"><i class="fas fa-angle-left"></i></button>
	        <button id="rightButton" class="view_button" type="button"><i class="fas fa-angle-right"></i></button>
	    </div>
	
	</div><!--//picturePopup end-->
	
	<div id="fullPicturePopup" class="full">
	    <div id="fullPicture">
	
	    </div>
	</div>


    <!-- --------------------------------------- -->
    
    
    
	<div id="picturePopup2" class="full2 off2">
	    <div id="picturePopupView2">
	        <button id="closePopupButton2" class="view_button2" type="button"><i class="fas fa-times"></i></button>
	        <div id="popupName2"><i class="far fa-images"></i> 이미지 추가</div>
	        <div id="pictureView2">
	            <div id="pictures2">
	            </div>
	        </div>
	
	        <div id="addButton2">
	            <label for="uploadImg2" class="picture_button2">업로드</label>
	            <input type="file" id="uploadImg2" accept="image/*" multiple/>
	        </div>
	        
	        <!--<button id="addButton" class="picture_button">사진 추가</button>-->
	
	        <button id="doneButton2" class="picture_button2" type="button">완료</button>
	        <button id="leftButton2" class="view_button2" type="button"><i class="fas fa-angle-left"></i></button>
	        <button id="rightButton2" class="view_button2" type="button"><i class="fas fa-angle-right"></i></button>
	    </div>
	</div><!--//picturePopup end-->
	
	<div id="fullPicturePopup2" class="full2">
	    <div id="fullPicture2">
	
	    </div>
	</div>
	
	</fieldset><!-- //fieldset end -->
	</form>
</div><!--content_wrap-->
    
<%@ include file="/WEB-INF/template/footer.jsp" %>
    <script src="/js/jquery.js"></script>
    <script src="/js/jquery.dropdown.js"></script>
    <script src="/js/fix-footer.js"></script>
    
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a7b0ce1d3ae300dc78f74818909e4d9&libraries=services"></script>
    
    <script>
        $(".search").click(function () {
            $(".keyword-search-form").show();
            $(".search").hide();
            $(".keyword-search-input").focus();
        });//.search click() end

        $(".close").click(function () {
            $(".keyword-search-form").hide();
            $(".search").show();
        });//.close click() end

        $(".agree_check").change(function () {

            $(".lbl_agree").toggleClass("check");

        });//.agree_check change() end

        $("#cancel").click(function () {

            $("#registerPopup").hide();

        });//#cancel click() end

        $("#register").click(function () {

            $("#registerPopup").show();

        });//#register click() end

        $("#login").click(function () {

            $("#logInPopup").show();

        });//#login click() end

        $("#cancelLogin").click(function () {

            $("#logInPopup").hide();

        });//#cancelLogin click() end

        $("#toRegister").click(function () {

            $("#registerPopup").show();
            $("#logInPopup").hide();

        });//#toRegister click() end

        $("#toLogIn").click(function () {

            $("#logInPopup").show();
            $("#registerPopup").hide();

        });//#toLogIn click() end

        $("#findPwdWrapper").click(function () {

            $("#logInPopup").hide();
            $("#findPwdPopup").show();

        });//#findPwdWrapper click() end

        $("#cancelFindPwd").click(function () {

            $("#findPwdPopup").hide();

        });//#cancelFindPwd click() end

        $(window).resize(setFixedPosition);

        function setFixedPosition() {

            var wWidth = $(document).width();

            //console.log((wWidth));
            //console.log((wWidth-1080));

            var right = (wWidth-1080)/2;

            //console.log(right);

            $(".navigator").css("right",right-72);

        };

        setFixedPosition();


        $(".avail_language").change(function () {
            //alert("test");
            $(this).parent().toggleClass("checked");
        });
        $(".user_language").mouseover(function () {
            // alert("test");
            $(this).css("background",$(this).css("color").css("color","#ffffff"));
        })

        $('#regionSelect').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: Infinity,

            // search field
            input: '<input type="text" maxLength="20" placeholder="검색">',

            // dynamic data here
            // data: [],

            // is search able?
            searchable: false,

            // when there's no result
            searchNoData: '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

            // callback
            choice: function () {}

        });

        $(".arrow_to_top").click(function (e) {
            e.preventDefault();
            $("html, body").animate({scrollTop:0} , "slow");
        })//$(".arrow_to_top").click() end


        $(".arrow_to_bottom").click(function (e) {
            e.preventDefault();
            $("html, body").animate({scrollTop: $(document).height()}, "slow");

            // alert("사용할 수 없는 기능입니다.")

        })//$(".arrow_to_bottom").click() end

        $(".navigation").click(function () {
            alert("페이지 준비중입니다.")
        });//$(".navigation").click() end

        
        
        ///////////////////////////////////////////////////////
        
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 1 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        var map = new daum.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();

        var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
            infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

        // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);

        // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
        daum.maps.event.addListener(map, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                    detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                    var content = '<div class="bAddr">' +
                        '<span class="title">주소정보</span>' +
                        detailAddr +
                        '</div>';
                        
                    //지명 받아오기 여기여기여기
                    var contentSemi = result[0].road_address.address_name;
                    // 영역의 남서쪽 좌표를 얻어옵니다 
				    //var swLatLng = bounds.getSouthWest(); 
				    
				    // 영역의 북동쪽 좌표를 얻어옵니다 
				    //var neLatLng = bounds.getNorthEast(); 
                    //alert(contentsSemiE);
                    

                    // 마커를 클릭한 위치에 표시합니다
                    marker.setPosition(mouseEvent.latLng);
                    
                    var latlng = mouseEvent.latLng;
                    
                    marker.setMap(map);
                    // input에 지명 넣기
                    $('#meetPlaceNameSearch').val(contentSemi);
                    // parameter 좌표 값
                    $('#lat').val(latlng);
                    $('#lng').val(lng);
                    //$('#meetPlaceNameSearch').val("남동쪽 좌표 ("+swLatLng.getLat() + ", " + swLatLng.getLng()+") 북서쪽 좌표 (" + neLatLng.getLat()+ ", " + neLatLng.getLng()+")");

                    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                    infowindow.setContent(content);
                    infowindow.open(map, marker);
                }
            });
        });

        // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
        daum.maps.event.addListener(map, 'idle', function() {
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        });

        function searchAddrFromCoords(coords, callback) {
            // 좌표로 행정동 주소 정보를 요청합니다
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
        }

        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

        // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
        function displayCenterInfo(result, status) {
            if (status === daum.maps.services.Status.OK) {
                var infoDiv = document.getElementById('centerAddr');

                for(var i = 0; i < result.length; i++) {
                    // 행정동의 region_type 값은 'H' 이므로
                    if (result[i].region_type === 'H') {
                        infoDiv.innerHTML = result[i].address_name;
                        break;
                    }
                }
            }
        }


        var meetPlaceMapSearchName = "";
        
        $("#meetPlaceNameSearch").on("keydown", function (e) {
			if(e.keyCode == 13) {
				e.preventDefault();
			}
		});

        $("#meetPlaceSearchButton").click(function () {
            meetPlaceMapSearchName = $("#meetPlaceNameSearch").val();

            ps.keywordSearch(meetPlaceMapSearchName, placesSearchCB);

        });



        // 장소 검색 객체를 생성합니다
        var ps = new daum.maps.services.Places();

        // 키워드로 장소를 검색합니다
        ps.keywordSearch(meetPlaceMapSearchName, placesSearchCB);

        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
        function placesSearchCB (data, status, pagination) {
            if (status === daum.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new daum.maps.LatLngBounds();

                for (var i=0; i<data.length; i++) {
                    //displayMarker(data[i]);
                    bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
                }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
        }
        
        

        ///////////////////////////////////////////////////////////////////////
        
        var imgFiles = [];

        var arrLength = 0;
        var changeWidth = 0;

            

        function ImgFilesView(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            arrLength = filesArr.length;
            changeWidth = changeWidth + (200 * arrLength);
            //alert(changeWidth);
            $("#pictures").css("width", changeWidth);

            filesArr.forEach(function (e) {
                imgFiles.push(e);

                var reader = new FileReader();
                reader.onload = function (e) {
                    var img_html = "<div class='img_box'><img class='small_img' src='" + json.src + "'/><button class='delete_button'>x</button></div>";
                    $("#pictures").append(img_html);
                }
                reader.readAsDataURL(e);
            });
        }


        $("body").on("click", ".delete_button", function () {

        	$(this).parent().remove();
            changeWidth = changeWidth - 200;
            
        });

        $("body").on("click", ".small_img", function () {
            var pic = $(this).attr("src");

            $("#fullPicture").css("background-image", "url('" + pic + "')");
            // $("#fullPicture").append();

            $("#fullPicturePopup").show();
        });


        $("#fullPicturePopup").click(function () {
            $("#fullPicturePopup").hide();
            $("#fullPicture img").remove();
        });


        var x = 0;
        

        $("#leftButton").click(function () {
            if(x == 0) {
                return;
            }

            x = x + 200;


            $("#pictures").css("left", x);
        });

        $("#rightButton").click(function () {

            if(x < -(changeWidth -800)) {
                return;
            }
            $("#pictures").css("left", x);
            x = x + -200;
        });


        $("#picUpload").click(function () {
            // $("#reviewPopup").hide();
            $("#picturePopup").show();
        });
        

        //팝업에서 업로드 이후 이미지 미리보기가 설정되어있는지 여부, 0은 설정x, 1은 설정o
        var input_img = 0;
        var src = "";
        
        $("#doneButton").click(function () {
        	//alert(changeWidth);
        	if(changeWidth != 0 && src == "") {
    			src = $("#pictures .img_box .small_img").eq(0).attr("src");
                var img_html = "<img class='big_img' src='" + src + "'/>";
                //alert(src);
                $("#meetPlacePicture").append(img_html);    		
        	} else if(changeWidth != 0 && src != "") {
        		$("#meetPlacePicture").empty();
    			src = $("#pictures .img_box .small_img").eq(0).attr("src");
                var img_html = "<img class='big_img' src='" + src + "'/>";
                //alert(src);
                $("#meetPlacePicture").append(img_html);    
        	} else {
        		$("#meetPlacePicture").empty();
        	}

            $("#picturePopup").hide();
        });
        $("#closePopupButton").click(function () {
        	//alert(changeWidth);
        	if(changeWidth != 0 && src == "") {
    			src = $("#pictures .img_box .small_img").eq(0).attr("src");
                var img_html = "<img class='big_img' src='" + src + "'/>";
                //alert(src);
                $("#meetPlacePicture").append(img_html);    		
        	} else if(changeWidth != 0 && src != "") {
        		$("#meetPlacePicture").empty();
    			src = $("#pictures .img_box .small_img").eq(0).attr("src");
                var img_html = "<img class='big_img' src='" + src + "'/>";
                //alert(src);
                $("#meetPlacePicture").append(img_html);    
        	} else {
        		$("#meetPlacePicture").empty();
        	}

            $("#picturePopup").hide();
        });
        
	    var $meetPlaPic = $("#meetPlaPic");
	    
	    var oldPic2 = null;

	    var $joinForm = $(".content_wrap>form");

	    function checkImg1() {
	    	var uploadImg1 = $uploadImg1.get(0);
	    	
	    	//한 개의 파일
	    	var file1 = uploadImg1.files[0];
	    		
	    	//File 객체의 속성
	    	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	    	//- name : 파일명
	    	//- lastModified : 최종수정일
	    	//- size : 파일 크기
	    	
	    	
	    	if(oldPic2!=file1.name) {
	    	oldPic2 = file1.name;
	    	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	    	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	    	
	    	//ajax로 넘길 폼을 생성하고
	    	var form = new FormData();
	    	
	    	//우리가 선택한 파일을 붙임
	    	form.append("type","P");//일반적인 데이터
	    	
	    	//1)파라미터명, 2) 파일 3) 파일명
	    	form.append("uploadImg",file1,file1.name);
	    	
	    	//multipart/form-data로 ajax처리
	    	$.ajax({
	    		url:"/ajax/uploadImage.jsp",
	    		dataType:"json",
	    		type:"POST",//multipart/form-data
	    		processData:false,//multipart/form-data
	    		contentType:false,//multipart/form-data
	    		data:form,
	    		error:function() {
	    			alert("사진 서버 점검중!");
	    		},
	    		success:function(json) {
	    			console.log(json);
	    			
                    var img_html = "<div class='img_box'><img class='small_img' src='" + json.src + "'/><button class='delete_button'>x</button></div>";
                    $("#pictures").append(img_html);
	    			$("<input type='hidden' name='meetPlaPic'>").val(json.src).appendTo("#firstForm");
	    			
	    		}//success end
	    	});//ajax() end
	    	}//if end
	    }//checkProfile() end
	    //profile input요소(type file)

	    var $uploadImg1 = $("#uploadImg1");
	    
	    $("#uploadImg1").on("change", ImgFilesView);
	    
	    $("#uploadImg1").on("change", checkImg1);
        
        ///////////////////////////////////////////////////////////////////////
            
        var imgFiles2 = [];

        var arrLength2 = 0;
        var changeWidth2 = 0;

        function ImgFilesView2(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);         
            
            arrLength2 = filesArr.length;
            changeWidth2 = changeWidth2 + (200 * arrLength2);
            //alert(changeWidth);
            $("#pictures2").css("width", changeWidth2);

            filesArr.forEach(function (e) {
                imgFiles.push(e);

                var reader = new FileReader();
                reader.onload = function (e) {
	    			 var img_html = "<div class='img_box2'><img class='small_img2' src='" + json.src + "'/><button class='delete_button2'>x</button></div>";
	                    $("#pictures2").append(img_html);
                }
                reader.readAsDataURL(e);
            });
        }

        $("body").on("click", ".delete_button2", function () {

        	$(this).parent().remove();
            changeWidth2 = changeWidth2 - 200;
            
        });

        $("body").on("click", ".small_img2", function () {
            var pic = $(this).attr("src");

            $("#fullPicture2").css("background-image", "url('" + pic + "')");
            // $("#fullPicture").append();

            $("#fullPicturePopup2").show();
        });

        $("#fullPicturePopup2").click(function () {
            $("#fullPicturePopup2").hide();
            $("#fullPicture2 img").remove();
        });

        var x2 = 0;
        
        $("#leftButton2").click(function () {
            if(x2 == 0) {
                return;
            }

            x2 = x2 + 200;


            $("#pictures2").css("left", x2);
        });

        $("#rightButton2").click(function () {

            if(x2 < -(changeWidth2 -800)) {
                return;
            }
            $("#pictures2").css("left", x2);
            x2 = x2 + -200;
        });

        $("#picUpload2").click(function () {
            // $("#reviewPopup").hide();
            $("#picturePopup2").show();
        });
        
        //팝업에서 업로드 이후 이미지 미리보기가 설정되어있는지 여부, 0은 설정x, 1은 설정o
        var input_img2 = 0;
        var src2 = "";
        
        
        $("#doneButton2").click(function () {
        	//alert(changeWidth);
        	if(changeWidth2 != 0 && src2 == "") {
    			src2 = $("#pictures2 .img_box2 .small_img2").eq(0).attr("src");
                var img_html = "<img class='big_img2' src='" + src2 + "'/>";
                //alert(src);
                $("#tourIntroductionPicture").append(img_html);    		
        	} else if(changeWidth2 != 0 && src2 != "") {
        		$("#tourIntroductionPicture").empty();
    			src = $("#pictures2 .img_box2 .small_img2").eq(0).attr("src");
                var img_html = "<img class='big_img2' src='" + src2 + "'/>";
                //alert(src);
                $("#tourIntroductionPicture").append(img_html);    
        	} else {
        		$("#tourIntroductionPicture").empty();
        	}

            $("#picturePopup2").hide();
        });
        $("#closePopupButton2").click(function () {
        	//alert(changeWidth);
        	if(changeWidth2 != 0 && src2 == "") {
    			src = $("#pictures2 .img_box2 .small_img2").eq(0).attr("src");
                var img_html = "<img class='big_img2' src='" + src + "'/>";
                //alert(src);
                $("#tourIntroductionPicture").append(img_html);    		
        	} else if(changeWidth2 != 0 && src2 != "") {
        		$("#tourIntroductionPicture").empty();
    			src = $("#pictures2 .img_box2 .small_img2").eq(0).attr("src");
                var img_html = "<img class='big_img2' src='" + src2 + "'/>";
                //alert(src);
                $("#tourIntroductionPicture").append(img_html);    
        	} else {
        		$("#tourIntroductionPicture").empty();
        	}

            $("#picturePopup2").hide();
        });
        
        
        $("#tourIntroductionPicture").click(function() {
    		$("#picturePopup2").show();
		});

	  	//image인지 확인하는 정규표현식
	    
	  	//picName
	    var $tourIntroPic = $("#tourIntroPic");
	    //var $meetPlaPic = $("#meetPlaPic");
	    
	    //imgBox
	    var oldPic1 = null;

	    var $joinForm = $(".content_wrap>form");

	    function checkImg2() {
	    	var uploadImg2 = $uploadImg2.get(0);
	    	
	    	//한 개의 파일
	    	var file2 = uploadImg2.files[0];
	    		
	    	//File 객체의 속성
	    	//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
	    	//- name : 파일명
	    	//- lastModified : 최종수정일
	    	//- size : 파일 크기
	    	
	    	
	    	if(oldPic1!=file2.name) {
	    	oldPic1 = file2.name;
	    	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
	    	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
	    	
	    	//ajax로 넘길 폼을 생성하고
	    	var form = new FormData();
	    	
	    	//우리가 선택한 파일을 붙임
	    	form.append("type","P");//일반적인 데이터
	    	
	    	//1)파라미터명, 2) 파일 3) 파일명
	    	form.append("uploadImg",file2,file2.name);
	    	
	    	//multipart/form-data로 ajax처리
	    	$.ajax({
	    		url:"/ajax/uploadImage.jsp",
	    		dataType:"json",
	    		type:"POST",//multipart/form-data
	    		processData:false,//multipart/form-data
	    		contentType:false,//multipart/form-data
	    		data:form,
	    		error:function() {
	    			alert("사진 서버 점검중!");
	    		},
	    		success:function(json) {
	    			console.log(json);
	    			
	    			 var img_html = "<div class='img_box2'><img class='small_img2' src='" + json.src + "'/><button class='delete_button2'>x</button></div>";
	                    $("#pictures2").append(img_html);
	    			//$tourIntroPic.val(json.src);
	    			$("<input type='hidden' name='tourIntroPic'>").val(json.src).appendTo("#firstForm");
	    			
	    		}//success end
	    	});//ajax() end
	    	}//if end
	    }//checkProfile() end

	    
	    //profile input요소(type file)
        
	  	var $uploadImg2 = $("#uploadImg2");
	    
	    $("#uploadImg2").on("change", ImgFilesView2);
	    
	    $("#uploadImg2").on("change", checkImg2);
        
        
        
        ///////////////////////////////////////////////////////////////////////
        $("#meetPlacePicture").click(function() {
    		$("#picturePopup").show();
    	});
		
		

    </script>
<!--<script src="js/fix-footer.js"></script>-->
</body>
</html>        