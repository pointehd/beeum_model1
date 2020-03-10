<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String noUser = request.getParameter("noUser");

	String title = request.getParameter("title");
	String gender = request.getParameter("gender");
	String[] language = request.getParameterValues("language");
	String thema = request.getParameter("thema");
	String startTime = request.getParameter("startTime");
	String lastTime = request.getParameter("lastTime");
	String[] tourIntroPic = request.getParameterValues("tourIntroPic");
	String tourIntroductionText = request.getParameter("tourIntroductionText");
	String[] region = request.getParameterValues("region");
	String meetPlaceName = request.getParameter("meetPlaceName");
	String lng = request.getParameter("lng");
	String lat = request.getParameter("lat");
	String[] meetPlaPic = request.getParameterValues("meetPlaPic");

	System.out.println(lng);
	System.out.println(lat);

	System.out.println(thema);

	/* 	System.out.println(title);
		System.out.println(gender);
		for(int i=0;i<language.length;i++){
			if(language[i]!=null){
				System.out.println(language[i]);
			}
		}
		System.out.println(thema);
		System.out.println(startTime);
		System.out.println(lastTime);
		for(int i=0;i<tourIntroPic.length;i++){
			if(tourIntroPic[i]!=null){
				System.out.println(tourIntroPic[i]);
			}
		}
		System.out.println(tourIntroductionText);
		for(int i=0;i<region.length;i++){
			if(region[i]!=null){
				System.out.println(region[i]);
			}
		}
		System.out.println(meetPlaceName);
		
		for(int i = 0; i < meetPlaPic.length ; i++){
			if(meetPlaPic[i]!=null){
				System.out.println(meetPlaPic[i]);
			}
		} */
	System.out.println(lng);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>registerTourCourse</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<style>
#background1080 {
	width: 1080px;
	min-height: 300px;
	border: none;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
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
	margin: 0;
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
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.tutorial_box {
	width: 100px;
	height: 100px;
	/*background: indianred;*/
	float: left;
	margin-left: 120px;
	margin-top: 25px;
	border: 1px solid lightgray;
	border-radius: 10px;
	text-align: center;
	line-height: 100px;
}

h3 {
	font-size: 40px;
	line-height: 50px;
}

h4 {
	font-size: 20px;
	line-height: 40px;
	font-weight: bold;
}

.title_textarea {
	width: 960px;
	height: 25px;
	font-size: 15px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

textarea {
	resize: none;
}

.radio_button:checked+.radio_label {
	background: #FAE100;
	font-weight: bold;
}

#background1080 .contents {
	width: 1000px;
	/*background: #999999;*/
	margin-left: 40px;
}

#tutorial {
	/*background: orange;*/
	margin: 0;
	height: 200px;
}

.course {
	width: 1000px;
	min-height: 80px;
	/*background: green;*/
	border: 1px solid #FAE100;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	margin-top: 20px;
	position: relative;
}

.course_title_info {
	width: 800px;
	height: 40px;
	/*background: indianred;*/
	margin-left: 20px;
}

.course_title_text {
	width: 960px;
	height: 30px;
	/*background: lawngreen;*/
	margin-left: 20px;
	margin-bottom: 10px;
}

.title_textarea {
	width: 960px;
	height: 25px;
	font-size: 15px;
}

.course_select_place {
	width: 960px;
	height: 80px;
	/*background: lavender;*/
	margin-left: 20px;
	margin-bottom: 10px;
}

.course_select_category {
	width: 480px;
	height: 80px;
	/*background: blue;*/
	float: left;
}

.course_select_category_info {
	width: 200px;
	height: 40px;
	/*background: indianred;*/
}

.course_select_category_elements {
	width: 480px;
	height: 40px;
	/*background: #4AB1E9;*/
	line-height: 40px;
}

.course_select_time {
	width: 480px;
	height: 80px;
	/*background: yellowgreen;*/
	float: left;
}

.course_select_time_info {
	width: 200px;
	height: 40px;
	/*background: indianred;*/
}

.course_select_time_elements {
	width: 480px;
	height: 40px;
	/*background: deepskyblue;*/
	line-height: 40px;
}

.course_content_picture_place {
	width: 480px;
	min-height: 240px;
	/*background: lemonchiffon;*/
	margin-bottom: 10px;
	display: inline-block;
}

.course_content_info {
	width: 200px;
	height: 40px;
	/*background: indianred;*/
}

.course_picture {
	width: 480px;
	height: 240px;
	/*background: indigo;*/
	float: left;
	margin-left: 20px;
}

.course_picture_info {
	width: 200px;
	height: 40px;
	/*background: indianred;*/
}

.course_picture_view {
	width: 460px;
	height: 200px;
	/*background: #e4e3e2;*/
	border: 1px solid lightgray;
	border-radius: 10px;
	text-align: center;
	line-height: 200px;
}

.course_picture_view:hover {
	/*background: #999999;*/
	cursor: pointer;
}

#addCourse {
	width: 960px;
	height: 40px;
	/*background: red;*/
	margin-left: 20px;
	margin-top: 10px;
	border: 1px solid lightgray;
	border-radius: 10px;
	text-align: center;
	line-height: 40px;
	font-size: 20px;
	font-weight: bold;
}

#addCourse:hover {
	background: #FAE100;
	cursor: pointer;
}

.auto_size_textarea {
	width: 475px;
	height: 195px;
	border-radius: 10px;
	border: 1px solid lightgray;
}

.delete_button {
	width: 25px;
	height: 25px;
	position: absolute;
	right: 15px;
	top: 5px;
	border: none;
	font-size: 15px;
	outline: none;
}

.delete_button:hover {
	font-weight: bold;
	cursor: pointer;
	outline: none;
}

#time {
	width: 1000px;
	height: 80px;
	/*background: green;*/
	border: 1px solid #FAE100;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	margin-top: 20px;
}

#timeInfo {
	width: 800px;
	height: 40px;
	/*background: indianred;*/
	margin-left: 20px;
}

#timeSelect {
	margin-left: 20px;
}

#nextButton, #prevButton {
	width: 100px;
	height: 50px;
	font-size: 20px;
	background: white;
	border: 1px solid lightgray;
	border-radius: 10px;
	font-weight: bold;
	margin-top: 20px;
	/*margin-left: 450px;*/
	margin-bottom: 20px;
	position: relative;
	left: 793px;
}

#nextButton:hover, #prevButton:hover {
	background: gold;
	cursor: pointer;
}

#meetPlacePicture:hover {
	background: lightgray;
	cursor: pointer;
}

.full, .full2 {
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
	background: rgba(0, 0, 0, .6);
}

#picturePopupView, #picturePopupView2 {
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

#pictures {
	height: 200px;
	background: #e4e3e2;
	position: absolute;
	left: 0;
	transition: ease .5s;
}

#pictures div {
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

.view_button:hover, .picture_button:hover, .view_button2:hover,
	.picture_button2:hover {
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
	position: absolute;
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
	width: 200px;
	height: 200px;
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
	top: 5px;
	right: 5px;
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
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.bar_val_view, .bar_val_view2 {
	border: none;
	margin-left: 10px;
}

.big_img, .big_img2 {
	width: 460px;
	border: none;
	border-radius: 10px;
	height: 200px;
}
</style>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>
	<div class="content_wrap">
		<div class="content">
			<div id="tutorialTitle">
				<h3>투어등록</h3>
			</div>
			<!--//title end -->
			<div id="background1080">
				<div class="contents">
					<div id="tutorial">
						<div id="tutorialInfo">
							<div class="tutorial_box">기본 정보</div>
							<div class="border" id="borderPosition1"></div>
							<div class="tutorial_box" id="tutorialSelect">코스 정보</div>
							<div class="border" id="borderPosition2"></div>
							<div class="tutorial_box">가격 정보</div>
							<div class="border" id="borderPosition3"></div>
							<div class="tutorial_box">필수 안내</div>
						</div>
						<!--//tutorialInfo end -->
					</div>
					<!--//tutorial end -->

					<form action="/registerTourPrice.jsp" id="secondForm" method="POST">
						<fieldset>
							<legend class="screen_out">투어 등록 - 가이드</legend>
							<input type="hidden" name="noUser" value="<%=noUser%>" /> <input
								type="hidden" name="title" value="<%=title%>" /> <input
								type="hidden" name="gender" value="<%=gender%>" />
							<%
								for (int i = 0; i < language.length; i++) {
							%>
							<input type="hidden" name="language" value="<%=language[i]%>" />
							<%
								}
							%>
							<input type="hidden" name="thema" value="<%=thema%>" /> <input
								type="hidden" name="startTime" value="<%=startTime%>" /> <input
								type="hidden" name="lastTime" value="<%=lastTime%>" />
							<%
								for (int i = 0; i < tourIntroPic.length; i++) {
							%>
							<input type="hidden" name="tourIntroPic"
								value="<%=tourIntroPic[i]%>" />
							<%
								}
							%>
							<input type="hidden" name="tourIntroductionText"
								value="<%=tourIntroductionText%>" />
							<%
								for (int i = 0; i < region.length; i++) {
							%>
							<input type="hidden" name="region" value="<%=region[i]%>" />
							<%
								}
							%>
							<input type="hidden" name="meetPlaceName"
								value="<%=meetPlaceName%>" /> <input type="hidden" name="lng"
								value="<%=lng%>" /> <input type="hidden" name="lat"
								value="<%=lat%>" />
							<%
								for (int i = 0; i < meetPlaPic.length; i++) {
							%>
							<input type="hidden" name="meetPlaPic" value="<%=meetPlaPic[i]%>" />
							<%
								}
							%>



							<div class="course">
								<div class="course_title_info">
									<h4>코스 제목</h4>
								</div>
								<!--//tourTitleInfo end -->
								<div class="course_title_text">
									<input class="title_textarea" name="courseTitle">
									</textarea>
								</div>
								<!--//course_title_text end-->
								<button class="delete_button">
									<i class="fas fa-times"></i>
								</button>
								<!--//delete_button end-->

								<div class="course_select_place">
									<div class="course_select_category">
										<div class="course_select_category_info">
											<h4>분류</h4>
										</div>
										<!--//course_select_category_info end-->
										<div class="course_select_category_elements">
											<select class="category1_select" name="category">
												<option value="투어" selected>투어</option>
												<option value="이동">이동</option>
												<option value="식사">식사</option>
												<option value="포토존">포토존</option>
												<option value="쇼/관람">쇼 / 관람</option>
											</select> <select class="category2_select" name="categoryDetail"
												disabled>
											</select>
										</div>
										<!--//course_select_category_elements-->

									</div>
									<!--//course_select_category-->

									<div class="course_select_time">
										<div class="course_select_time_info">
											<h4>소요시간</h4>
										</div>
										<!--//course_select_time_info-->
										<div class="course_select_time_elements">
											<select name="hour">
												<option value="1" selected>1시간</option>
												<option value="2">2시간</option>
												<option value="3">3시간</option>
												<option value="4">4시간</option>
												<option value="5">5시간</option>
												<option value="6">6시간</option>
												<option value="7">7시간</option>
												<option value="8">8시간</option>
											</select> <select name="min">
												<option value="0" selected>0분</option>
												<option value="30">30분</option>
											</select>
										</div>
										<!--course_select_time_elements end-->
									</div>
									<!--//course_select_time end-->

								</div>
								<!--//course_select_place-->


								<div class="course_picture">
									<div class="course_picture_info">
										<h4>코스 사진</h4>
									</div>
									<!--//course_picture_info end-->
									<div class="course_picture_view" data-idx="0"></div>
									<!--//course_picture_view end-->

								</div>
								<!--//course_picture end-->

								<div class="course_content_picture_place">
									<div class="course_content">
										<div class="course_content_info">
											<h4>코스 내용</h4>
										</div>
										<!--//course_content_info end-->
										<div class="course_content_text">
											<textarea name="tourText" maxlength="500"
												class="auto_size_textarea" onkeyup="textareaSizeAuto(this);"
												onkeydown="textareaSizeAuto(this)"></textarea>
										</div>
										<!--//course_content_text-->
									</div>
									<!--//course_info end-->
								</div>
								<!--//course_info_picture_place end-->
							</div>
							<!--//course end-->


							<script type="text/template" id="courseTmpl">
                            <div class="course">
                                <div class="course_title_info"><h4>코스 제목</h4></div><!--//tourTitleInfo end -->
                                <div class="course_title_text">
                                    <input class="title_textarea" name="courseTitle"></textarea>
                                </div><!--//course_title_text end-->

                                <button class="delete_button"><i class="fas fa-times"></i></button><!--//delete_button end-->

                                <div class="course_select_place">
                                    <div class="course_select_category">
                                        <div class="course_select_category_info">
                                            <h4>분류</h4>
                                        </div><!--//course_select_category_info end-->
                                        <div class="course_select_category_elements">
                                            <select class="category1_select" name="category" >
                                                <option value="투어" selected>투어</option>
                                                <option value="이동">이동</option>
                                                <option value="식사">식사</option>
                                                <option value="포토존">포토존</option>
                                                <option value="쇼/관람">쇼 / 관람</option>
                                            </select>
                                            <select class="category2_select" name="categoryDetail" disabled>
                                            </select>
                                        </div><!--//course_select_category_elements-->

                                    </div><!--//course_select_category-->

                                    <div class="course_select_time">
                                        <div class="course_select_time_info">
                                            <h4>소요시간</h4>
                                        </div><!--//course_select_time_info-->
                                        <div class="course_select_time_elements">
                                            <select name="hour">
                                                <option value="1">1시간</option>
                                                <option value="2">2시간</option>
                                                <option value="3">3시간</option>
                                                <option value="4">4시간</option>
                                                <option value="5">5시간</option>
                                                <option value="6">6시간</option>
                                                <option value="7">7시간</option>
                                                <option value="8">8시간</option>
                                            </select>
                                            <select name="min">
                                                <option value="0">0분</option>
                                                <option value="30">30분</option>
                                            </select>
                                        </div><!--course_select_time_elements end-->
                                    </div><!--//course_select_time end-->

                                </div><!--//course_select_place-->


                                <div class="course_picture">
                                    <div class="course_picture_info">
                                        <h4>코스 사진</h4>
                                    </div><!--//course_picture_info end-->
                                    <div class="course_picture_view" data-idx='<@=++idx@>'>


                                    </div><!--//course_picture_view end-->

                                </div><!--//course_picture end-->

                                <div class="course_content_picture_place">
                                    <div class="course_content">
                                        <div class="course_content_info">
                                            <h4>코스 내용</h4>
                                        </div><!--//course_content_info end-->
                                        <div class="course_content_text">
                            <textarea name="tourText" maxlength="500" class="auto_size_textarea"
                                      onkeyup="textareaSizeAuto(this);" onkeydown="textareaSizeAuto(this)"></textarea>
                                        </div><!--//course_content_text-->
                                    </div><!--//course_info end-->
                                </div><!--//course_info_picture_place end-->
                            </div><!--//course end-->
                        </script>



							<div id="addCourse">코스 추가</div>
							<!--//addCourse end-->

							<div id="time">
								<div id="timeInfo">
									<h4>총 소요시간</h4>
								</div>
								<div id="timeSelect">
									<select name="totalDay">
										<option selected value="0">0일</option>
										<option value="1">1일</option>
										<option value="2">2일</option>
										<option value="3">3일</option>
										<option value="4">4일</option>
										<option value="5">5일</option>
										<option value="6">6일</option>
										<option value="7">7일</option>
										<option value="8">8일</option>
										<option value="9">9일</option>
										<option value="10">10일</option>
										<option value="11">11일</option>
										<option value="12">12일</option>
										<option value="13">13일</option>
										<option value="14">14일</option>
										<option value="15">15일</option>
										<option value="16">16일</option>
										<option value="17">17일</option>
										<option value="18">18일</option>
										<option value="19">19일</option>
										<option value="20">20일</option>
										<option value="21">21일</option>
										<option value="22">22일</option>
										<option value="23">23일</option>
										<option value="24">24일</option>
										<option value="25">25일</option>
										<option value="26">26일</option>
										<option value="27">27일</option>
										<option value="28">28일</option>
										<option value="29">29일</option>
										<option value="30">30일</option>
									</select> <select name="totalHour">
										<option selected value="1">1시간</option>
										<option value="2">2시간</option>
										<option value="3">3시간</option>
										<option value="4">4시간</option>
										<option value="5">5시간</option>
										<option value="">6시간</option>
										<option value="7">7시간</option>
										<option value="8">8시간</option>
										<option value="9">9시간</option>
										<option value="10">10시간</option>
										<option value="11">11시간</option>
										<option value="12">12시간</option>
										<option value="13">13시간</option>
										<option value="14">14시간</option>
										<option value="15">15시간</option>
										<option value="16">16시간</option>
										<option value="17">17시간</option>
										<option value="18">18시간</option>
										<option value="19">19시간</option>
										<option value="20">20시간</option>
										<option value="21">21시간</option>
										<option value="22">22시간</option>
										<option value="23">23시간</option>
									</select> <select name="totalMin">
										<option selected value="0">0분</option>
										<option value="30">30분</option>
									</select>
								</div>
							</div>
							<button id="prevButton" type="button">이전</button>
							<button id="nextButton" type="submit">다음</button>

							<div id="picturePopup" class="full off">
								<div id="picturePopupView">
									<button id="closePopupButton" class="view_button" type="button">
										<i class="fas fa-times"></i>
									</button>
									<div id="popupName">
										<i class="far fa-images"></i> 이미지 추가
									</div>
									<div id="pictureView">
										<div id="pictures">
										
										
										
										</div>
									</div>

									<div id="addButton">
										<label for="uploadImg3" class="picture_button">업로드</label> <input
											type="file" id="uploadImg3" accept="image/*" multiple
											required>
									</div>


									<!--<button id="addButton" class="picture_button">사진 추가</button>-->

									<button id="doneButton" class="picture_button" type="button">완료</button>
									<button id="leftButton" class="view_button" type="button">
										<i class="fas fa-angle-left"></i>
									</button>
									<button id="rightButton" class="view_button" type="button">
										<i class="fas fa-angle-right"></i>
									</button>
								</div>

							</div>
							<!--//picturePopup end-->

							<div id="fullPicturePopup" class="full">
								<div id="fullPicture"></div>
							</div>

						</fieldset>
					</form>
				</div>
				<!--//contents -->
				<!--<button form="firstForm" id="nextButton">다음</button>-->
			</div>
			<!--//background end -->
		</div>
	</div>
	<!--content_wrap-->

	<%@ include file="/WEB-INF/template/footer.jsp"%>
	<script src="/js/jquery.js"></script>
	<script src="/js/fix-footer.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
	
	
	
		$(".search").click(function() {

			$(".keyword-search-form").show();
			$(".search").hide();
			$(".keyword-search-input").focus();

		});//.search click() end

		$(".close").click(function() {

			$(".keyword-search-form").hide();
			$(".search").show();

		});//.close click() end

		$(".agree_check").change(function() {

			$(".lbl_agree").toggleClass("check");

		});//.agree_check change() end

		$("#cancel").click(function() {

			$("#registerPopup").hide();

		});//#cancel click() end

		$("#register").click(function() {

			$("#registerPopup").show();

		});//#register click() end

		$("#login").click(function() {

			$("#logInPopup").show();

		});//#login click() end

		$("#cancelLogin").click(function() {

			$("#logInPopup").hide();

		});//#cancelLogin click() end

		$("#toRegister").click(function() {

			$("#registerPopup").show();
			$("#logInPopup").hide();

		});//#toRegister click() end

		$("#toLogIn").click(function() {

			$("#logInPopup").show();
			$("#registerPopup").hide();

		});//#toLogIn click() end

		$("#findPwdWrapper").click(function() {

			$("#logInPopup").hide();
			$("#findPwdPopup").show();

		});//#findPwdWrapper click() end

		$("#cancelFindPwd").click(function() {

			$("#findPwdPopup").hide();

		});//#cancelFindPwd click() end

		$(window).resize(setFixedPosition);

		function setFixedPosition() {

			var wWidth = $(document).width();

			var right = (wWidth - 1080) / 2;

			// console.log(left);
			// console.log(right);

			$(".navigator").css("right", right - 72);

		};

		setFixedPosition();

		$('#secondForm')
				.on(
						'change',
						'.category1_select',
						function() {
							var val = $(this).val();

							if (val == "이동") {
								$(this).next().html("");
								$(this).next().attr("disabled", false);
								$(this)
										.next()
										.append(
												"<option value='도보' selected>도보</option>");
								$(this).next().append(
										"<option value='자전거'>자전거</option>");
								$(this).next().append(
										"<option value='대중교통'>대중교통</option>");
								$(this)
										.next()
										.append(
												"<option value='자가용(렌트포함)'>자가용(렌트포함)</option>");

							} else if (val == "식사") {
								$(this).next().html("");
								$(this).next().attr("disabled", false);
								$(this)
										.next()
										.append(
												"<option value='한식' selected>한식</option>");
								$(this).next().append(
										"<option value='중식'>중식</option>");
								$(this).next().append(
										"<option value='양식'>양식</option>");
								$(this).next().append(
										"<option value='일식'>일식</option>");
								$(this).next().append(
										"<option value='동남아식'>동남아식</option>");
								$(this).next().append(
										"<option value='채식'>채식</option>");
								$(this).next().append(
										"<option value='카페/찻집'>카페/찻집</option>");
								$(this).next().append(
										"<option value='기타'>기타</option>");

							} else {
								$(this).next().html("");
								$(this).next().attr("disabled", true);

							}
						});

		function textareaSizeAuto(obj) {
			obj.style.height = "195px";
			obj.style.height = (10 + obj.scrollHeight) + "px";

		}

		var tmp = _.template($("#courseTmpl").html());
	<%--    $("#tutorial").append(tmp);	--%>
		$("#addCourse").click(function() {
			$("#addCourse").before(tmp);
		});

		$("body").on("click", ".delete_button", function() {
			$(this).parent().remove();
		});

		$(".arrow_to_top").click(function(e) {
			e.preventDefault();
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
		})//$(".arrow_to_top").click() end

		$(".arrow_to_bottom").click(function(e) {
			e.preventDefault();
			$("html, body").animate({
				scrollTop : $(document).height()
			}, "slow");

			// alert("사용할 수 없는 기능입니다.")

		})//$(".arrow_to_bottom").click() end

		$(".navigation").click(function() {
			alert("페이지 준비중입니다.")
		});//$(".navigation").click() end

		///////////////////////////////////////////////////////////////////////

		var imgFiles = [];

		var arrLength = 0;
		var changeWidth = 0;

		/* 
		$(document).ready(function() {
			$("#uploadImg3").on("change", ImgFilesView);
		}); 
		

		function ImgFilesView(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			arrLength = filesArr.length;
			console.log(arrLength);
			changeWidth = changeWidth + (200 * arrLength);
			//alert(changeWidth);
			$("#pictures").css("width", changeWidth);

			filesArr
					.forEach(function(e) {
						imgFiles.push(e);

						var reader = new FileReader();
						reader.onload = function(e) {
							//var img_html = "<div class='img_box'><img class='small_img' src='" + json.src + "'/><button class='delete_button'>x</button></div>";
							//$("#pictures").append(img_html);
						}
						reader.readAsDataURL(e);
					});
		}
		
		*/

		$("body").on("click", ".delete_button", function() {

			$(this).parent().remove();
			changeWidth = changeWidth - 200;

		});

		$("body").on("click", ".small_img", function() {
			var pic = $(this).attr("src");

			$("#fullPicture").css("background-image", "url('" + pic + "')");
			// $("#fullPicture").append();

			$("#fullPicturePopup").show();
		});

		$("#fullPicturePopup").click(function() {
			S
			$("#fullPicturePopup").hide();
			$("#fullPicture img").remove();
		});

		var x = 0;

		$("#leftButton").click(function() {
			if (x == 0) {
				return;
			}

			x = x + 200;

			$("#pictures").css("left", x);
		});

		$("#rightButton").click(function() {
			S
			if (x < -(changeWidth - 800)) {
				return;
			}
			$("#pictures").css("left", x);
			x = x + -200;
		});

		$("#picUpload").click(function() {
			// $("#reviewPopup").hide();
			$("#picturePopup").show();
		});

		//팝업에서 업로드 이후 이미지 미리보기가 설정되어있는지 여부, 0은 설정x, 1은 설정o
		var input_img = 0;
		var src = "";
		var boxNo =0;
		$("#doneButton").click(function() {
			
			//alert(changeWidth);
			
			if (changeWidth <= 200 && src == "") {
				$(".course_picture_view").eq(boxNo).empty();
				src = $("#pictures .img_box .small_img").eq(0).attr("src");
				
				var img_html = "<img class='big_img' src='" + src + "'/>";
				//alert(src);
				$(".course_picture_view").eq(boxNo).append(img_html);
				
				$("#picturePopup").hide();
			} else if (changeWidth <= 200 && src != "") {
				$(".course_picture_view").eq(boxNo).empty();
				src = $("#pictures .img_box .small_img").eq(0).attr("src");
				var img_html = "<img class='big_img' src='" + src + "'/>";
				//alert(src);
				
				
				$(".course_picture_view").eq(boxNo).append(img_html);
				
				
				$("#picturePopup").hide();
			} else if (changeWidth > 200) {
				alert("한장의 사진만 삽입 가능합니다!");
			} else {
				$(".course_picture_view").empty();
				$("#picturePopup").hide();
			}
			$('#pictures').empty();
		});

		$("#closePopupButton").click(function() {
			/* //alert(changeWidth);
			if (changeWidth <= 200 && src == "") {
				$(".course_picture_view").empty();
				src = $("#pictures .img_box .small_img").eq(0).attr("src");
				var img_html = "<img class='big_img' src='" + src + "'/>";
				//alert(src);
				
				$(".course_picture_view").append(img_html);

				$("#picturePopup").hide();
			} else if (changeWidth <= 200 && src != "") {
				$(".course_picture_view").empty();
				src = $("#pictures .img_box .small_img").eq(0).attr("src");
				var img_html = "<img class='big_img' src='" + src + "'/>";
				//alert(src);
				
				$(".course_picture_view").append(img_html);

				$("#picturePopup").hide();
			} else if (changeWidth > 200) {
				alert("한장의 사진만 삽입 가능합니다!");
			} else {
				$(".course_picture_view").empty();
				$("#picturePopup").hide();
			} */
			$("#picturePopup").hide();
		});

		/////////////////////////////////////////////        

		var $uploadImg3 = $("#uploadImg3");

		var $coursePic = $("#coursePic");
		//var $meetPlaPic = $("#meetPlaPic");

		//imgBox
		var oldPic1 = null;

		var $joinForm = $(".contents form");

		function checkImg3() {
			
			
			var uploadImg3 = $uploadImg3.get(0);

			//한 개의 파일
			var file3 = uploadImg3.files[0];

			//File 객체의 속성
			//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
			//- name : 파일명
			//- lastModified : 최종수정일
			//- size : 파일 크기

			if (oldPic1 != file3.name) {
				oldPic1 = file3.name;
				//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
				//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.

				//ajax로 넘길 폼을 생성하고
				var form = new FormData();

				//우리가 선택한 파일을 붙임
				form.append("type", "P");//일반적인 데이터

				//1)파라미터명, 2) 파일 3) 파일명
				form.append("uploadImg", file3, file3.name);

				//multipart/form-data로 ajax처리
				$.ajax({
							url : "/ajax/uploadImage.jsp",
							dataType : "json",
							type : "POST",//multipart/form-data
							processData : false,//multipart/form-data
							contentType : false,//multipart/form-data
							data : form,
							error : function() {
								alert("사진 서버 점검중!");
							},
							success : function(json) {
								console.log(json);
								//alert("아아");
								var img_html = "<div class='img_box'><img class='small_img' src='" + json.src + "'/><button class='delete_button'>x</button></div>";
								$("#pictures").append(img_html);
								//$tourIntroPic.val(json.src);
								$("<input type='hidden' name='coursePic'>")
										.val(json.src).appendTo("#secondForm");

							}//success end
						});//ajax() end
			}//if end
		}//checkProfile() end

		//profile input요소(type file)

		//$uploadImg3.on("change", ImgFilesView);

		$uploadImg3.on("change", checkImg3);
		
		//갯수만큼 증가
		var idx = 0;
		
		//현재 클릭한 그 요소 idx
		var nowIdx = -1;

		$("body").on("click", ".course_picture_view", function() {
			
			console.log(this.dataset.idx);
			boxNo = this.dataset.idx;
			$("#picturePopup").show();

		});

		$("#prevButton").click(function() {

			location.href = "/registerTourBasic.jsp";
		});
	</script>
</body>
</html>
