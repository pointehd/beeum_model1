<%@page import="com.beeum.beeum.dao.MyAreaDAO"%>
<%@page import="com.beeum.beeum.vo.MyArea"%>
<%@page import="com.beeum.beeum.dao.ProfilesDAO"%>
<%@page import="com.beeum.beeum.vo.Profile"%>
<%@page import="com.beeum.beeum.dao.LanguagesDAO"%>
<%@page import="com.beeum.beeum.dao.AvalLangDAO"%>
<%@page import="com.beeum.beeum.vo.AvalLang"%>
<%@page import="com.beeum.beeum.vo.Contact"%>
<%@page import="com.beeum.beeum.dao.ContactsDAO"%>
<%@page import="com.beeum.beeum.vo.Language"%>
<%@page import="com.beeum.beeum.dao.LicenseDAO"%>
<%@page import="com.beeum.beeum.vo.License"%>
<%@page import="com.beeum.beeum.vo.ProfilePic"%>
<%@page import="com.beeum.beeum.dao.ProfilePicsDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.beeum.beeum.dao.CareersDAO"%>
<%@page import="com.beeum.beeum.vo.Career"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>updateProfileForm</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<style>
.profile_register_total_wrapper {
	position: relative;
	width: 1080px;
	min-height: 400px;
	/*background-color: #999999;*/
	margin: auto;
	padding-top: 10px;
	font-family: 'Nanum Gothic Coding', monospace;
}

.profile_register_title {
	position: relative;
	width: 500px;
	height: 50px;
	/*background-color: #EC407A;*/
	margin-left: 40px;
	margin-bottom: 10px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 35px;
	line-height: 50px;
	vertical-align: middle;
	font-weight: bold;
}

.return_my_profile {
	position: absolute;
	width: 500px;
	height: 50px;
	/*background-color: #00AAB4;*/
	margin-top: 10px;
	right: 0;
	top: 0;
	margin-right: 40px;
}

.profile_register_category {
	position: relative;
	width: 1000px;
	min-height: 100px;
	background-color: white;
	font-size: 20px;
	margin-top: 10px;
	margin-bottom: 20px;
	margin-left: 20px;
	border: 1px solid #FAE100;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.profile_input_wrapper {
	border: 2px solid transparent;
	width: 1040px;
	position: relative;
	margin-left: 20px;
	overflow: hidden;
}

.profile_register_category_title {
	width: 960px;
	position: relative;
	min-height: 34px;
	/*background-color: #E0E0E0;*/
	font-family: 'Nanum Gothic Coding', monospace;
	margin-left: 20px;
	margin-top: 5px;
	line-height: 34px;
	font-weight: bold;
	vertical-align: middle;
}

.additional_explanation {
	font-size: 16px;
	font-family: 'Nanum Gothic Coding', monospace;
}

.avail_language {
	display: none;
	cursor: pointer;
}

.user_language {
	margin-left: 13px;
	border-radius: 10px;
	position: relative;
	top: 10px;
	padding: 5px 12px;
	font-size: 20px;
	font-family: 'Nanum Gothic Coding', monospace;
	cursor: pointer;
}

.korean {
	border: 2px solid #00C853;
	color: #00C853;
}

.korean:hover {
	transition: 0.3s ease;
	background-color: #00C853;
	color: #FFFFFF;
}

.korean.checkeded {
	background-color: #00C853;
	color: #FFFFFF;
	font-weight: bold;
}

.english.checkeded {
	background-color: #1E88E5;
	color: #FFFFFF;
	font-weight: bold;
}

.english:hover {
	transition: 0.3s ease;
	background-color: #1E88E5;
	color: #FFFFFF;
}

.english {
	border: 2px solid #1E88E5;
	color: #1E88E5;
}

.chinese {
	border: 2px solid #F44336;
	color: #F44336;
}

.chinese.checkeded {
	background-color: #F44336;
	color: #FFFFFF;
	font-weight: bold;
}

.chinese:hover {
	transition: 0.3s ease;
	background-color: #F44336;
	color: #FFFFFF;
}

.arabic {
	border: 2px solid #26A69A;
	color: #26A69A;
}

.arabic.checkeded {
	background-color: #26A69A;
	color: #FFFFFF;
	font-weight: bold;
}

.arabic:hover {
	transition: 0.3s ease;
	background-color: #26A69A;
	color: #FFFFFF;
}

.japanese {
	border: 2px solid #FF6E40;
	color: #FF6E40;
}

.japanese.checkeded {
	background-color: #FF6E40;
	color: #FFFFFF;
	font-weight: bold;
}

.japanese:hover {
	transition: 0.3s ease;
	background-color: #FF6E40;
	color: #FFFFFF;
}

.spanish {
	border: 2px solid #FFAB40;
	color: #FFAB40;
}

.spanish.checkeded {
	background-color: #FFAB40;
	color: #FFFFFF;
	font-weight: bold;
}

.spanish:hover {
	transition: 0.3s ease;
	background-color: #FFAB40;
	color: #FFFFFF;
}

.russian {
	border: 2px solid #303F9F;
	color: #303F9F;
}

.russian.checkeded {
	background-color: #303F9F;
	color: #FFFFFF;
	font-weight: bold;
}

.russian:hover {
	transition: 0.3s ease;
	background-color: #303F9F;
	color: #FFFFFF;
}

.german {
	border: 2px solid #004D40;
	color: #004D40;
}

.german.checkeded {
	background-color: #004D40;
	color: #FFFFFF;
	font-weight: bold;
}

.german:hover {
	transition: 0.3s ease;
	background-color: #004D40;
	color: #FFFFFF;
}

.french {
	border: 2px solid #5D4037;
	color: #5D4037;
}

.french.checkeded {
	background-color: #5D4037;
	color: #FFFFFF;
	font-weight: bold;
}

.french:hover {
	transition: 0.3s ease;
	background-color: #5D4037;
	color: #FFFFFF;
}

.profile_pics_upload {
	display: none;
}

.profile_pics_upload_css {
	cursor: pointer;
	font-size: 30px;
	color: #BDBDBD;
}

.profile_pics_upload_wrapper {
	width: 100px;
	height: 100px;
	background-color: #EEEEEE;
	position: absolute;
	bottom: 0;
	border: 1px solid lightgray;
	border-radius: 20px;
}

.profile_pics_upload_wrapper i {
	display: block;
	width: 100px;
	height: 100px;
	position: absolute;
	top: 0;
	left: 0;
	line-height: 100px;
	text-align: center;
}

.profile_pics_upload_wrapper:hover {
	background-color: #E0E0E0;
}

.profile_pics_upload_wrapper:hover .profile_pics_upload_css {
	transform: scale(1.1);
	color: #424242;
}

.return_profile_link {
	text-decoration: none;
	position: absolute;
	right: 0;
	top: 10px;
	color: #616161;
	font-size: 18px;
}

.return_profile_link:hover {
	color: #212121;
	font-weight: bold;
	font-size: 18px;
}

.for_border_top_upload {
	/*background-color: #3e8d86;*/
	width: 950px;
	margin-left: 20px;
	position: relative;
	height: 120px;
	margin-bottom: 20px;
	margin-top: 20px;
	border-top: 2px solid lightgray;
}

.added_pic_wrapper {
	width: 100px;
	height: 100px;
	background-color: #EEEEEE;
	position: relative;
	bottom: 0;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-left: 20px;
	text-align: center;
	line-height: 100px;
	float: left;
	overflow: hidden;
}



.added_pic_wrapper_papa {
	overflow: hidden;
}

.added_pic_wrapper:hover .pic_delete {
	display: block;
}

.pic_delete {
	display: none;
	position: absolute;
	width: 104px;
	height: 104px;
	top: -2px;
	left: -2px;
	font-size: 30px;
	border-radius: 10px;
	background-color: rgba(100, 100, 100, 0.5);
	color: #E0E0E0;
	border: none;
	cursor: pointer;
}

.added_pic_total_wrapper {
	margin-top: 15px;
}

.user_name_input {
	position: relative;
	left: 20px;
	width: 300px;
	height: 30px;
	font-size: 18px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding-left: 10px;
}

.short_self_introduction {
	width: 700px;
	height: 60px;
	position: relative;
	left: 20px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 16px;
	margin-bottom: 20px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 10px;
	
}

.select_region {
	width: 710px;
	position: relative;
	left: 20px;
}

.contacts_div {
	position: relative;
	/*background-color: #3e8d86;*/
	margin-left: 20px;
	margin-bottom: 20px;
}

.contact_image {
	width: 30px;
	height: 25px;
	display: block;
	float: left;
	margin-top: 3px;
	border-radius: 8px;
	margin-right: 10px;
}

.contact_text_input {
	width: 285px;
	line-height: 25px;
	position: relative;
	display: block;
	margin-bottom: 10px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.long_self_introduction {
	width: 900px;
	height: 120px;
	position: relative;
	left: 20px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 16px;
	margin-bottom: 20px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 10px;
}

.byteInfo {
	position: relative;
	/*background-color: #3e8d86;*/
	width: 100px;
	right: 0px;
	margin-bottom: 20px;
	margin-top: -20px;
	margin-left: 800px;
}

.delete_contact_content {
	display: inline;
	clear: bottom;
	position: absolute;
	margin-top: -35px;
	left: 295px;
	border-radius: 10px;
	border: none;
	background-color: transparent;
}

.contact_text_input:hover .delete_contact_content {
	display: inline;
	clear: bottom;
	position: absolute;
	margin-top: -35px;
	left: 260px;
	border-radius: 10px;
	border: none;
	background-color: transparent;
}

.delete_contact_content:hover {
	cursor: pointer;
}

.profile_gender_select {
	margin-left: 20px;
}

.career_input {
	width: 300px;
}

#career_box {
	margin-left: 20px;
}

#certificate_box {
	margin-left: 20px;
}

.add_button_css {
	position: relative;
	margin-bottom: 20px;
	margin-top: 10px;
	margin-left: 20px;
	width: 647px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 16px;
	font-weight: bold;
	box-shadow: 1px 1px 0 #424242, 2px 2px 0 #424242;
	transform: translate(0, 0);
	transition: 0.1s ease;
}

.add_button_css:active {
	box-shadow: none;
	transform: translate(2px, 2px);
}

.certificate_input {
	width: 613px;
	left: 20px;
}

.profile_input_button_css {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 16px;
	font-weight: bold;
	padding: 3px 25px;
	position: absolute;
	bottom: 15px;
	right: 20px;
	box-shadow: 1px 1px 0 #424242, 2px 2px 0 #424242;
	border-radius: 2px;
	transition: 0.1s ease;
}

.profile_input_button_css:active {
	box-shadow: none;
	transform: translate(2px, 2px);
}

.cancel_profile {
	right: 120px;
}

.profile_register_category_wrapper {
	margin-bottom: 60px;
}

.choose_birth_date {
	position: relative;
	margin-left: 500px;
	margin-top: -60px;
}

.birth_date {
	margin-top: 3px;
	margin-left: 20px;
}
</style>
<body>
	<%@ include file="/WEB-INF/template/header.jsp"%>
		<%

	String[] regions = request.getParameterValues("region");
	
	
	int noUser = loginUser.getNoUser();

	User user = UsersDAO.selectOne(noUser);
	List<MyArea> areaList =MyAreaDAO.selectListByUser(noUser);
	List<Career> careers = CareersDAO.selectList(noUser);
	List<License> licenses = LicenseDAO.selectList(noUser);

	System.out.println(noUser);

	Profile profile = ProfilesDAO.selectProfile(noUser);
	
	List<ProfilePic> profilePics = ProfilePicsDAO.selectList(noUser);
	
	System.out.println(profilePics);
	
	List<Contact> contacts = ContactsDAO.selectList(noUser);
	List<AvalLang> avalLangs = AvalLangDAO.selectList(noUser);
	
	
	
	
//중복 선택이 가능하기 때문에 getParameterValues
//""안에 있는 것은 name과 같게 해야 한다.
//여러개를 받아올 수 있기 때문에 String 배열형으로 받아온다.
	
	%>

	<div class="profile_register_total_wrapper">
	
	<%--   테스트	<form id="profileForm" action="/test.jsp" method="post"> --%>
		<form id="profileForm" action="/updateProfile.jsp" method="post">		 
			<div class="profile_register_title">
				<h2>프로필 수정하기</h2>
			</div>
			<div class="return_my_profile">
				<a href="userInfo.jsp?noUser=<%=loginUser.getNoUser()%>"
					class="return_profile_link">| <i class="fas fa-undo"></i>
					마이페이지로 |
				</a>
			</div>
			<div class="profile_input_wrapper">

				<div class="profile_register_category_wrapper">
					<div class="profile_register_category">
						<label>
							<h2 class="profile_register_category_title">이름*</h2> <input
							class="user_name_input" type="text" name="profileName"
							value="<%= user.getName()%>"
							placeholder="이름을 정확히 입력하세요." />
						</label>
					</div>
					<div class="profile_register_category">
						<h2 class="profile_register_category_title">
							사진 추가*<span class="additional_explanation">(최대 10장까지 가능;
								첫번째사진은 메인사진으로 등록됩니다)</span>
						</h2>
						<div>
							<div class="added_pic_total_wrapper">
								<ul class="added_pic_wrapper_papa">

									<% for(ProfilePic pic : profilePics) {  %>
											  <li class="added_pic_wrapper">
									            <button class="pic_delete">
									                <i class="far fa-trash-alt"></i></button>
									            <img class="added_pic" src="<%=pic.getFileName() %>" width="100" height="100"/>
												<input class="profile_img" type="hidden" name="profilePic" value="<%=pic.getFileName() %>"/>
									        </li>
									<%} %>
								</ul>
							</div>
							<div class="for_border_top_upload">
								<div class="profile_pics_upload_wrapper">
									<label> <input id="profilePic" name="" class="profile_pics_upload" type="file" />
										<!--<i class="profile_pics_upload_css fas fa-plus-circle"></i>-->
										<i class="profile_pics_upload_css fas fa-plus"></i>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="profile_register_category">
						<h2 class="profile_register_category_title">
							언어* <span class="additional_explanation">(의사소통이 가능한 언어를
								선택해주세요)</span>
						</h2>
						<div>
						
							<%
								boolean isKorean = false;
								boolean isEnglish = false;
								boolean isChinese = false;
								boolean isArabic = false;
								boolean isJapanese = false;
								boolean isSpanish = false;
								boolean isRussian = false;
								boolean isGerman = false;
								boolean isFrench = false;
								
								for (AvalLang language : avalLangs) {
									if (language.getLanguage().equals("Korean")) {
										isKorean = true;
									} else if (language.getLanguage().equals("English")) {
										isEnglish = true;
									} else if (language.getLanguage().equals("Chinese")) {
										isChinese = true;
									} else if (language.getLanguage().equals("Arabic")) {
										isArabic = true;
									} else if (language.getLanguage().equals("Japanese")) {
										isJapanese = true;
									} else if (language.getLanguage().equals("Spanish")) {
										isSpanish = true;
									} else if (language.getLanguage().equals("Russian")) {
										isRussian = true;
									} else if (language.getLanguage().equals("German")) {
										isGerman = true;
									} else if (language.getLanguage().equals("French")) {
										isFrench = true;
									} //if~else if() end
								} //for() end
							%>

							<label
								class="user_language korean <%if (isKorean) {%>checkeded<%}%>"><!-- 
								 --><input name="language" value="1" class="avail_language" <%if (isKorean) {%> checked <%}%>
								type="checkbox" />한국어</label><label
								class="user_language english <%if (isEnglish) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="2" class="avail_language" <%if (isEnglish) {%> checked <%}%>
								type="checkbox" />영어</label><label
								class="user_language chinese <%if (isChinese) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="3" class="avail_language" <%if (isChinese) {%> checked <%}%>
								type="checkbox" />중국어</label><label
								class="user_language arabic <%if (isArabic) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="4" class="avail_language" <%if (isArabic) {%> checked <%}%>
								type="checkbox" />아랍어</label><label
								class="user_language japanese <%if (isJapanese) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="5" class="avail_language" <%if (isJapanese) {%> checked <%}%>
								type="checkbox" />일본어</label><label
								class="user_language spanish <%if (isSpanish) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="6" class="avail_language" <%if (isSpanish) {%> checked <%}%>
								type="checkbox" />스페인어</label><label
								class="user_language russian <%if (isRussian) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="7" class="avail_language" <%if (isRussian) {%> checked <%}%>
								type="checkbox" />러시아어</label><label
								class="user_language german <%if (isGerman) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="8" class="avail_language" <%if (isGerman) {%> checked <%}%>
								type="checkbox" />독일어</label><label
								class="user_language french <%if (isFrench) {%>checkeded<%}%>"><!-- 
								--><input name="language" value="9" class="avail_language" <%if (isFrench) {%> checked <%}%>
								type="checkbox" />프랑스어</label>
						</div>
						<!--language div end-->
					</div>
					<div class="profile_register_category">
						<h2 class="profile_register_category_title">성별*</h2>
						<div class="profile_gender_select">
						<% %>
							<label> <input name="gender" type="radio" value="M"  <%if(profile!=null){
																						if(profile.getGender().equals("M")){
																							out.print("checked");
																							}
																						} %>/><i
								class="fas fa-male"></i>(남)
							</label> <label> <input name="gender" type="radio" value="F" <%if(profile!=null){
																						if(profile.getGender().equals("F")){
																							out.print("checked");
																							}
																						} %>/><i
								class="fas fa-female"></i>(여)
							</label>
						</div>
						<div class="choose_birth_date">
							<h2 class="profile_register_category_title">생년월일*</h2>
							<select name="year" class="birth_date year">
								<%for(int i=2018; i>1900; i--){ %>
								<option <%if(profile!=null&& Integer.parseInt(profile.getBirthDate().toString().substring(0,4))==i ){%>
								selected
								<%} %>
								><%= i%></option> <%} %>
								
							</select>년 
							<select name="month" class="birth_date month">
							<%for(int i=1; i<=12; i++){ %>
								<option <%if(profile!=null&& Integer.parseInt(profile.getBirthDate().toString().substring(5,7))==i ){%>
								selected
								<%} %>
								><%= i%></option> <%} %>
							</select>월
							<select name="date" class="birth_date date">
							<%for(int i=1; i<=31; i++){ %>
								<option <%if(profile!=null&& Integer.parseInt(profile.getBirthDate().toString().substring(8,10))==i ){%>
								selected
								<%} %>
								><%= i%></option> <%} %>
							</select>일
						</div>
					</div>
					<div class="profile_register_category">
						<label>
							<h2 class="profile_register_category_title">
								한마디*<span class="additional_explanation">(자신을 표현하는 한마디를
									설정해주세요)</span>
							</h2> <textarea class="short_self_introduction"
								name="short_self_introduction"
								placeholder="자신의 가치관, 이념 등을 간략하고 정확하게 적어보세요!"><%-- 
								--%><%if(profile!=null && profile.getShortIntro()!=null){%><%-- 
									  --%><%=profile.getShortIntro()%><%-- 
								 --%><%}  %></textarea>

						</label>
					</div>
					<div class="profile_register_category">
						<label><h2 class="profile_register_category_title">
								자신있는 지역<span class="additional_explanation">(최대 4개 선택 가능)</span>
							</h2>
							<div class="select_region">
								<select style="display: none" name="region" multiple required placeholder="<%=user.getCity() %>" value="<%=user.getCity() %>">
									<!-- <option value="강원도" selected  disabled>강원도</option>-->
									<option
                    <%
                    if(areaList!=null){
                    boolean isSeoul = false;
                    
                    //regions 배열에 있는 각각의 값들을 변수 region으로 설정
                    for(MyArea region : areaList) {
                    	//문자열 값비교는 ==가 아닌 equals!!!!!
                    	if(region.getNoCity()==1) {
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
                    if(areaList!=null){
                    boolean isIncheon = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==207) {
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
                    if(areaList!=null){
                    boolean isDaejeon = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==150) {
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
                    if(areaList!=null){
                    boolean isSejong = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==173) {
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
                    if(areaList!=null){
                    boolean isGwangju = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==135) {
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
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==141) {
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
                    if(areaList!=null){
                    boolean isUlsan = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==198) {
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
                    if(areaList!=null){
                    boolean isBusan = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==156) {
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
                    if(areaList!=null){
                    boolean isGyeonggi = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==46) {
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
                    if(areaList!=null){
                    boolean isGangwon = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==27) {
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
                    if(areaList!=null){
                    boolean isChungnam = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==260) {
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
                    if(areaList!=null){
                    boolean isChungbuk = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==277) {
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
                    if(areaList!=null){
                    boolean isJeollanam = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==218) {
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
                    if(areaList!=null){
                    boolean isJeollabuk = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==241) {
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
                    if(areaList!=null){
                    boolean isGyeongnam = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==88) {
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
                    if(areaList!=null){
                    boolean isGyeongbuk = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==110) {
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
                    if(areaList!=null){
                    boolean isJeju = false;
                    
                    for(MyArea region : areaList) {
                    	
                    	if(region.getNoCity()==257) {
                    		isJeju = true;	
                    		break;
                    	}//if end
                    	
                    }//for end
                    
                    if(isJeju) { %>
                    selected
                    <%}  }%>
                    value="257">제주특별자치도</option>
                </select>
							</div> </label>
					</div>
					<!--profile_register_category end-->
					<div class="profile_register_category">
						<h2 class=" profile_register_category_title">
							연락처*<span class="additional_explanation">(반드시 1개 이상 입력하셔야 합니다)</span>
						</h2>
						<div class="contacts_div">
							
							<label>
								<div>
									<img src="/img/email.jpg" class="contact_image"> <input name="E"<%--
										--%>class="contact_text_input" value="<% for( Contact contact : contacts ) {%><%--
											--%><%if(contact.getType().equals("E")){%><%--
											--%><%= contact.getAccount() %><%}} %>"<%--
										--%>type="text" />
								</div>
							</label>
								<button class="delete_contact_content">
								<i class="fas fa-times"></i>
								</button>
												
							
							<label>
								<div>
									<img src="/img/twitter.png" class="contact_image"> <input name="T"<%--
										--%>class="contact_text_input" value="<% for( Contact contact : contacts ) {%><%--
											--%><%if(contact.getType().equals("T")){%><%--
											--%><%= contact.getAccount() %><%}} %>"<%--
										 --%>type="text" />
								</div>
							</label>
							<button class="delete_contact_content">
								<i class="fas fa-times"></i>
							</button>
							
							<label>
								<div>
									<img src="/img/facebook.png" class="contact_image"> <input name="F"<%--
										--%>class="contact_text_input" value="<% for( Contact contact : contacts ) {%><%-- 
											--%><%if(contact.getType().equals("F")){%><%-- 
											--%><%= contact.getAccount() %><%}} %>" <%--
										--%>type="text" />
								</div>
							</label>
							<button class="delete_contact_content">
								<i class="fas fa-times"></i>
							</button>
							
							<label>
								<div>
									<img src="/img/instagram.jpg" class="contact_image"> <input name="I"<%--
										--%>class="contact_text_input" value="<% for( Contact contact : contacts ) {%><%--
											--%><%if(contact.getType().equals("I")){%><%--
											--%><%= contact.getAccount() %><%}} %>"<%--
										 --%>type="text" />
								</div>
							</label>
							<button class="delete_contact_content">
								<i class="fas fa-times"></i>
							</button>
							
							
						</div>
					</div>
					<!--contact_wrapper end-->
					<div class="profile_register_category">
						<label>
							<h2 class="profile_register_category_title">
								자기소개<span class="additional_explanation">(당신이 어떤 사람인지 여행
									파트너에게 소개하세요; 최소 200자 이상)</span>
							</h2> <textarea placeholder="꿀팁!! 구체적일수록 매칭 확률이 더 높답니다!"
								class="long_self_introduction" name="longIntro" cols="100" rows="10"
								onKeyUp="javascript:fnChkByte(this,'2000')"><%if(profile!=null && profile.getLongIntro()!=null)
								{%><%=profile.getLongIntro() %><%} %></textarea>
							<div class="byteInfo">
								<span id="byteInfo">0</span>/2000Byte
							</div>
						</label>
					</div>
					<div class="profile_register_category">

						<div>
							<h2 class="profile_register_category_title">
								이력<span class="additional_explanation">(자신의 이력사항을 추가하세요)</span>
							</h2>
							
							<div id="career_box">
							<%
								for (Career career : careers) {

									Calendar now = Calendar.getInstance();

									int startYear = career.getStartDate() / 100;

									// System.out.println(startYear);

									int startMonth = career.getStartDate() - startYear * 100;

									// System.out.println(startMonth);

									int endYear = career.getEndDate() / 100;
									int endMonth = career.getEndDate() - endYear * 100;
							%>
								<div>
									<input class="career_input" value="<%=career.getContent()%>"
										name="certificate" placeholder="이력을 간단하게 입력하세요" /> <select
										class="year">
										
										<%
											for (int i = startYear; i >= 1900; i--) {
													if (i == 2014) {
										%>
										<option selected><%=i%></option>
										<%
											} else {
										%>
										<option><%=i%></option>
										<%
											}
												}
										%>
									</select>년 <select class="month">
										<%
											for (int i = 1; i <= 12; i++) {
													if (i == startMonth) {
										%>
										<option selected><%=i%></option>
										<%
											} else {
										%>
										<option><%=i%></option>
										<%
											}
												}
										%>
									</select>월 ~ <select class="year">
										<%
											for (int i = endYear; i >= 1900; i--) {
													if (i == endYear) {
										%>
										<option selected><%=i%></option>
										<%
											} else {
										%>
										<option><%=i%></option>
										<%
											}
												}
										%>
									</select>년 <select class="month">
										<%
											for (int i = endMonth; i <= 12; i++) {
													if (i == endMonth) {
										%>
										<option selected><%=i%></option>
										<%
											} else {
										%>
										<option><%=i%></option>
										<%
											}
												}
										%>
									</select>월
									<button class="delete_career" type="button">
										<i class="fas fa-times"></i>
									</button>
								</div>
								<%
								}
							%>
							</div>
							<!--career_box end-->
							
							<button class="add_button_css" id="add_career" type="button">
								추가하기 <i class="fas fa-plus"></i>
							</button>
						</div>
					</div>
					<div class="profile_register_category">
						<label><h2 class="profile_register_category_title">자격증</h2>
							<div id="certificate_box">
								<%
									for (License license : licenses) {
								%>
								<div>
									<input name="license" class="certificate_input"
										value="<%=license.getLicense()%>"
										placeholder="자격증 명을 정확히 입력하세요." />
									<button type="button">
										<i class="fas fa-times"></i>
									</button>
								</div>
								<%
									}
								%>

								<script id="certificate_template" type="text/template">
                                    <div>
                                        <input class="certificate_input" placeholder="자격증 명을 정확히 입력하세요."/>
                                        <button class="delete_certificate"><i class="fas fa-times"></i></button>
                                    </div>
                                </script>

							</div>
							<button class="add_button_css" id="add_certificate" type="button">
								추가하기 <i class="fas fa-plus"></i>
							</button> </label>
					</div>
					<button class="profile_input_button_css cancel_profile">취소</button>
					<button class="profile_input_button_css submit_profile">완료</button>

				</div>
				<!--profile_input_wrapper end-->
			</div>
		</form>
	</div>
	<!--profile_register_total_wrapper end-->



	<!-- 프로필 사진 템플릿 -->
	<script type="text/template" id="imgTmp">
        <li class="added_pic_wrapper">
            <button class="pic_delete">
                <i class="far fa-trash-alt"></i></button>
            <img class="added_pic" src="<@=src @>"/>
			<input class="profile_img" type="hidden" name="profilePic" value="<@=src @>"/>
        </li>
    </script>
	<!-- //프로필 사진 템플릿 -->
	<!-- 이력 템플릿 -->
	
	
	<script id="career_template" type="text/template">
        <div>
            <input class="career_input" name="certificate" placeholder="이력을 간단하게 입력하세요"/>
            <select class="year">
                <%for (int i = 2018; i >= 1900; i--) {%>
                <option><%=i%></option>
                <%} //for end%>
            </select>년
            <select class="month">
                <%for (int i = 1; i <= 12; i++) {%>
                <option><%=i%></option>
                <%} //for end%>
            </select>월
            ~
            <select class="year">
                <%for (int i = 2018; i >= 1900; i--) {%>
                <option><%=i%></option>
                <%} //for end%>
            </select>년
            <select class="month">
               <%for (int i = 1; i <= 12; i++) {%>
                <option><%=i%></option>
                <%} //for end%>
            </select>월
            <button><i class="fas fa-times"></i></button>
        </div>
    </script>
	<!--// 이력 템플릿 -->
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.dropdown.js"></script>
	<script src="/js/fix-footer.js"></script>
	<script>
	
	
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
	
	//image인지 확인하는 정규표현식
	var picReg = /^image/;
	//profile input요소(type file)
	var $pic = $("#profilePic");
	//profile msg 확인하는 것
	var $picMsg = $(".msg.pic");
	//picName
	var $picName = $("#picName");
	//imgBox
	var $imgBox = $(".profile_pics_upload_wrapper");
	
	var $addPicWrapper = $(".added_pic_wrapper_papa");

	var oldPic = null;

	var $joinForm = $("form");
	
	var profileImgTmp = _.template($("#imgTmp").html());

	function checkProfile() {
		
		//jquery객체에서 순수자바스크립트요소객체 얻기
		var profile = $pic.get(0);
		
		//input type=file요소(순수자바스크립트)는 무조건
		//files배열을 가지고 있습니다.
		
		//한 개의 파일
		var file = profile.files[0];
			
		//File 객체의 속성
		//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
		//- name : 파일명
		//- lastModified : 최종수정일
		//- size : 파일 크기
		
		if(file==null||file.size<=0) {
			$picMsg.removeClass("ok")
			           .text("제대로 된 파일을 선택해주세요.");
			return;
		}//if end
		
		//이미지인지 확인!!
		if(!picReg.test(file.type)) {
			$picMsg.removeClass("ok")
	        .text("이미지 파일을 선택해주세요.");
			return;
		}else {
			$picMsg.text("");
		}//if~else end
		
		if(oldPic!=file.name) {
		oldPic = file.name;
		//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
		//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
		
		//ajax로 넘길 폼을 생성하고
		var form = new FormData();
		
		//우리가 선택한 파일을 붙임
		form.append("type","P");//일반적인 데이터
		
		//1)파라미터명, 2) 파일 3) 파일명
		form.append("uploadImg",file,file.name);
		
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
				
				console.log(json.src);
				
				 $addPicWrapper.append(profileImgTmp({"src":json.src}));
				
				//$picName.val(json.src);
			}//success end
		});//ajax() end
		}//if end
	}//checkProfile() end

	$pic.change(checkProfile);//change() end

	$joinForm.submit(function() {
		//checkProfile();
		/*
		console.log("submit 할때");
		console.log(isValidId);
		console.log(isValidNickname);
		console.log(isValidPwd);
		console.log(isConfirmPwd);
		console.log(isValidBirth);
		console.log(!$imgBox.hasClass("no_image"));
		*/
		if($imgBox.hasClass("no_image")) {
			//return false;
		}//if end
	});//submit() end
	
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


        var imgTmp = _.template($('#imgTmp').html());


        $(".avail_language").change(function () {
            //alert("test");
            $(this).parent().toggleClass("checkeded");
        });

        var tmpTwo = _.template($('#career_template').html());

        $('#add_career').click(function () {

            $('#career_box').append(tmpTwo);
        });

        var tmp = _.template($('#certificate_template').html());

        $('#add_certificate').click(function () {
            $('#certificate_box').append(tmp);
        });
        $('#delete_certificate').on('')
        /*$(".pic_delete").click(function () {
            $(this).parent().delete();
        })*/
        $('.select_region').dropdown({

            // read only
            readOnly: false,

            // the maximum number of options allowed to be selected
            limitCount: 4,

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

        });

        function fnChkByte(obj, maxByte) {
            var str = obj.value;
            var str_len = str.length;

            var rbyte = 0;
            var rlen = 0;
            var one_char = "";
            var str2 = "";

            for (var i = 0; i < str_len; i++) {
                one_char = str.charAt(i);
                if (escape(one_char).length > 4) {
                    rbyte += 2;                                         //한글2Byte
                } else {
                    rbyte++;                                            //영문 등 나머지 1Byte
                }

                if (rbyte <= maxByte) {
                    rlen = i + 1;                                          //return할 문자열 갯수
                }
            }

            if (rbyte > maxByte) {
            	alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
                str2 = str.substr(0, rlen);                                  //문자열 자르기
                obj.value = str2;
                fnChkByte(obj, maxByte);
            } else {
                document.getElementById('byteInfo').innerText = rbyte;
            }
        }
        /*fnChkByte end*/
        $(".cancel_profile").click(function () {
            confirm("작성을 취소하시겠습니까?");
        });


        // 연락처에서 x버튼을 누를때 내용지우기
        $(".delete_contact_content").click(function () {
            $(this).prev().find(".contact_text_input").val("");
        });




       $("#certificate_box").on("click", ".delete_certificate", function (e) {
           e.preventDefault();
           $(this).parent().remove();
       });
        $("#career_box").on("click", ".delete_career", function (e) {
            e.preventDefault();
            $(this).parent().next().remove();
        });

        // $(".pic_delete").on("click",function () {
        //     $(this).parent().remove();
        // });
        //
        // $(".pic_delete").click(function () {
        //     $(this).parent().remove();
        // });



        //2018-10-28 김필구 : 사진 추가
        $(".profile_pics_upload").change(function () {

            //ajax로 업로드

            //$(".added_pic_wrapper_papa").append(imgTmp({src:"xxx.jpg"}));
           // $('.added_pic_wrapper').css("display", "block");

        });//change() end



/*        //#profileForm submit
        $("#profileForm").submit(function () {

            var name = $(".user_name_input").val();

            console.log(name);

            // var flag = /^[ㄱ-힣]{2,10}$/.test(name);
            //
            // console.log(flag);
            //
            // if(!flag) {
            //     alert("이름을 반드시 입력해주세요");
            //     return false;
            // }else {
            //     alert("한글로 잘입력했네요");
            // }

        });*/
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

        $(".arrow_to_top").click(function (e) {
            e.preventDefault();
            $("html, body").animate({ scrollTop:0} , "slow");
        })//$(".arrow_to_top").click() end

        $(".arrow_to_bottom").click(function (e) {
            e.preventDefault();
            $("html, body").animate({ scrollTop: $(".profile_input_wrapper").height() }, "slow");

        })//$(".arrow_to_bottom").click() end

        $(".navigation").click(function () {
            alert("페이지 준비중입니다.")
        });//$(".navigation").click() end
    </script>
</body>
</html>
