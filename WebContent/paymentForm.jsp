<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noTour = request.getParameter("noTour");
	String[] giveNumAge = request.getParameterValues("giveNumAge");
	String[] giveNumGender = request.getParameterValues("giveNumGender");
	String[] giveNumCount = request.getParameterValues("giveNumCount");
	String tourPrice = request.getParameter("tourPrice"); 
	String cityName = request.getParameter("cityName");
	String titleTour = request.getParameter("titleTour");
	String picS = request.getParameter("picS");
	String meetPoint = request.getParameter("meetPoint");

		
	System.out.println(noTour);
	for(int i = 0; i<giveNumAge.length;i++){
		System.out.println(giveNumAge[i]);
	}
	for(int i = 0; i<giveNumGender.length;i++){
		System.out.println(giveNumGender[i]);
	}
	int countNum=0;
	for(int i = 0; i<giveNumCount.length;i++){
		countNum += Integer.parseInt(giveNumCount[i]);
	}
	System.out.println(tourPrice);
	System.out.println(cityName);
	System.out.println(titleTour);
	System.out.println(picS);
	System.out.println(meetPoint);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>paymentForm</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>

    /*/////////////////*/

    html {
        overflow-y: scroll;
    }

    #content {
        width: 1080px;
        min-height: 10px;
        /*background-color: #ECEFF1;*/
        margin: auto;
        position: relative;
        overflow: hidden;
        padding-bottom: 20px;
        /*border: 1px solid #FFEE58;*/
        /*border-right: 1px solid #FFEE58;*/
    }

    #content h3 {
        text-indent: 92px;
        font-weight: bold;
        font-size: 30px;
        margin: 20px;
    }
    #wrap {
        position: relative;
        width: 1080px;
    }
    .box_payment {
        float: left;
        width: 500px;
        min-height: 10px;
        position: relative;
    }

    #boxPayment1 {
        width: 400px;
        min-height: 500px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        position: relative;
        left: 92px;
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }

    #tourPhoto {
        height: 100px;
        border-bottom: 1px solid lightgray;
        line-height: 100px;
        /*text-indent: 10px;*/
    }

    #tourPic {
        background-position: center;
        background-size: contain;
        border-radius: 10px 10px 0px 0px;
        width: 400px;
        height: 100px;
        /*opacity: .7;*/
    }

    #locTourPeriod, #tourTitle {
        margin: 10px auto;
        height: 30px;
        border-bottom: 1px solid lightgray;
        text-indent: 10px;
    }
    #beeIntro {
        height: 110px;
        border-bottom: 1px solid lightgray;
        position: relative;
        /*float: left;*/
        overflow: hidden;
    }

    #beePhoto {
        width: 100px;
        height: 100px;
        border: 1px solid lightgray;
        position: absolute;
        left: 5px;
        line-height: 100px;
        text-align: center;
    }

    #beePic {
        width: 100px;
        height: 100px;
        background-size: contain;
    }

    #beeRight {
        width: 250px;
        height: 100px;
    }

    #beesIcon {
        position: absolute;
        right: 10px;
    }

    .bee_icon {
        width: 50px;
        height: 50px;
        /*border: 1px solid #424242;*/
        float: left;
        margin: 2px;
        text-align: center;
        line-height: 50px;

    }

    #beeName {
        border: 1px solid transparent;
        height: 38px;
        line-height: 38px;
        position: absolute;
        left: 117px;
        bottom: 8px;
        padding: 0 5px;
    }

    #selectedDate {
        border-bottom: 1px solid lightgray;
        margin: 10px auto;
        height: 60px;
        line-height: 1.5em;
        text-indent: 10px;
    }

    #touristNum {
        min-height: 80px;
        line-height: 1.5em;
        border-bottom: 1px solid lightgray;
        margin: 10px auto;
        overflow: hidden;
        padding-bottom: 10px;
    }

    #touristNumTitle {
        text-indent: 10px;
    }

    .tourist_detail {
        border: 1px solid lightgray;
        border-radius: 30px;
        float: left;
        padding: 3px 5px;
        margin: 3px 12px ;
        height: 20px;
        line-height: 20px;
        text-align: center;
    }

    #discountBox {
        border-bottom: 1px solid lightgray;
        height: 130px;
        line-height: 1.5em;
        text-indent: 10px;
    }


    #honeyJarInfo {
        position: relative;
    }

    #honeyJar {
        width: 55px;
        border: none;
        border-bottom: 1px solid lightgray;
        outline: none;
        background: transparent;
    }

    #honeyJarPrice {
        border-radius: 5px;
        padding: 5px;
        font-size: 10px;
        width: 65px;
        height: 16px;
        line-height: 16px;
        text-align: center;
        text-indent: 0px;
        position: absolute;
        left: 140px;
        top: -8px;
        color: #FFFFFF;
        background-color: #000;
        display: none;
    }

    #honeyJarPrice::before {
        content: "";
        display: block;
        width: 0;
        height: 0;
        position: absolute;
        border-top: 7px solid transparent;
        border-right: 7px solid #000;
        border-bottom: 7px solid transparent;
        top: 6px;
        left: -7px;
        background: transparent;
    }

    #useAllBtn {
        display: inline-block;
        margin-left: 20px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        background: #FAE100;
        padding: 3px;
        transition: .3s ease;
        font-weight: bold;
        font-family: 'Nanum Gothic Coding', monospace;
    }
    
    #useAllBtn:hover {
    	transform: scale(1.05);
    }

    #totalPriceBox {
        /* border-bottom: 1px solid lightgray; */
        height: 80px;
        line-height: 1.5em;
        text-indent: 10px;
        margin: 10px auto 0 auto;
    }

    .prices {
        float: left;
        width: 110px;
        text-align: right;
    }

    #detailLook {
        text-align: center;
        width:400px;
        background: transparent;
        border: none;
        outline: none;
        cursor: pointer;
        display: block;
        font-size: 15px;
        height: 30px;
        margin-bottom: 10px;
        border-bottom: 1px solid lightgray;
    }

    #detailLook:hover {
        font-weight: bold;
        /*background: #00B0FF;*/
    }

    #detailPriceBox {
        min-height: 108px;
        line-height: 1.5em;
        text-indent: 10px;
        padding-bottom: 20px;
        display: none;
    }

    .detail.open #detailPriceBox {
        display: block;
        /* detail class를 가진 요소가 open클래스를 가졌을 때(클래스 선택자 간 띄어쓰기 주의)
           id가 detailPriceBox를 가진 요소가 보이게 display block으로 설정! */
    }

    .detail.open .down {
        display: none;
        /* detail class가 open class 상태일 때 아래 화살표가 보이지 않게 한다. */
    }

    .detail .down {
        display: inline;
        /* detail class가 open class가 주어져있지 않을 때 즉, 닫혀있을 때 아래 화살표가 보이게 한다. */
    }

    .detail.open .up {
        display: inline;
        /* detail class가 open class를 가졌을 때 위쪽 화살표를 보여준다. */
    }

    .detail .up {
        display: none;
        /* detail class를 가진 요소가 open class를 가진 상태가 아닐 때 위쪽 화살표를 보이지 않게 한다. */
    }

    #boxPayment2 {
        width: 400px;
        min-height: 600px;
        border: 1px solid #FAE100;
        border-radius: 10px;
        position: absolute;
        right: 92px;
        box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    }

    #reserveInfo {
        border-bottom: 1px solid lightgray;
        margin: 10px auto;
        height: 140px;
        line-height: 1.5em;
        text-indent: 10px;
    }

    .reserve_info {
        border: none;
        border-bottom: 1px solid lightgray;
        text-indent: 5px;
        outline: none;
        background: transparent;
    }

    #paymentInfo {
        border-bottom: 1px solid lightgray;
        margin: 10px auto;
        height: 180px;
        line-height: 1.5em;
        text-indent: 10px;
    }

    #termsBox {
        border-bottom: 1px solid #FAE100;
        /*margin: 10px auto;*/
        text-indent: 10px;
        line-height: 1.5em;
        height: 327px;
    }

    #terms {
        border: 1px solid lightgray;
        border-radius: 10px;
        width: 350px;
        height: 200px;
        padding: 10px;
        margin: 10px auto;
    }

    #checkBox {
        display: none;
    }

    #agreeCheck .fas2 {
        display: none;
    }

    #agreeCheck.checked2 .fas2 {
        display: inline;
    }
    #agreeCheck .fas2 {
        display: none;
    }
    #agreeCheck.checked2 .far2 {
        display: none;
    }
    #agreeCheck .far2 {
        display: inline;
    }


    #cancel2, #pay {
/*         width: 198px;
        height: 20px; */
        text-align: center;
        padding: 10px 0;
        line-height: 20px;
        border-radius: 10px;
    	border: 1px solid #FAE100;
    	position: relative;
    	font-family: 'Nanum Gothic Coding', monospace;
    	transition: .3s ease;
    }

    #cancel2 {
        border-right: 1px solid #FAE100;
        background-color: #white;
        width: 198px;
        height:18px;
    }
    
    #pay {
    	background-color: #FAE100;
    	width: 198px;
        height:18px;
    }

    .last_btn {
        float: left;
    	font-weight: bold;
    }

    .last_btn:hover {
        font-weight: bold;
    }

    #cancelBtn {
        text-decoration: none;
        color: black;
        text-align: center;
    }

    #payBtn {
        background: transparent;
        border: none;
        font-size: 16px;
        line-height: 20px;
        outline: none;
    }

    #payBtn:hover {
        font-weight: bold;
    }

</style>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div class="content_wrap">
        <div id="content">
            <h3>결제 페이지</h3>
            <form method="post" action="/receivePaymentFormData.jsp">
            <fieldset>
            <legend class="screen_out">결제-폼</legend>
            <div id="wrap">
            	<input type="hidden" name="noUser" value="<%=loginUser.getNoUser() %>"/>
            	<input type="hidden" name="noTour" value="<%=noTour %>"/>
                <div id="boxPayment1" class="box_payment">
                    <div id="tourPhoto"><img id="tourPic" src="<%=picS %>" alt="medicine lake"></div>
                    <div id="locTourPeriod"><%=cityName%>·로컬투어</div>
                    <div id="tourTitle"><%=titleTour%></div>
                    <div id="beeIntro">
                        <div id="beePhoto"><img id="beePic" src="img/<%=loginUser.getFileName() %>" alt="selfie">bee 사진</div>
                        <div id="beeRight">
                            <div id="beesIcon">
                    			<div class="bee_icon">
                        			<img src="/img/bee_tourBee%20.png" width="40" height="40"/>
                    			</div>
                    			<div class="bee_icon">
                        			<img src="/img/bee_koBee%20.png" width="40" height="40"/>
                    			</div>
                   			    <div class="bee_icon">
                        			<img src="/img/bee_honeyBee.png" width="40" height="40"/>
                    			</div>
                    			<div class="bee_icon">
                        			<img src="/img/bee_default.png" width="40" height="40"/>
                    			</div>
                    			<div class="bee_icon">
                        			<img src="/img/bee_default.png" width="40" height="40"/>
                    			</div>
                            </div><!-- //#beesIcon end -->
                            <div id="beeName"><%=loginUser.getName() %></div>
                        </div><!-- //#beeRight end -->
                    </div><!-- //#beeIntro end -->
                    <div id="selectedDate">
                        <div>선택된 날짜 및 시간</div>
                        <div>2018.12.21, 09:00 ~ 2018.12.25, 17:00</div>
                    </div><!-- //#selectedDate end -->
                    <div id="touristNum">
                        <div id="touristNumTitle">여행 인원(<span class="underline2"><%=loginUser.getName() %></span>님 포함 <span class="underline2"><%=countNum%></span>명)
                        </div><!-- //touristNumTitle end -->
                        <%for(int i=0; i<giveNumAge.length; i++) {%>
                        <div class="tourist_detail"><span><%=giveNumAge[i]%></span>대, <span><%=giveNumGender[i]%></span>, <span><%=giveNumCount[i]%></span>명</div>
						<%} %>
                    </div><!-- //#touristNum end -->
                    <div id="discountBox">
                        <div id="honeyJarInfo">
                            <div>꿀단지 할인 <i class="far fa-question-circle"></i></div>
                            <div id="honeyJarPrice">1개 = &#8361;1,500</div>
                        </div>
                        <div>보유 꿀단지 <span class="underline2">0</span>개</div>
                        <div><input id="honeyJar" type="number" name="numberHoney">개 사용 <button id="useAllBtn" type="button">전부사용</button></div>
                        <div>할인 금액</div>
                        <div>-&#8361;<span class="underline2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0</span></div>
                    </div><!-- //#discountBox end -->
                    <div id="totalPriceBox">
                        <div class="prices">
                            <div>총 금액 &#8361;</div>
                            <div>할인 금액 &#8361;</div>
                            <div>최종 금액 &#8361;</div>
                        </div>
                        <div class="prices">
                            <div><span class="underline2"><%=Integer.parseInt(tourPrice)*countNum %></span></div>
                            <div>-<span class="underline2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0</span></div>
                            <div><span class="underline2"><%=Integer.parseInt(tourPrice)*countNum %></span></div>
                        </div>
                    </div><!-- //#totalPriceBox end -->
<!--                     <div class="detail">
                        <button id="detailLook">자세히 보기
                            <i class="fas fa-angle-down down"></i>
                            <i class="fas fa-angle-up up"></i>
                        </button>
                        <div id="detailPriceBox">
                            <div class="prices">
                                <div>     성인=&#8361;</div>
                                <div>   청소년=&#8361;</div>
                                <div>     유아=&#8361;</div>
                                <div>     할인=&#8361;</div>
                                <div>최종 금액=&#8361;</div>
                            </div>
                            <div class="prices">
                                <div><span class="underline2">40,000</span></div>
                                <div><span class="underline2">30,000</span></div>
                                <div><span class="underline2">30,000</span></div>
                                <div>-<span class="underline2">20,000</span></div>
                                <div><span class="underline2">80,000</span></div>
                            </div>
                        </div>//#detailPriceBox end
                    </div>//.detail end -->
                </div><!-- //#box_payment1 end -->
                <div id="boxPayment2" class="box_payment">
                    <div id="reserveInfo">
                        <div>예약 정보</div>
                        <div>여행자 이름</div>
                        <div><input size="50" type="text" class="reserve_info" name="participant" placeholder="ex) Clara Zaina Bouhamou"></div>
                        <div>여행자 연락처</div>
                        <div><input size="50" type="text" class="reserve_info" name="phoneNum" placeholder="ex) 01012345678"></div>
                    </div>
                    <div id="paymentInfo">
                        <div>결제 정보</div>
                        <div><label><input type="radio" name="payment" value="신용카드 결제">신용카드 결제</label></div>
                        <div><label><input type="radio" name="payment" value="실시간 계좌이체">실시간 계좌이체</label></div>
                        <div><label><input type="radio" name="payment" value="무통장 입금">무통장 입금</label></div>
                        <div><label><input type="radio" name="payment" value="네이버 페이">네이버 페이</label></div>
                        <div><label><input type="radio" name="payment" value="카카오 페이">카카오 페이</label></div>
                        <div><label><input type="radio" name="payment" value="페이코 결제">페이코 결제</label></div>
                    </div>
                    <div id="termsBox">
                        <div>약관</div>
                        <div>여행자 약관(필수)</div>
                        <div id="terms">환불은 안됩니다. ㅋㅋㅋ</div>
                        <label>
                            <div id="agreeCheck">여행자 약관을 읽었으며, 동의합니다.
                                <input id="checkBox" type="checkbox">
                                <i class="far fa-check-circle far2"></i>
                                <i class="fas fa-check-circle fas2"></i>
                            </div>
                        </label>
                    </div><!-- //#termsBox end -->
                    <div>
                        <div id="cancel2" class="last_btn"><a id="cancelBtn" href="detailedTour.jsp">취소</a></div>
                        <div id="pay" class="last_btn"><button id="payBtn" type="submit">결제하기</button></div>
                    </div>
                </div><!-- //#box_payment2 end -->
            </div><!-- //#wrap end -->
            </fieldset>
            </form>
        </div><!-- //#content end -->
    </div><!--content_wrap-->
<%@ include file="/WEB-INF/template/footer.jsp" %>

    <script src="/js/jquery.js"></script>
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

            $(".find_locals_filter_form").css("left",left);
            $(".navigator").css("right",right-90); 
        }

        setFixedPosition();


        $(".fa-question-circle").hover(function () {
            $("#honeyJarPrice").toggle();
        })

        //id가 checkBox인 요소의 값이 바뀌었을 때
        $("#checkBox").change(function () {
            // alert("test");
            //id가 agreeCheck인 요소에 checked라는 class를 주었다 뺐다 한다.
            $("#agreeCheck").toggleClass("checked2")

        });//#checkBox change() end

        //idrk detailLook인 요소를 클릭했을 때
        $("#detailLook").click(function () {

            //class가 detail인 요소에 open class를 주었다 뺐다 한다.
            $(".detail").toggleClass("open");

        });//#detailLook click() end

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

        $("#payBtn").click(function () {
			//alert("회원가입을 진행해주세요!");
			//alert("깔깔깔! 마이페이지에서 프로필을 작성해주세요.");
			alert("짝짝짝! 결제가 완료되었습니다.");
			location.href="/userInfo3.jsp"
		})
        
    </script>
</body>
</html>        