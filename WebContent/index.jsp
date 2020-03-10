<%@page import="com.beeum.beeum.dao.ToursDAO"%>
<%@page import="com.beeum.beeum.vo.Tour"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	int tourCnt = ToursDAO.selectTotal();
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>beeumMain</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>

    #content {
        width: 1080px;
        min-height: 10px;
        background-color: #fff;
        margin: auto;
        position: relative;
        overflow: hidden;
        font-family: 'Nanum Gothic Coding', monospace;
    }

    #mainFirstLine {
        padding-top: 20px;
    }

    .search_tab {
        /*width: 180px;*/
        height: auto;
        overflow: hidden;
    }

    .search_tab .on {
        background-color: #FAE100;
        color: #000;
        font-weight: bold;
    }

    .search_tab li {
        padding: 5px;
        border: 1px solid #FAE100;
        border-bottom: none;
        float: left;
        cursor: pointer;
        overflow: hidden;
        border-radius: 10px 10px 0px 0px;
    }

    .search_shortcut_contents {
        width: 250px;
        height: 250px;
        border: 1px solid #FAE100;
        padding: 10px;
        line-height: 2em;
        border-radius: 0px 10px 10px 10px;
    }

    .search_shortcut_contents form {
        /*margin-left: 5px;*/
    }

    .search_shortcut_contents .tab {
        position: absolute;
        display: none;
    }

    .search_shortcut_contents .tab {
        display: none;
    }
    .search_shortcut_contents .on{
        display: block;
    }

    .tui-datepicker-input {
        width: 100px;
        height: 25px;
        /*border: 1px solid lightgrey;*/
        border: none;
        z-index: 999;
    }

    #startpicker-input, #startpicker-input2, #endpicker-input, #endpicker-input2 {
        border: 1px solid lightgray;
        border-radius: 3px;
        height: 30px;
    }

    #numFilter button {
        width: 23px;
        height: 23px;
        border: 1px solid #FAE100;
        box-shadow: 2px 2px 2px lightgray;
        text-align: center;
        border-radius: 20px;
        background: transparent;
        text-indent: 0px;
        padding: 4px 3px;
        outline: none;
        cursor: pointer;
    }
    
    #numFilter .fa-minus:hover {
    	transform: scale(1.05);
    }

    #numFilter .fa-plus:hover {
    	transform: scale(1.05);
    }    

    #giveNumCount {
        width: 50px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
        height: 25px;
    }

    .find_main_category {
        position:relative;
        margin-top: 10px;
        line-height: 30px;
    }

    .select_main_category {
        margin-top: 5px;
        margin-bottom: 0px;
    }

    .select_main_category.total_num {
        margin-bottom: 5px;
    }

    .find_regions {
        position: relative;
        height: 30px;
        width: 160px;
        top: 0px;
        left: 0px;
    }

    .find_theme {
        position: relative;
        height: 29px;
        width: 160px;
        top: 0px;
        left: 0px;
    }

    .search_shortcut_contents .search_btn a {
        /*color: black;*/
        color: #3B3C3C;
    }

    .search_btn{
        position: absolute;
        right: 0px;
        bottom: 0px;
        /**/
        background-color: #FAE100;
        border: 1px solid #FAE100;
        border-radius: 30px;
		box-shadow: 2px 2px 2px lightgray;
		display: inline-block;
		width: 50px;
		height: 30px;
		line-height: 30px;
		transition: .5s ease;
		font-family: 'Nanum Gothic Coding', monospace;
		font-weight: bold;
		outline: none;
		cursor: pointer;
    }
    
    .search_btn:hover {
    	transform: scale(1.05);
    }

    #numTourBox {
        /*border: 1px solid #424242;*/
        background-image: url("img/b1.JPG");
        border-radius: 10px;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        /*background: opacity(.8);*/
        width: 800px;
        height: 270px;
        position: absolute;
        top: 20px;
        right: 0px;
        margin-top: 27px;
        /*text-align: center;*/
        line-height: 1.5em;
    }

    #numTourText {
        /*border: 1px solid #424242;*/
        width: 800px;
        height: 270px;
        background: rgba(255,255,255,.25);
    }
    #numTourText p {
        min-width: 450px;
    }

    #numTourBox .cover {
        width: 350px;
        height: 50px;
        line-height: 50px;
        position: absolute;
        top: 100px;
        left: 225px;
        font-weight: bold;
        color:#fff;
        text-shadow:1px 1px 1px #424242;
        font-size: 18px;
    }

    #mainSecondLine, #mainThirdLine {
        text-align: center;
    }
    #mainSecondLine h3, #mainThirdLine h3 {
        margin: 20px;
        font-weight: bold;
        font-size: 25px;
    }

    #mainThirdLine h3 {
        margin-bottom: 30px;
        /*margin-top: 20px;*/
        display: inline-block;
        width: 1000px;
        height: 20px;
    }

    .box_bees_intro {
        width: 214px;
        height: auto;
        /*border: 1px solid #424242;*/
        float: left;
        text-decoration: none;
        color: #000;
        cursor: pointer;
    }

    .box_bees_intro:hover {
        transform: scale(1.02);
    }

    .bee_names {
        font-weight: bold;
        font-size: 18px;
    }

    .bee_contents {
        width: 180px;
        height: 250px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        padding: 10px;
        line-height: 1.5em;
        margin: 11px;
        position: relative;
    }

    .bee_contents:hover {
        box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    .bee_icon {
        width: 200px;
        height: 150px;
        position: absolute;
        bottom: 0px;
        left: 0;
    }

    .bee_icon img {
        text-align: center;
    }

    .theme_box {
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        width: 358px;
        height: 150px;
        position: relative;
        float: left;
        overflow:hidden;
    }

    .theme_box:nth-child(2) {
        background-image: url("img/b2.JPG");
        border-radius: 10px 0 0 0;
    }
    .theme_box:nth-child(3) {
        background-image: url("img/b3.JPG");
    }

    .theme_box:nth-child(4) {
        background-image: url("img/b4.JPG");
        border-radius: 0px 10px 0 0;
    }

    .theme_box:nth-child(5) {
        background-image: url("img/b5.JPG");
        border-radius: 0px 0 0 10px;
    }

    .theme_box:nth-child(6) {
        background-image: url("img/b6.JPG");
    }

    .theme_box:nth-child(7) {
        background-image: url("img/b7.JPG");
        border-radius: 0px 0 10px 0;
    }

    .box_theme_text {
        width: 358px;
        height: 150px;
        position: absolute;
        border-radius: 10px;
    }

    .box_theme_text:hover .box_theme_cover {
        opacity: 0;
    }

    .box_theme_cover {
        width: 358px;
        height: 150px;
        line-height: 150px;
        position: absolute;
        transition:.2s ease;
        opacity: 1;
        /*font-weight: bold;*/
    }
    
    #textOne .box_theme_cover {
    	background: rgba(14, 182, 216, .25);
    }
    
    #textTwo .box_theme_cover {
    	background: rgba(216, 14, 14, .25);
    }

    #textThree .box_theme_cover {
    	background: rgba(115, 216, 14, .25);
    }
    
    #textFour .box_theme_cover {
    	background: rgba(238, 242, 44, .25);
    }

    #textFive .box_theme_cover {
    	background: rgba(209, 44, 242, .25);
    }                
    
    #textSix .box_theme_cover {
    	background: rgba(242, 44, 133, .25);
    }    
    
    .box_theme_text a {
     	width: 358px;
        height: 150px;
        line-height: 150px;
        position: absolute;
    	left:0;
    	top:0;
    	z-index: 1;
    	transition:.2s ease;
    }
    
    .box_theme_text:hover a {
    	transform:scale(1.5);
    }

    .box_theme_link {
        font-weight: bold;
        font-size: 18px;
    }
    .theme_box{
    	transition: .5s ease;
    }
    .theme_box:hover{
    	background-size:400px; 
    }



</style>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>

    <div class="content_wrap">
        <div id="content">
            <div id="mainFirstLine">
                <div id="searchShortcutWrap">
                    <div class="search_shortcut_header">
                        <ul class="search_tab">
                            <li class="on">투어 찾기</li>
                            <li>여행자 찾기</li>
                        </ul>
                    </div><!-- //.search_shortcut_header end -->
                    <div class="search_shortcut_contents">
                        <div class="tab on">
                            <form action="/searchTour1.jsp"  method="get">
                                <fieldset>
                                    <p>당신만의 여행을 찾으세요.</p>
                                    <h2 class="find_main_category"><div class="select_main_category">날짜</div>
                                    <div class="row">
                                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                            <input id="startpicker-input" name="start" type="text" aria-label="Date" autocomplete="off">
                                            <span class="tui-ico-date"></span>
                                            <div id="startpicker-container" style="margin-left: -1px;"></div>
                                        </div><!-- //.tui-datepicker-input end -->
                                        <span>to</span>
                                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                            <input id="endpicker-input" name= end" type="text" aria-label="Date" autocomplete="off">
                                            <span class="tui-ico-date"></span>
                                            <div id="endpicker-container" style="margin-left: -1px;"></div>
                                        </div><!-- //.tui-datepicker-input end -->
                                    </div><!-- //.row end -->
                                    </h2>
                                    <label><div class="select_main_category total_num">총인원</div>
                                    <div id="numFilter">
                                        <button type="button"><i class="fas fa-minus"></i></button>
                                        <input name="num" placeholder="1" id="giveNumCount">
                                        <button type="button"><i class="fas fa-plus"></i></button>
                                    </div><!-- //#numFilter end -->
                                    </label>
                                    <label class="find_main_category"><div class="select_main_category">테마</div>
                                        <div class="find_theme">
                                        <select style="display:none" name="theme" multiple>
                                            <option value="L">로컬 투어</option>
                                            <option value="H">역사 투어</option>
                                            <option value="E">체험 투어</option>
                                            <option value="S">쇼핑 투어</option>
                                            <option value="N">자연 투어</option>
                                            <option value="P">레포츠 투어</option>
                                        </select>
                                        </div>
                                    </label>
                                    <button class="search_btn" type="submit">검색</button>
                                </fieldset>
                            </form>
                        </div><!-- //.tab end -->
                        <div class="tab">
                            <form action="/searchTraveler.jsp" method="get">
                                <fieldset>
                                    <p>당신의 여행 파트너를 찾으세요.</p>
                                    <div class="find_main_category"><div class="select_main_category">날짜</div>
                                    <div class="row">
                                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                            <input id="startpicker-input2"
                                            name="start"
                                             type="text" aria-label="Date" autocomplete="off">
                                            <span class="tui-ico-date"></span>
                                            <div id="startpicker-container2" style="margin-left: -1px;"></div>
                                        </div><!-- //.tui-datepicker-input end -->
                                        <span>to</span>
                                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                            <input id="endpicker-input2"  
                                            name="end"
                                            type="text" aria-label="Date" autocomplete="off">
                                            <span class="tui-ico-date"></span>
                                            <div id="endpicker-container2" style="margin-left: -1px;"></div>
                                        </div><!-- //.tui-datepicker-input end -->
                                    </div><!-- //.row end -->
                                    </div>
                                    <div class="find_main_category"><div class="select_main_category">지역</div>
                                        <div class="find_regions">
                                            <select id="findRegions" style="display:none" name="region" multiple required>
                                                <option value="1">서울특별시</option>
                                                <option value="207">인천광역시</option>
                                                <option value="150">대전광역시</option>
                                                <option value="173">세종특별자치시</option>
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
                                    </div>
                                    <div class="find_main_category"><div class="select_main_category">테마</div>
                                        <div class="find_theme">
                                        <select style="display:none" name="theme" multiple>
                                            <option value="L">로컬 투어</option>
                                            <option value="H">역사 투어</option>
                                            <option value="E">체험 투어</option>
                                            <option value="S">쇼핑 투어</option>
                                            <option value="N">자연 투어</option>
                                            <option value="P">레포츠 투어</option>
                                        </select>
                                        </div>
                                    </div>
                                    <button class="search_btn" type="submit">검색</button>
                                </fieldset>
                            </form>
                        </div><!-- //.tab end -->
                    </div><!-- //.search_shortcut_contents end -->
                </div><!-- //#searchShortcutWrap end -->
                <div id="numTourBox">
                    <div id="numTourText">
                        <div class="cover">
                        <p>BEEUM을 통해 <span>1028</span>번의 투어가 성사되었습니다.</p>
                        <p>지난 일주일간 <span>32</span>번의 투어가 이루어졌습니다.</p>
                        </div>
                    </div>
                </div><!-- //#NumTourBox end -->
            </div><!-- //#mainFirstLine end -->
            <br/>
            <div id="mainSecondLine">
                <h3>BEEUM의 로컬들 (Bees)</h3>
                <div id="beeumLocals">
                    <a href="/searchTraveler.jsp" class="box_bees_intro">
                        <p class="bee_names">Tour Bee</p>
                        <div class="bee_contents">
                            <p>한국의 로컬들과 알찬 여행을 떠나려는 우리의 Tour Bee!</p>
                            <div class="bee_icon">
                            <img src="/img/bee_tourBee%20.png" width="130">
                            </div><!-- //.bee_icon end -->
                        </div><!-- //.bee_contents end -->
                    </a><!-- //.box_bees_intro end -->
                    <a href="/searchLocal.jsp" class="box_bees_intro">
                        <p class="bee_names">Ko Bee</p>
                        <div class="bee_contents">
                            <p>한국어로 투어를 함께 할 멋진 우리의 Ko Bee!</p>
                            <div class="bee_icon">
                            <img src="/img/bee_koBee%20.png" width="130">
                            </div><!-- //.bee_icon end -->
                        </div><!-- //.bee_contents end -->
                    </a><!-- //.box_bees_intro end -->
                    <a href="/searchLocal.jsp" class="box_bees_intro">
                        <p class="bee_names">Honey Bee</p>
                        <div class="bee_contents">
                            <p>각 나라의 언어로 여행자들과 행복한 여행을 보장할 우리의 Honey Bee!</p>
                            <div class="bee_icon">
                            <img src="/img/bee_honeyBee.png" width="130">
                            </div><!-- //.bee_icon end -->
                        </div><!-- //.bee_contents end -->
                    </a><!-- //.box_bees_intro end -->
                    <a href="/searchLocal.jsp" class="box_bees_intro">
                        <p class="bee_names">Bumble Bee</p>
                        <div class="bee_contents">
                            <p>수많은 가이드 경험과 노하우로 각 지역 로컬을 꿰고있는 우리의 Bumble Bee!</p>
                            <div class="bee_icon">
                            <img src="/img/bee_bumbleBee.png" width="130">
                            </div><!-- //.bee_icon end -->
                        </div><!-- //.bee_contents end -->
                    </a><!-- //.box_bees_intro end -->
                    <a href="/searchLocal.jsp" class="box_bees_intro">
                        <p class="bee_names">Wasp</p>
                        <div class="bee_contents">
                            <p>전문 관광 자격을 갖추고 더욱 섬세한 투어를 책임질 우리의 Wasp!</p>
                            <div class="bee_icon">
                            <img src="/img/bee_wasp%20.png" width="130">
                            </div><!-- //.bee_icon end -->
                        </div><!-- //.bee_contents end -->
                    </a><!-- //.box_bees_intro end -->
                </div><!-- //#beeumLocals end -->
            </div><!-- //#mainSecondLine end -->
            <br/>
            <div id="mainThirdLine">
                <h3>테마별 투어</h3>
                <div class="theme_box">
                    <div class="box_theme_text" id="textOne">
                    <a href="/searchTour.jsp?theme=L" class="box_theme_link">로컬 투어</a>
                        <div class="box_theme_cover">
                            
                        </div><!-- //.box_theme_cover end -->
                    </div><!-- //.box_theme_text end -->
                </div><!-- //.theme_box end -->
                <div class="theme_box">
                    <div class="box_theme_text" id="textTwo">
                     <a href="/searchTour.jsp?theme=H" class="box_theme_link">역사 투어</a>
                        <div class="box_theme_cover">
                            
                        </div><!-- //.box_theme_cover end -->
                    </div><!-- //.box_theme_text end -->
                </div><!-- //.theme_box end -->
                <div class="theme_box">
                    <div class="box_theme_text" id="textThree">
                    <a href="/searchTour.jsp?theme=E" class="box_theme_link">체험 투어</a>
                        <div class="box_theme_cover">
                            
                        </div><!-- //.box_theme_cover end -->
                    </div><!-- //.box_theme_text end -->
                </div><!-- //.theme_box end -->
                <div class="theme_box">                    
                	<div class="box_theme_text" id="textFour">
                    <a href="/searchTour.jsp?theme=S" class="box_theme_link">쇼핑 투어</a>
                        <div class="box_theme_cover">
                            
                        </div><!-- //.box_theme_cover end -->
                    </div><!-- //.box_theme_text end -->
                </div><!-- //.theme_box end -->
                <div class="theme_box">
                    <div class="box_theme_text" id="textFive">
                    <a href="/searchTour.jsp?theme=N" class="box_theme_link">자연 투어</a>
                        <div class="box_theme_cover">
                            
                        </div><!-- //.box_theme_cover end -->
                    </div><!-- //.box_theme_text end -->
                </div><!-- //.theme_box end -->
                <div class="theme_box">
                    <div class="box_theme_text" id="textSix">
                    <a href="/searchTour.jsp?theme=P" class="box_theme_link">레포츠 투어</a>
                        <div class="box_theme_cover">
                            
                        </div><!-- //.box_theme_cover end -->
                    </div><!-- //.box_theme_text end -->
                </div><!-- //.theme_box end -->
            </div><!-- //#mainThirdLine end -->
        </div><!-- //#content end -->
    </div><!--content_wrap-->

<%@ include file="/WEB-INF/template/footer.jsp" %>

    <script src="/js/jquery.js"></script>
    <script src="/js/tui-code-snippet.min.js"></script>
    <script src="/js/tui-time-picker.min.js"></script>
    <script src="/js/tui-date-picker.min.js"></script>
    <script src="/js/jquery.dropdown.js"></script>
    <script src="/js/fix-footer.js"></script>
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

            $(".navigator").css("right",right-90); 
        }

        setFixedPosition();

        ///////////////////////////

        $(".search_tab li").on("click", function (e) {

            e.preventDefault();

            $(".on").removeClass("on");//기존의 on class를 제거

            var $this = $(this);

            $this.addClass("on");//우리가 클릭한 그 li에 on class를 추가

            var idx = $this.index();//클릭한 그 li의 index를 가져온다.

            // $(".search_tab li").eq(idx).attr({"background-color":"black","color":"white"});

            $(".tab").eq(idx).addClass("on");

        });///search_tab li click() end

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

        $('.fa-minus').click(function () {
            var value = $('#giveNumCount').val()-1;
            $('#giveNumCount').val(value);

        });

        $('.fa-plus').click(function () {
            var value = $('#giveNumCount').val()-(-1);
            $('#giveNumCount').val(value);

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
            }

        });/*$('.find_regions').dropdown() end*/

        $('.find_theme').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: 20,

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
            }

        });/*$('.find_theme').dropdown() end*/


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



    </script>
</body>
</html>