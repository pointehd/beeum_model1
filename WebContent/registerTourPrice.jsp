<%@page import="com.beeum.beeum.dao.CourseCategoriesDAO"%>
<%@page import="com.beeum.beeum.vo.Course"%>
<%@page import="com.beeum.beeum.vo.CourseCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noUser = request.getParameter("noUser");

	/* registerTourBasic */
	String title = request.getParameter("title");
	String gender = request.getParameter("gender");
	String[] language = request.getParameterValues("language");
	String thema = request.getParameter("thema");
	String startTime =request.getParameter("startTime");
	String lastTime =request.getParameter("lastTime");
	String[] tourIntroPic = request.getParameterValues("tourIntroPic");
	String tourIntroductionText = request.getParameter("tourIntroductionText");
	String[] region = request.getParameterValues("region");
	String meetPlaceName = request.getParameter("meetPlaceName");
	String lng = request.getParameter("lng");
	String lat = request.getParameter("lat");
	String[] meetPlaPic = request.getParameterValues("meetPlaPic");

	
	/* registerTourCourse */
	
	
	String[] courseTitle = request.getParameterValues("courseTitle");
	String[] category = request.getParameterValues("category");
	String[] categoryDetail = request.getParameterValues("categoryDetail");
	String[] hour = request.getParameterValues("hour");
	String[] min = request.getParameterValues("min");
	String[] tourText = request.getParameterValues("tourText");
	String totalDay = request.getParameter("totalDay");
	String totalHour = request.getParameter("totalHour");
	String totalMin = request.getParameter("totalMin");
 	String[] coursePic = request.getParameterValues("coursePic"); //  사진은 하나로 넘어옴
 	
 	for(int i = 0; i < coursePic.length; i++){
 		System.out.println(coursePic[i]);
	}

 	
	/* 

	for(int i=0;i<category.length;i++){
		System.out.println(category[i]);
	}
		System.out.println("코스사진:"+ coursePic);
	for(int i=0;i<courseTitle.length;i++){
	System.out.println("코스타이틀:"+courseTitle[i]);
	} 
	for(int i=0;i<categoryDetail.length;i++){
		System.out.println("코스테마:"+categoryDetail[i]);
	}
	for(int i=0;i<hour.length;i++){
		System.out.println("코스시간:"+hour[i]);
	}
	for(int i=0;i<min.length;i++){
		System.out.println("코스분:"+min[i]);
	}

	for(int i=0;i<tourText.length;i++){
		System.out.println(tourText[i]);
	}
	System.out.println(totalDay);
	System.out.println(totalHour);
	System.out.println(totalMin);

	*/
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>registerTourPrice</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>


    h3 {
        font-size: 40px;
        line-height: 50px;
    }
    
    h4 {
        font-size: 20px;
        line-height: 40px;
        font-weight: bold;
    }

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

    #simplePrice {
        width: 1000px;
        min-height: 40px;
        /*background: lemonchiffon;*/
        margin-top: 20px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }
    
    #simplePriceInfo {
        width: 200px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }

    #simplePriceExplain {
        width: 960px;
        min-height: 10px;
        margin-left: 20px;
        /*background: yellowgreen;*/
    }
    
    .PriceExplainPlace {
        width: 960px;
        height: 40px;
        /*background: red;*/
        position: relative;
        margin-bottom: 10px;
    }
    
    .simple_price_box {
        width: 225px;
        height: 40px;
        /*background: #4AB1E9;*/
        text-align: center;
        line-height: 40px;
        position: absolute;
        border: 1px solid lightgray;
        border-radius: 10px;
    }
    
    .simpleCategory {
        left:0;
        top:0;
    }
    
    .simpleMinNum {
        left: 245px;
        top:0;
    }
    
    .simpleMaxNum {
        left: 490px;
        top:0;
    }
    
    .simplePerPrice {
        right:0;
        top:0;
    }

    .add_price_button {
        width: 960px;
        height: 40px;
        background: #aaaaaa;
        margin-left: 20px;
        margin-bottom: 10px;
        margin-top: 10px;
        border: 1px solid ligthgray;
        text-align: center;
        line-height: 40px;
        font-size: 20px;
        font-weight: bold;
   }

    .add_price_button:hover {
        background: #FAE100;
        cursor: pointer;
    }
    
    #includePrice, #excludePrice {
        width: 1000px;
        min-height: 100px;
        /*background: palevioletred;*/
        margin-top: 20px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }
    
    #includePriceInfo, #excludePriceInfo {
        width: 200px;
        height: 40px;
        /*background: indianred;*/
        margin-left: 20px;
    }
    
    .includePriceElement, .excludePriceElement {
        width: 960px;
        height: 40px;
        /*background: skyblue;*/
        margin-left: 20px;
        position: relative;
        margin-bottom: 10px;
        /*border: 1px solid #424242;*/
    }
    
    .includePriceText, .excludePriceText {
        width: 910px;
        height: 40px;
        /*background: cornflowerblue;*/
    }
    
    .include_price_delete_button, .exclude_price_delete_button {
        width: 40px;
        height: 40px;
        background: #aaaaaa;
        border: none;
        border-radius: 40px;
        position: absolute;
        right: 5px;
        top: 0px;
        font-size: 30px;
        line-height: 18px;
        text-align: center;
        outline: none;
    }
    
    .include_price_delete_button:hover, .exclude_price_delete_button:hover {
        background: #FAE100;
        cursor: pointer;
    }

    #nextButton, #prevButton {
        width: 100px;
        height: 50px;
        font-size: 20px;
        border: 1px solid lightgray;
        border-radius: 10px;
        font-weight: bold;
        margin-top: 20px;
        /*margin-left: 450px;*/
        margin-bottom: 20px;
        position: relative;
        left: 793px;
        background: white;
    }
    
    #nextButton:hover, #prevButton:hover {
        background: gold;
        cursor: pointer;
    }
    
    .input_css {
        width: 220px;
        height: 35px;
        font-size:15px;
        text-align: center;
        border: none;
    }
    
    .input_css_long_2 {
        width: 905px;
        height: 35px;
        font-size:15px;
        text-align: center;
        border: 1px solid lightgray;
        border-radius: 10px;
    }

</style>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div class="content_wrap">
        <div class="content">
		<div id="tutorialTitle"><h3>투어등록</h3></div><!--//title end -->
            <div id="background1080">
                <div class="contents">
                    <div id="tutorial">
                        <div id="tutorialInfo">
                            <div class="tutorial_box">기본 정보</div>
                            <div class="border" id="borderPosition1"></div>
                            <div class="tutorial_box">코스 정보</div>
                            <div class="border" id="borderPosition2"></div>
                            <div class="tutorial_box" id="tutorialSelect">가격 정보</div>
                            <div class="border" id="borderPosition3"></div>
                            <div class="tutorial_box">필수 안내</div>
                        </div><!--//tutorialInfo end -->
                    </div><!--//tutorial end -->

                    <form action="/registerTourGuidance.jsp" id="thirdForm">
                    	<input type="hidden" name="noUser" value="<%=noUser %>"/>
	                    	
                   		<input type="hidden" name="title" value="<%=title %>"/>
                    	<input type="hidden" name="gender" value="<%=gender %>"/>
                    	<%for(int i = 0; i < language.length; i++){%>
                    	<input type="hidden" name="language" value="<%=language[i] %>"/>
                    	<%}%>
                    	<input type="hidden" name="thema" value="<%=thema %>"/>
                    	<input type="hidden" name="startTime" value="<%=startTime %>"/>
                    	<input type="hidden" name="lastTime" value="<%=lastTime %>"/>
                    	<%for(int i = 0; i < tourIntroPic.length; i++){%>
                    	<input type="hidden" name="tourIntroPic" value="<%=tourIntroPic[i] %>"/>
                    	<%}%>
                    	<input type="hidden" name="tourIntroductionText" value="<%=tourIntroductionText %>"/>
         		            <%for(int i = 0; i < region.length; i++){%>
                    	<input type="hidden" name="region" value="<%=region[i] %>"/>
                    	<%}%>
                    	<input type="hidden" name="meetPlaceName" value="<%=meetPlaceName %>"/>
                    	<input type="hidden" name="lng" value="<%=lng %>"/>
                    	<input type="hidden" name="lat" value="<%=lat %>"/>
                    	<%for(int i = 0; i < meetPlaPic.length; i++){%>
                    	<input type="hidden" name="meetPlaPic" value="<%=meetPlaPic[i] %>"/>
                    	<%}%>
                    	
                    	<%for(int i = 0; i < courseTitle.length; i++){%>
                    	<input type="hidden" name="courseTitle" value="<%=courseTitle[i] %>"/>
                    	<%}%>
                    	<%for(int i = 0; i < category.length; i++){%>
                    	<input type="hidden" name="category" value="<%=category[i] %>"/>
                    	<%}%>
                    	<%for(int i = 0; i < categoryDetail.length; i++){%>
                    	<input type="hidden" name="categoryDetail" value="<%=categoryDetail[i] %>"/>
                    	<%}%>
                    	<%for(int i = 0; i < hour.length; i++){%>
                    	<input type="hidden" name="hour" value="<%=hour[i] %>"/>
                    	<%}%>
                    	<%for(int i = 0; i < min.length; i++){%>
                    	<input type="hidden" name="min" value="<%=min[i] %>"/>
                    	<%}%>
                    	<%for(int i = 0; i < tourText.length; i++){%>
                    	<input type="hidden" name="tourText" value="<%=tourText[i] %>"/>
                    	<%}%>
                    	<input type="hidden" name="totalDay" value="<%=totalDay %>"/>
                    	<input type="hidden" name="totalHour" value="<%=totalHour %>"/>
                    	<input type="hidden" name="totalMin" value="<%=totalMin %>"/>
                    	<%for(int i = 0; i < coursePic.length; i++){%>
                    	<input type="hidden" name="coursePic" value="<%=coursePic[i] %>"/>
                    	<%}%>

                        <div id="simplePrice">
                            <div id="simplePriceInfo"><h4>가격 설정</h4></div><!--//simplePriceInfo end-->

                            <div id="simplePriceExplain">
                                <div class="PriceExplainPlace">
                                    <div class="simple_price_box simpleCategory">구분</div>
                                    <div class="simple_price_box simpleMinNum">최소 인원</div>
                                    <div class="simple_price_box simpleMaxNum">최대 인원</div>
                                    <div class="simple_price_box simplePerPrice">1인당 가격(&#8361)</div>
                                </div>

                                <div class="PriceExplainPlace">
                                    <div class="simple_price_box simpleCategory">성인/청소년/어린이</div>
                                    <div class="simple_price_box simpleMinNum">
                                        <input type="number" name="adultMinNum" min="1" class="input_css"/>
                                    </div>
                                    <div class="simple_price_box simpleMaxNum">
                                        <input type="number" name="adultMaxNum" min="1" class="input_css"/>
                                    </div>
                                    <div class="simple_price_box simplePerPrice">
                                        <input type="number" name="adultPerPrice" min="0" class="input_css"/>
                                    </div>
                                </div>



                            </div><!--//simplePriceExplain end-->

                        </div><!--//simplePrice end-->



                        <div id="includePrice">
                            <div id="includePriceInfo"><h4>가격 포함 사항</h4></div>

                            <script type="text/template" id="includePriceTmpl">
                                <div class="includePriceElement">
                                    <div class="includePriceText">
                                        <input type="text" name="includePrice"  class="input_css_long_2"/>
                                    </div>
                                    <button type="button" class="include_price_delete_button"><i class="fas fa-times"></i></button>
                                </div><!--//includePriceElement end-->
                            </script>

                            <div id="addIncludePriceButton" class="add_price_button">항목 추가</div><!--//addCourse end-->

                        </div><!--//includePrice end-->


                        <div id="excludePrice">
                            <div id="excludePriceInfo"><h4>가격 미포함 사항</h4></div>

                            <script type="text/template" id="excludePriceTmpl">
                                <div class="excludePriceElement">
                                    <div class="excludePriceText">
                                        <input type="text" name="excludePrice"  class="input_css_long_2"/>
                                    </div>
                                    <button type="button" class="exclude_price_delete_button"><i class="fas fa-times"></i></button>
                                </div><!--//includePriceElement end-->
                            </script>

                            <div id="addExcludePriceButton" class="add_price_button">항목 추가</div><!--//addCourse end-->

                        </div><!--//includePrice end-->
                        
                        
                    <button type="button" id="prevButton">이전</button>
                    <button type="submit" id="nextButton">다음</button>

                    </form>


                </div><!--//contents -->



            </div><!--//background end -->




        </div>
    </div><!--content_wrap-->
<%@ include file="/WEB-INF/template/footer.jsp" %>
    <script src="/js/jquery.js"></script>
    <script src="/js/fix-footer.js"></script>
<script src="js/underscore-min.js"></script>
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
            var left = (wWidth-1050)/2;
            var right = (wWidth-1080)/2;

            // console.log(left);
            // console.log(right);

            $(".find_locals_filter_form").css("left",left);
            $(".navigator").css("right",right-72);

        };

        setFixedPosition();


        var includePriceTmp = _.template($("#includePriceTmpl").html());
        var excludePriceTmp = _.template($("#excludePriceTmpl").html());

        $("#includePriceInfo").after(includePriceTmp);
        $("#excludePriceInfo").after(excludePriceTmp);


        // 제대로 동작안함! -_-*
        // $(".detail_price_delete_button").click(function () {
        //     $(this).parent().parent().remove();
        //     alert($(this));
        // });

        // 제대로 동작함! ^_^
        $("body").on("click", ".detail_price_delete_button", function () {
            // alert($(".detailPriceSet").length);
            if($(".detailPriceSet").length == 1) {
                alert("최소 한 개 이상의 항목을 작성해야 합니다!");
                return;
            }
            $(this).parent().parent().remove();
        });

        //includePrice
        $("#addIncludePriceButton").click(function () {
            $("#addIncludePriceButton").before(includePriceTmp);
        });
        $("body").on("click", ".include_price_delete_button", function () {
            if($(".includePriceElement").length == 1) {
                alert("최소 한 개 이상의 항목을 작성해야 합니다!");
                return;
            }
            $(this).parent().remove();
        });

        //excludePrice
        $("#addExcludePriceButton").click(function () {
            $("#addExcludePriceButton").before(excludePriceTmp);
        });
        $("body").on("click", ".exclude_price_delete_button", function () {
            if($(".excludePriceElement").length == 1) {
                alert("최소 한 개 이상의 항목을 작성해야 합니다!");
                return;
            }
            $(this).parent().remove();
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

        
        $("#prevButton").click(function() {

        	location.href = "/registerTourCourse.jsp";
		});

    </script>
</body>
</html>    
        