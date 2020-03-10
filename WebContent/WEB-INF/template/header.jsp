<%@page import="com.beeum.beeum.dao.UsersDAO"%>
<%@page import="java.util.function.Function"%>
<%@page import="com.beeum.beeum.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

User loginUser = (User)session.getAttribute("loginUser");
Integer potoFlag = null;
int potono = 0;
if(loginUser!=null){
	potono =  loginUser.getNoUser();	
}
potoFlag = (Integer)session.getAttribute("potoFlag");
int poto = 0;
if(potoFlag!=null){
	poto = potoFlag;
}


%>    
<div id="findPwdPopup" class="full">
    <div id="findPwdForm">
        <div class="cancel_find_pwd">
            <button id="cancelFindPwd"><i class="far fa-times-circle"></i></button>
        </div><!-- //.cancel_find_pwd end -->
        <div id="findPwdTitle">
            <h1>비밀번호 찾기</h1>
        </div><!-- //#findPwdTitle end -->
        <div id="findPwdTermsWrapper">
            <div><h2 class="find_pwd_terms_text">가입시 입력한 <span class="specification">이메일</span>을 입력하세요.</h2></div>
            <div><h2 class="find_pwd_terms_text">비밀번호 <span class="specification">재설정 링크</span>를 보내드립니다.</h2></div>
        </div><!--termsWrapper end-->
        <form>
            <div>
                <label>
                    <h2 class="find_pwd_label">이메일*</h2>
                    <div id="findPwdInput">
                        <input class="find_pwd_input" type="text"
                               placeholder=" 이메일 입력(힌트:본인의 메인 이메일)"/>
                    </div><!-- //#findPwdInput end -->
                </label>
            </div>
            <button class="find_pwd_button">확인</button>
        </form>
    </div><!-- //#findPwdForm end -->
</div><!-- //#findPwdPopup end -->

<form action="/login.jsp" method="post">
<div id="logInPopup" class="full">
    <div id="logInForm">
        <div class="cancel_login">
            <button id="cancelLogin"><i class="far fa-times-circle"></i></button>
        </div><!-- //.cancel_login end -->
        <div id="logInTitle">
            <h1>로그인</h1>
        </div><!-- //#logInTitle end -->
        <div>
            <label>
                <h2 class="logInEmail_label">이메일*</h2>
                <div id="logInEmailInput">
                    <input name="email" class="logInEmail_input" type="text"
                           placeholder=" 이메일 입력"/>
                </div><!-- //#logInEmailInput end -->
            </label>
        </div>
        <div>
            <label>
                <h2 class= "login_pwd_label">비밀번호*</h2>
                <div id="loginPwdInput">
                    <input name="password" class="login_pwd_input" type="password"
                           placeholder=" 비밀번호 입력"/>
                </div><!-- //#loginPwdInput end -->
            </label>
        </div>
        <div id="findPwdWrapper"><a class="beeum" href="#">비밀번호찾기</a></div>
        <button class="login_button">로그인</button>
        <div id="toRegister">
            <h3>아직비움회원이 아니라구요? <a class="beeum" href="#">회원가입</a></h3>
        </div><!-- //#toRegister end -->
    </div><!-- //#logInForm end -->
</div><!-- //#logInPopup end -->
</form>
<form action="registerUser.jsp" method="post">
<div id="registerPopup" class="full">
    <div id="registerForm">
        <div class="cancel">
            <button id="cancel"><i class="far fa-times-circle"></i></button>
        </div><!-- //.cancel end -->
        <div id="registerFormTitle">
            <h1>회원가입을 통해 원하는 한국여행을 시작해보세요!</h1>
        </div><!-- //#registerFormTitle end -->

        <div class="regiform_size" id="registerTerms">
            <label class="lbl_agree">
                <strong class="agreement">BEEUM의 <a class="beeum" href="#">이용약관</a>, <a class="beeum" href="#">개인정보</a>
                    취급방침에 다음과 같이 동의합니다.<span>(필수)</span></strong>
                <input class="agree_check" type="checkbox"/>
                <i class="unchecked far fa-check-circle"></i>
                <i class="checked fas fa-check-circle"></i>
            </label>
        </div><!-- //#registerTerms end -->
        <div>
            <label>
                <h2 class="name_label">이름*</h2>
                <div id="nameInput">
                    <input name="name" class="name_input" type="text" placeholder=" 이름을 입력(ex. 김 현수, Hyunsoo Kim) "/>
                </div><!-- //#nameInput end -->
            </label>
        </div>
        <div>
            <label>
                <h2 class="email_label">이메일*</h2>
                <div id="emailInput">
                    <input name="email" class="email_input" type="text"
                           placeholder=" 이메일을 반드시 형식에 맞춰 입력(ex. keepthecrown@gmail.com) "/>
                </div><!-- //#emailInput end -->
            </label>
        </div>
        <div id="pwdWrapper">
            <div>
                <label>
                    <h2 class="pwd_labelone">비밀번호*</h2>
                    <div id="pwdInput">
                        <input name="password" class="pwd_inputone" type="password"
                               placeholder=" 비밀번호 설정(8자 이상)"/>
                    </div><!-- //#pwdInput end -->
                </label>
            </div>
            <div>
                <label>
                    <h2 class="pwd_labeltwo">비밀번호 확인*</h2>
                    <div id="pwdConfirm">
                        <input class="pwd_inputtwo" type="password"
                               placeholder=" 설정한 비밀번호 재입력"/>
                    </div><!-- //#pwdConfirm end -->
                </label>
            </div>
        </div><!-- //#pwdWrapper end -->
        <button class="register_button" type="submit">가입하기</button>
        <div id="toLogIn">
            <h3>이미 아이디가 있으시다구요? 바로 <a class="beeum" href="#">로그인</a>해서 이용하세요!</h3>
        </div><!-- //#toLogIn -->
    </div><!-- //#registerForm end -->
</div><!-- //#registerPopup end -->
</form>

<div class="wrapper">

    <div class="head_wrap" id="headWrap">
        <div class="header">
            <div class="header_content">
                <div class="logo slogan"><a href="/index.jsp">
                    <h1><img src="/img/beeum.PNG" width="200"/></h1>
                    <h2 class="slogan_text">"between you and me"</h2></a>
                </div><!-- //.slogan end -->
                <div class="header_left">
                    <a class="top left underline" href="/searchTour.jsp">투어 찾기</a>
                    <a class="top left underline" href="/searchLocal.jsp">로컬 찾기</a>
                    <a class="top left underline" href="/searchTraveler.jsp">여행 요청</a>
                    <a class="top left underline" href="/review.jsp">후기</a>
                </div><!-- //.header_left end -->
                <section id="keyword-search-component" class="active">
                    <a class="search top right keyword-search-icon" href="#"><i class="fas fa-search"></i></a>
                    <form class="keyword-search-form" action="/browse.jsp">
                        <input type="text" class="input_search keyword-search-input" name="q"
                               placeholder=" 관심사를 입력하세요." autocomplete="off">
                        <a class="close" href="#"><i class="far fa-times-circle"></i></a>
                    </form>
                </section>
                
                <% if(loginUser==null) { %>
                <div class="header_right">
                    <a id="login" class="top right underline" href="">로그인</a>
                    <a id="register" class="top right underline" href="">회원가입</a>
                </div><!-- //.header_right end -->
				<%
					} else {
				%>
                <div id="header_rightBox">
                    <div id="messageBox"><a href="/userInfo.jsp?noUser=<%=loginUser.getNoUser()%>"><i class="far fa-envelope"></a></i></div>
                    <div id="profileBox">
                    	<% if (poto==1) { %>
                        <img id="profileImgBox" src="img/DSC04353.JPG"/>
                        <%} else if(potono==2){%>
                        <img id="profileImgBox" src="img/profileImage_2.jpg"/>	
                       	<%}else { %>
                        <img id="profileImgBox" src="img/default.jpg"/>
                        <%} %>
                        <%-- 여기다 동현아 번호 잘바꾸자! --%>
                        <%System.out.println(loginUser.getName()); %>
                        <%-- 예빈님 2를 아에 지워주세요!!!! --%>
                        <span id="name"><a href="/userInfo.jsp?noUser=<%=loginUser.getNoUser()%>"><%=loginUser.getName() %> 님</a></span>
                    </div><!-- //#profileBox -->
                    <div id="userLogOut"><a href="/logout.jsp">로그아웃</a></div>
                </div><!-- //#header_rightBox end -->
                <%  } %>
                <select class="language">
                    <option>한국어</option>
                    <option>English</option>
                </select>
            </div><!-- //.header_content end -->
        </div><!-- //.header end -->
    </div><!-- //.head_wrap end -->
  <% if(loginUser==null) { %>  
	<script>
	
		document.querySelector("#login").addEventListener("click",function(e) {
			e.preventDefault();
		},false);    
		
		document.querySelector("#register").addEventListener("click",function(e) {
			e.preventDefault();
		},false);  
		
	</script>
<%} %>
    