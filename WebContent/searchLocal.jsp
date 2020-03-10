<%@page import="com.beeum.beeum.dao.AvalLangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String[] locals = request.getParameterValues("local");
	
	
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>searchLocal</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<style>
.contents_wrapper {
	width: 1080px;
	min-height: 800px;
	margin: auto;
	position: relative;
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

.find_locals_form {
	width: 930px;
	min-height: 800px;
	left: 135px;
	position: relative;
	border: none;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.find_locals_orderby {
	position: relative;
	border-radius: 3px;
	width: 800px;
	height: 50px;
	left: 115px;
	top: 20px;
	line-height: 70px;
	vertical-align: center;
	margin-bottom: 30px;
}

.locals_orderby_text {
	font-family: 'Gothic A1', sans-serif;
	font-size: 25px;
	width: 450px;
	line-height: 30px;
	text-align: center;
	position: absolute;
	left: 100px;
	/*top: 15%;*/
	margin-left: 10px;
}

#localTabs {
	position: absolute;
	right: 25px;
	top: -15px;
}

.local_tabs {
	height: 25px;
}

.locals_profile {
	width: 800px;
	height: 200px;
	/*background-color: #FFF59D;*/
	border: 1px solid #FAE100;
	position: relative;
	top: 0px;
	left: 105px;
	margin-bottom: 20px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	border-radius: 10px;
}

.local_profile_picture {
	position: absolute;
	top: 10px;
	left: 10px;
	border: 1px solid lightgrey;
	width: 180px;
	height: 180px;
	background-color: #EFEBE9;
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
}

.local_bee_level_form {
	position: relative;
	width: 290px;
	height: 55px;
	/*background-color: #00AAB4;*/
	left: 210px;
	top: 5px;
}

.local_bee_level {
	position: absolute;
	width: 45px;
	height: 45px;
	top: 5px;
	text-align: center;
	line-height: 45px;
	font-size: 18px;
	color: #212121;
	font-weight: bold;
}

.wasp {
	right: 12px;
}

.bumble_bee {
	right: 70px;
}

.honey_bee {
	right: 128px;
}

.ko_bee {
	right: 185px;
}

.local_gender_age_name_form {
	position: relative;
	width: 332px;
	height: 55px;
	top: 23px;
	left: 210px;
}

.local_basic {
	position: absolute;
	width: 45px;
	height: 45px;
	top: 5px;
	text-align: center;
	line-height: 45px;
	font-size: 18px;
	background-color: #FFFFFF;
	border-radius: 3px;
}

.local_gender {
	position: absolute;
}

.local_name {
	right: -5px;
	width: 220px;
	text-align: left;
	text-indent: 16px;
}

.local_age {
	right: 226px;
}

.local_region_language_form {
	position: relative;
	width: 455px;
	height: 55px;
	top: 30px;
	left: 210px;
}

.local_region {
	position: absolute;
	width: 105px;
	height: 40px;
	top: 10px;
	text-align: center;
	line-height: 40px;
	font-size: 16px;
	background-color: lightgrey;
	border-radius: 10px;
	/*padding: 5px;*/
}

.local_language {
	left: 110px;
	display:inline-block;
	position: relative;
	width: 85px;
	height: 40px;
	top: 10px;
	text-align: center;
	line-height: 40px;
	font-size: 16px;
	border-radius: 10px;
	border: 1px solid lightgrey;
}

.lang_four {
	right: -28px;
}

.lang_three {
	right: 65px;
}

.lang_two {
	right: 159px;
}

.lang_one {
	right: 252px;
}

.review_wish_form {
	position: relative;
	width: 235px;
	height: 74px;
	/*background-color: #00AAB4;*/
	top: -155px;
	left: 555px;
}

.review_form {
	position: absolute;
	width: 80px;
	height: 65px;
	top: -2px;
	text-align: center;
	font-size: 15px;
	/*background-color: #E0E0E0;*/
	/*border: 1px solid #424242;*/
	border-radius: 5px;
	/*box-shadow: 1px 1px 0 #424242;*/
}

.from_tour {
	left: 90px;
}

.from_local {
	left: 5px;
}

.review_rated_form {
	/*background-color: #f2bc00;*/
	height: 46px;
	vertical-align: middle;
	line-height: 50px;
}

.review_rated_number {
	font-size: 16px;
}

.add_wish_list {
	position: absolute;
	width: 60px;
	height: 56px;
	top: 3px;
	right: 0px;
	color: #F44336;
	text-align: center;
	font-size: 40px;
	/*background-color: #EC407A;*/
	line-height: 50px;
	vertical-align: middle;
	cursor: pointer;
}

.message_request_tour_form {
	position: relative;
	width: 185px;
	height: 44px;
	/*background-color: #00AAB4;*/
	top: -150px;
	left: 539px;
}

.message_form {
	position: absolute;
	width: 75px;
	height: 45px;
	top: -6px;
	right: 85px;
	text-align: center;
	font-size: 25px;
	color: #212121;
	/*background-color: #E0E0E0;*/
	line-height: 48px;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid lightgrey;
	/*box-shadow: 1px 1px 0 #424242;*/
	border-radius: 10px;
	transition: 0.1s ease;
}

.request_tour_form {
	position: absolute;
	width: 75px;
	height: 45px;
	top: -6px;
	right: 0px;
	text-align: center;
	font-size: 25px;
	/*background-color: #E0E0E0;*/
	cursor: pointer;
	line-height: 45px;
	vertical-align: middle;
	border: 1px solid lightgrey;
	/*box-shadow: 1px 1px 0 #424242;*/
	border-radius: 10px;
	transition: 0.1s ease;
}

.request_tour_form:active {
	box-shadow: none;
	transform: translate(1px, 1px);
}

.message_form:active {
	box-shadow: none;
	transform: translate(1px, 1px);
}

.go_local_detail_form {
	position: relative;
	width: 120px;
	height: 48px;
	/*background-color: #00AAB4;*/
	top: -142px;
	left: 670px;
	cursor: pointer;
}

.go_local_detail {
	position: absolute;
	width: 80px;
	height: 40px;
	top: 8px;
	right: 10px;
	text-align: center;
	font-size: 15px;
	/*background-color: #E0E0E0;*/
	line-height: 40px;
	vertical-align: middle;
	border: 1px solid lightgrey;
	/*box-shadow: 1px 1px 0 #424242;*/
	border-radius: 10px;
	cursor: pointer;
	/*color: black;*/
}

.go_local_detail a {
	color: black;
}

.go_local_detail:hover {
	font-weight: bold;
}

.go_local_detail:active {
	box-shadow: none;
	transform: translate(1px, 1px);
}

.find_locals_filter_form {
	position: absolute;
	width: 170px;
	min-height: 300px;
	/*left: 200px;*/
	top: 350px;
	border: none;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	background: #FFFFFF;
}

.find_local_filter {
	position: relative;
	width: 170px;
	min-height: 70px;
	border-bottom: 1px solid lightgray;
	padding-bottom: 10px;
}

.find_local_filter:last-child {
	border-bottom: none;
}

.find_local_category {
	/*background-color: #999999;*/
	display: block;
	height: 20px;
	padding: 10px;
	font-weight: bold;
	line-height: 20px;
	vertical-align: middle;
}

.find_regions {
	position: relative;
	height: 25px;
	width: 150px;
	top: 0px;
	left: 0px;
	padding-top: 5px;
}

.find_bees {
	position: relative;
	height: 25px;
	width: 150px;
	padding-top: 5px;
}

.select_language {
	width: 150px;
	position: relative;
	padding-top: 5px;
}

.find_gender {
	position: relative;
	height: 25px;
	width: 150px;
	padding-top: 5px;
}

.find_age {
	position: relative;
	height: 25px;
	width: 150px;
	padding-top: 5px;
}

.heart:hover {
	transform: scale(1.1);
}

.heart {
	width: 85px;
	height: 80px;
	/*background: rebeccapurple;*/
	line-height: 70px;
	position: absolute;
	color: red;
	font-size: 50px;
	text-align: center;
	transition: .2s ease;
	cursor: pointer;
	top: -12px;
	right: -12px;
}
#findRegions>.sejong{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>
	<div class="contents_wrapper">

		<div id="subTitle">
			<h2>당신과 여행을 함께할 Bee를 찾아보세요! (^o^)</h2>
		</div>
		<div class="find_locals_form">

			<div class="find_locals_orderby">
				<div class="locals_orderby_text">
					<h3>Find your amazing Bees!</h3>
				</div>
				<div id="localTabs">
					<select class="local_tabs">
						<option>최신순</option>
						<option>평점순</option>
						<option>리뷰순</option>
					</select>
				</div>
				<!-- //#localTabs end -->
			</div>


		</div>
		<!--find_locals_form end-->
	</div>
	<!--contents_wrapper end-->
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	<div class="find_locals_filter_form">
		<form>
			<div class="find_local_filter local_region_select">
				<label class="find_local_category">지역
					<div class="find_regions">
						<select id="findRegions" style="display: none" name="region"
							multiple required>
							<option value="1">서울특별시</option>
							<option value="207">인천광역시</option>
							<option value="150">대전광역시</option>
							<option class="sejong" value="173">세종특별자치시</option>
							<option value="135">광주광역시</option>
							<option value="141">대구광역시</option>
							<option value="198">울산광역시</option>
							<option value="156">부산광역시</option>
							<option value="46">경기도</option>
							<option value="27">강원도</option>
							<option value="260">충청남도</option>
							<option value="277">충청북도</option>
							<option value="218">전라남도</option>
							<option value="241">전라북도</option>
							<option value="88">경상남도</option>
							<option value="110">경상북도</option>
							<option value="257">제주특별자치도</option>
						</select>
					</div>
				</label>
			</div>
			<div class="find_local_filter local_bees_select">
				<label class="find_local_category">Bees
					<div class="find_bees">
						<select style="display: none" name="bee" multiple required>

							<option 
							<%
							if(locals!=null){
								boolean isTourBee = false;
								for(String local : locals){
									if(local.equals("1")){
								isTourBee = true;
								break;
									}//if() end
								}//for() end
							if(isTourBee) { %>
								selected  
								<%}  }%>
								value="T">Tour Bee</option>
			
							<option <%
							if(locals!=null){
								boolean isKoBee = false;
								for(String local : locals){
									if(local.equals("1")){
								isKoBee = true;
								break;
									}//if() end
								}//for() end
							if(isKoBee) { %>
								selected  
								<%}  }%>
								value="K">Ko Bee</option>
								
							<option <%
							if(locals!=null){
								boolean isHoneyBee = false;
								for(String local : locals){
									if(local.equals("1")){
								isHoneyBee = true;
								break;
									}//if() end
								}//for() end
							if(isHoneyBee) { %>
								selected  
								<%}  }%>
								value="H">Honey Bee</option>
							<option <%
							if(locals!=null){
								boolean isBumbleBee = false;
								for(String local : locals){
									if(local.equals("1")){
								isBumbleBee = true;
								break;
									}//if() end
								}//for() end
							if(isBumbleBee) { %>
								selected  
								<%}  }%>
								value="B">Bumble Bee</option>
							<option <%
							if(locals!=null){
								boolean isWasp = false;
								for(String local : locals){
									if(local.equals("1")){
								isWasp = true;
								break;
								}//if() end
							}//for() end
							if(isWasp) { %>
								selected  
								<%}  }%>
								value="W">Wasp</option>
						</select>
					</div>
				</label>
			</div>
			<div class="find_local_filter local_language_select">
				<label class="find_local_category">언어
					<div class="select_language">
						<select style="display: none" name="language" multiple required>
							<option value="korean">한국어</option>
							<option value="english">영어</option>
							<option value="chinese">중국어</option>
							<option value="arabic">아랍어</option>
							<option value="japanese">일본어</option>
							<option value="spanish">스페인어</option>
							<option value="russian">러시아어</option>
							<option value="german">독일어</option>
							<option value="french">불어</option>
						</select>
					</div>
				</label>
			</div>
			<div class="find_local_filter local_gender_select">
				<label class="find_local_category">성별
					<div class="find_gender">
						<select style="display: none" name="gender" multiple required>
							<option value="null">상관없음</option>
							<option value="male">남</option>
							<option value="female">여</option>
						</select>
					</div>
				</label>
			</div>
			<div class="find_local_filter local_age_select">
				<label class="find_local_category">연령대
					<div class="find_age">
						<select style="display: none" name="age" multiple required>
							<option value="null">상관없음</option>
							<option value="teens">10대</option>
							<option value="twenties">20대</option>
							<option value="thirties">30대</option>
							<option value="forties">40대</option>
							<option value="fifties">50대</option>
							<option value="sixties">60대</option>
							<option value="overSixties">70대~</option>
						</select>
					</div>
				</label>
			</div>
		</form>
	</div>
	<!--find_locals_filter_form end-->
	<!-- <script id="findLocalProfileTemplate" type="text/template"> -->
<script id="findLocalProfileTemplate" type="text/template">


<@ _.each(json, function(user){ 

var beeTypes = [];

	for(var i = 0; i < user.beeList.length ; i++) {
		beeTypes.push(user.beeList[i].type);
	}//for end
	console.log(beeTypes);

@>


        <div class="locals_profile">
            <div class="local_profile_picture"><img src="img/<@=user.fileName@>" width="181" height="181"/></div>
            <div class="local_bee_level_form">

			<@	if(beeTypes.includes('T')) {@>
				<div class="local_bee_level tour_bee">
                    <img src="img/bee_tourBee.png" width="45" height="45"/>
                </div>
				<@  }else {@>
				<div class="local_bee_level tour_bee">
                    <img src="img/bee_default.png" width="45" height="45"/>
                </div>
			<@	}<!-- //if~else end --> @>

			<@	if(beeTypes.includes('K')) {@>
				<div class="local_bee_level ko_bee">
                    <img src="img/bee_koBee.png" width="45" height="45"/>
                </div>
				<@  }else {@>
				<div class="local_bee_level ko_bee">
                    <img src="img/bee_default.png" width="45" height="45"/>
                </div>
			<@	}<!-- //if~else end --> @>

			<@	if(beeTypes.includes('H')) {@>
				<div class="local_bee_level honey_bee">
                    <img src="img/bee_honeyBee.png" width="45" height="45"/>
                </div>
				<@  }else {@>
				<div class="local_bee_level honey_bee">
                    <img src="img/bee_default.png" width="45" height="45"/>
                </div>
			<@	}<!-- //if~else end --> @>

			<@	if(beeTypes.includes('B')) {@>
				<div class="local_bee_level bumble_bee">
                    <img src="img/bee_bumbleBee.png" width="45" height="45"/>
                </div>
				<@  }else {@>
				<div class="local_bee_level bumble_bee">
                    <img src="img/bee_default.png" width="45" height="45"/>
                </div>
			<@	}<!-- //if~else end --> @>	
			
			<@	if(beeTypes.includes('W')) {@>
				<div class="local_bee_level wasp">
                    <img src="img/bee_wasp.png" width="45" height="45"/>
                </div>
				<@  }else {@>
				<div class="local_bee_level wasp">
                    <img src="img/bee_default.png" width="45" height="45"/>
                </div>
			<@	}<!-- //if~else end --> @>			

            </div><!-- //local_bee_level_form end --!>

            <div class="local_gender_age_name_form">
                <div class="local_basic local_gender">
				<@ if(user.gender=="F"){@>
                    <i class="fas fa-female"></i>
					<@} else if(user.gender=="M"){@>
					<i class="fas fa-male"></i>
					<@}@>
                </div>
                <div class="local_basic local_age"><@=user.age@></div>
                <div class="local_basic local_name"><span><@=user.name@></span></div>
            </div>
            <div class="local_region_language_form">
                <div class="local_region"><@=user.city@></div>
				<@_.each(user.languageList, function(language){ @>
                <div class="local_language"><@=language.language@></div>
               <@})@>
            </div>
            <div class="review_wish_form">
                <div class="review_form from_tour">
                    <div class="review_rated_form "><img src="img/rotten tomato_<@if(user.ttrScore > 80){@>5<@} else if(user.ttrScore >60){@>4<@} else if(user.ttrScore > 40){@>3<@} else if(user.ttrScore > 20) {@>2<@} else if(user.ttrScore>0){@>1<@} else {@>default<@}@>.png" width="50px" height="45px"/></div>
                    <div class="review_rated_number">(<@=user.tCnt@>)</div>
                </div>
                <div class="review_form from_local">
                    <div class="review_rated_form "><img src="img/rotten tomato_<@if(user.tlrScore > 80){@>5<@} else if(user.tlrScore >60){@>4<@} else if(user.tlrScore > 40){@>3<@} else if(user.tlrScore > 20) {@>2<@} else if(user.tlrScore>0){@>1<@} else {@>default<@}@>.png" width="50px" height="45px"/></div>
                    <div class="review_rated_number">(<@=user.lCnt@>)</div>
                </div>
                <div class="add_wish_list heart"><i class="far fa-heart"></i></div>
            </div>
            <div class="message_request_tour_form">
                <div class="message_form"><i class="fas fa-comments"></i></i></div>
                <div class="request_tour_form"><i class="fas fa-edit"></i></div>
            </div>
            <div class="go_local_detail_form">
                <div class="go_local_detail"><a href="/userInfo.jsp?noUser=<@=user.noUser@>">자세히</a></div>
            </div>
        </div><!--locals_profile end-->
	<@})@>
    </script>
 <!--    </script> -->
    
   




    
    
    
	
	
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.dropdown.js"></script>
	<script>
	
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
	
	
		var pageNo = 1;
		var flag = true;
		
		$('.find_age').dropdown({

			// read only
			readOnly : false,

			// the maximum number of options allowed to be selected
			limitCount : Infinity,

			// search field
			input : '<input type="text" maxLength="20" placeholder="검색">',

			// dynamic data here
			// data: [],

			// is search able?
			searchable : true,

			// when there's no result
			searchNoData : '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

			// callback
			choice : function() {
			}

		});/* $('.find_age').dropdown() end*/

		$('.find_gender').dropdown({

			// read only
			readOnly : false,

			// the maximum number of options allowed to be selected
			limitCount : Infinity,

			// search field
			input : '<input type="text" maxLength="20" placeholder="검색">',

			// dynamic data here
			// data: [],

			// is search able?
			searchable : true,

			// when there's no result
			searchNoData : '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

			// callback
			choice : function() {
			}

		});/*$('.find_gender').dropdown() end*/

		$('.find_bees').dropdown({

			// read only
			readOnly : false,

			// the maximum number of options allowed to be selected
			limitCount : Infinity,

			// search field
			input : '<input type="text" maxLength="20" placeholder="검색">',

			// dynamic data here
			// data: [],

			// is search able?
			searchable : true,

			// when there's no result
			searchNoData : '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

			// callback
			choice : function() {
			}

		});/* $('.find_bees').dropdown() end*/

		$('.find_regions').dropdown({

			// read only
			readOnly : false,

			// the maximum number of options allowed to be selected
			limitCount : 1,

			// search field
			input : '<input type="text" maxLength="20" placeholder="검색">',

			// dynamic data here
			// data: [],

			// is search able?
			searchable : true,

			// when there's no result
			searchNoData : '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

			// callback
			choice : function() {
			}

		});/*$('.find_regions').dropdown() end*/

		$('.select_language').dropdown({

			// read only
			readOnly : false,

			// the maximum number of options allowed to be selected
			limitCount : 4,

			// search field
			input : '<input type="text" maxLength="20" placeholder="검색">',

			// dynamic data here
			// data: [],

			// is search able?
			searchable : true,

			// when there's no result
			searchNoData : '<li style="color:#ddd">결과 없음. 다시 검색해주세요</li>',

			// callback
			choice : function() {
			}
		});/* $('.select_language').dropdown() end*/

		$('.find_locals_form').on('click', '.heart', function() {
			$(this).children().toggleClass('fas').toggleClass('far');
		});
		$(".search").click(function() {
			$(".keyword-search-form").show();
			$(".search").hide();
			$(".keyword-search-input").focus();
		});
		$(".close").click(function() {
			$(".keyword-search-form").hide();
			$(".search").show();
		});
		$(".agree_check").change(function() {
			//alert("test");
			$(".lbl_agree").toggleClass("check");
		});
		$("#cancel").click(function() {
			$("#registerPopup").hide();
		});
		$("#register").click(function() {
			$("#registerPopup").show();
		});
		$("#login").click(function() {
			$("#logInPopup").show();
		});
		$("#cancelLogin").click(function() {
			$("#logInPopup").hide();
		});
		$("#toRegister").click(function() {
			$("#registerPopup").show();
			$("#logInPopup").hide()
		});
		$("#toLogIn").click(function() {
			$("#logInPopup").show();
			$("#registerPopup").hide();
		});
		$("#findPwdWrapper").click(function() {
			$("#logInPopup").hide();
			$("#findPwdPopup").show();
		});
		$("#cancelFindPwd").click(function() {
			$("#findPwdPopup").hide();
		});

		var tmp = _.template($('#findLocalProfileTemplate').html());

/* 
		for (var i = 0; i < 1; i++) {

			$(".find_locals_form").append(tmp());
			

		}//for() end */




		$(window).scroll(function() {
			//스크롤탑
			var sTop = $(window).scrollTop();

			if (sTop >= 150) {
				$(".find_locals_filter_form").css({
					'position' : 'fixed',
					top : 200
				});
			} else {
				$(".find_locals_filter_form").css({
					'position' : 'absolute',
					top : 350
				});

			}
			//브라우저의 높이
			var wTop = $(window).height();

			//문서의 높이
			var dTop = $(document).height();

			if ((dTop - 350) <= wTop + sTop) {
							
				print();

			}//if end

		});//window scroll() end

		$(window).resize(setFixedPosition);

		function setFixedPosition() {

			var wWidth = $(document).width();
			var left = (wWidth - 1000) / 2;
			var right = (wWidth - 1080) / 2;

			/* console.log(left);
			 console.log(right);*/

			$(".find_locals_filter_form").css("left", left);
			$(".navigator").css("right", right - 72);
		}

		setFixedPosition();

		$(".arrow_to_top").click(function(e) {
			e.preventDefault();
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
		})//$(".arrow_to_top").click() end

		$(".arrow_to_bottom").click(function(e) {
			// e.preventDefault();
			// $("html, body").animate({scrollTop: $(document).height()}, "slow");

			alert("사용할 수 없는 기능입니다.")

		})//$(".arrow_to_bottom").click() end

		$(".navigation").click(function() {
			alert("페이지 준비중입니다.")
		});//$(".navigation").click() end

		$('.header_left a').eq(1).addClass('on');
		
		function print() {
			if(flag) {
				flag = false;
			$.ajax({
				url:"/ajax/selectProfile.jsp",
				dataType : "json",
				Type : "get", 
				data : {"pageNo": pageNo},
				error: function(){
					alert("점검");
				},
				success:function(json){
					//alert("성공");
					pageNo++;
					
					if(json.length>=1) {
						
						console.log(json);
						
						$(".find_locals_form").append(tmp({"json":json}));
						
						flag = true;
					}else {
						alert("끝!!");
					}
					
					
				} 
			});
			}//if end
		};		
		
		print();
	</script>
</body>
</html>
