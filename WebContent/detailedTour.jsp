<%@page import="com.beeum.beeum.dao.TourPicsDAO"%>
<%@page import="com.beeum.beeum.vo.TourPic"%>
<%@page import="com.beeum.beeum.dao.TourAreaDAO"%>
<%@page import="com.beeum.beeum.vo.City"%>
<%@page import="com.beeum.beeum.dao.AvalLangDAO"%>
<%@page import="com.beeum.beeum.vo.TourTerm"%>
<%@page import="com.beeum.beeum.dao.TourTermsDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.beeum.beeum.dao.CoursesDAO"%>
<%@page import="com.beeum.beeum.vo.Course"%>
<%@page import="com.beeum.beeum.vo.Tour"%>
<%@page import="com.beeum.beeum.dao.ToursDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noTour = request.getParameter("noTour");
	
	Tour tour = ToursDAO.selectDetailedTour(Integer.parseInt(noTour));
	
	List<Course> list = CoursesDAO.selectListDetailedTour(Integer.parseInt(noTour));
	
	List<TourTerm> list2 = TourTermsDAO.selectListDetailedTour(Integer.parseInt(noTour));
	
    int eatTime=0;
    int moveTime=0;
    for(Course course: list)
    { 
    	if(course.getNoCourseCategory()>=8 && course.getNoCourseCategory()<=15)
    	{
    		eatTime += course.getDemandTime();
    	}
    	if(course.getNoCourseCategory()>=3 && course.getNoCourseCategory()<=6)
    	{
    		moveTime += course.getDemandTime();
    	}
    	
    } 
    
    int avalLangCnt = AvalLangDAO.avalLangCnt(tour.getNoUser());

    String lat = tour.getLat().substring(tour.getLat().indexOf("(")+1, tour.getLat().indexOf(","));
	//System.out.println(lat);    
    String lng = tour.getLat().substring(tour.getLat().indexOf(",")+2, tour.getLat().indexOf(")"));
	//System.out.println(lng);    
	
	List<City> listCity = TourAreaDAO.selectListDetailedTour(Integer.parseInt(noTour));
	
	String picS = TourPicsDAO.selectOneDetailedTour(Integer.parseInt(noTour));
	
	int i = 0;
	String cityName= null;
	for(City city: listCity){
		if(i==0){ 
			cityName = city.getCity();
		}
		i++;
	}
%>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>detailedTour</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	
    <style>

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

    .hive_img {
        width: 40px;
        height: 40px;
        top: 5px;
        position: relative;
    }

    .review_num {
        position: relative;
        left: 5px;
        top: 15px;
    }

        /*  *//*  *//*  */
        /*  여기까지 review box */
        /*  *//*  *//*  */
        
        #content {
            width: 1080px;
            min-height: 700px;
            position: relative;
            margin: 20px auto;
            border: 1px solid #FAE100;
            border-radius: 10px;
        }

        #tourPicBox {
            width: 1080px;
            height: 300px;
            position: relative;
        }

        #tourPicBox img {
            width: 1080px;
            height: 300px;
            border-radius: 10px 10px 0px 0px;
        }

        #tourTitleBox {
            width: 1080px;
            height: 100px;
            text-align: center;
            overflow: hidden;
            position: relative;
        }

        #tourTitleBox h2 {
            font-size: 30px;
            font-weight: bold;
            font-family: 'Gothic A1', sans-serif;
            margin-top: 30px;
        }

        #tourTitleBox h3 {
            font-size: 20px;
            font-weight: bold;
            color: #343332;
        }

        #tourScore,
        #scoreBox {
            width: 150px;
            height: 40px;
            position: absolute;
            bottom: 0;
            right: 100px;
            cursor: pointer;
        }

        #scoreBox {
            bottom: 60px;
            right: -40px;
        }

        #tourScore div,
        #scoreBox div {
            float: left;
        }

        #tourScore img,
        #scoreBox img {
            width: 40px;
            height: 40px;
        }

        #tourScore span,
        #scoreBox span {
            display: inline-block;
            font-weight: bold;
            font-family: 'Gothic A1', sans-serif;
            width: 110px;
            line-height: 40px;
            text-align: left;
            text-indent: 5px;
            height: 40px;
        }
        #topTabBox>div{
            top:0;
            width: 1080px;
            height: 50px;
            position:relative;
            background:white;
            box-shadow: 0px 0px 2px lightgray;
        }

        #topTabBox {
            width: 1080px;
            height: 50px;
            background:white;
            z-index: 3;
            position: relative;
            top:0;
            box-shadow: 0px 0px 2px lightgray;
        }

        li.topTabList {
            float: left;
            min-width: 30px;
            height: 30px;
            /*background:blue;*/
            font-size: 20px;
            margin-top: 5px;
            transition: 0.3s ease;
            padding: 2px 5px;
            margin-left: 30px;
            border-top: 3px solid transparent;
            border-bottom: 3px solid transparent;
            font-weight: bold;
            line-height: 30px;
            cursor: pointer;
            font-family: 'Gothic A1', sans-serif;
        }

        li.topTabList:hover {
            border-bottom: 3px solid #FAE100;
        }

        li.topTabList.select {
            border-top: 3px solid #FAE100;
            border-bottom: 3px solid #FAE100;
        }

        #topTabBox button {
            display: block;
            padding: 5px 10px;
            border: 1px solid lightgray;
            border-radius: 10px;
            line-height: 22px;
            font-size: 15px;
            background: transparent;
            position: absolute;
            top: 8px;
            right: 30px;
            cursor: pointer;
            font-family: 'Gothic A1', sans-serif;
            outline: none;
        }

        #topTabBox button.heart {
            font-weight: bold;
        }

        #topTabBox button.heart i,
        #beeHeartBtn.heart {
            color: red;
        }

        #tourContent {
            width: 1080px;
            min-height: 400px;
            /*background: green;*/
            position: relative;
        }

        #tourLeftBox {
            width: 700px;
            min-height: 500px;
            position: relative;
            /*background:red;*/
        }

        .left_box_content {
            width: 700px;
            min-height: 150px;
            margin-bottom: 2px;
            /*background:red;*/
            position: relative;
            box-shadow: 0px 1px 3px lightgray;
            padding-bottom: 10px;
        }

        #userImgBox {
            width: 130px;
            height: 130px;
            position: relative;
            margin-top: 10px;
            margin-left: 10px;
            float: left;
            border-radius: 10px
        }

        #userImgBox img {
            width: 130px;
            height: 130px;
            border-radius: 10px;
        }

        #userBeeBox {
            width: 200px;
            height: 30px;
            margin-top: 10px;
            margin-left: 150px;
            /*background: blue;*/
        }

        #userBeeBox li {
            float: left;
            width: 26px;
            height: 26px;
            margin: 2px;
            text-align: center;
            line-height: 26px;
            box-shadow: 0px 0px 1px #424242;
        }

        #userName {
            font-size: 18px;
            /*background: blue;*/
            width: 300px;
            height: 30px;
            font-weight: bold;
            text-indent: 3px;
            line-height: 30px;
            margin-left: 150px;
        }

        #shortIntroBox {
            width: 400px;
            height: 30px;
            font-size: 16px;
            /*background: blue;*/
            color: #424242;
            font-weight: bold;
            margin-left: 150px;
            line-height: 30px;
            text-indent: 3px;
        }

        #userCard {
            /*background:red;*/
            position: relative;
        }

        #contactBox {
            width: 300px;
            height: 40px;
            /*background:blue;*/
            margin-left: 150px;
        }

        #contactBox li {
            float: left;
            overflow: hidden;
            text-indent: -9999px;
            width: 40px;
            height: 40px;
            margin-right: 5px;
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            opacity: .7;
        }

        #contactBox li:nth-child(1) {
            background-image: url("img/contact1.jpg");
        }

        #contactBox li:nth-child(2) {
            background-image: url("img/contact2.png");
        }

        #contactBox li:nth-child(3) {
            background-image: url("img/contact3.png");
        }

        #contactBox li:nth-child(4) {
            background-image: url("img/contact4.jpg");
        }

        #beeHeartBtn {
            width: 30px;
            height: 30px;
            position: absolute;
            cursor: pointer;
            top: 0;
            right: 2px;
            text-align: center;
            line-height: 30px;
            font-size: 18px;
        }

        .left_box_content h4 {
            font-weight: bold;
            font-family: 'Gothic A1', sans-serif;
            text-indent: 20px;
            font-size: 25px;
            height: 60px;
            line-height: 70px;
        }

        .left_box_content .tour_card {
            width: 660px;
            min-height: 150px;
            margin: auto;
            position: relative;
            border: 1px solid lightgray;
            border-radius: 10px;
            /*background:red;*/
        }

        #tourIntroCard {
            border: none;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
            padding-top: 30px;
        }

        #tourIntroCard li {
            float: left;
            width: 132px;
            height: 80px;
            text-align: center;
        }

        #tourIntroCard li img {
            width: 50px;
            height: 50px;
        }

        #tourIntroCard .tour_intro_title {
            font-size: 15px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 7px;
            font-family: 'Gothic A1', sans-serif;
        }

        #tourIntro {
            margin: auto;
            width: 660px;
            min-height: 100px;
            overflow: hidden;
            /*background:red;*/
            margin-top: 10px;
        }

        #tourIntro #tourIntroTitle {
            font-size: 18px;
            line-height: 18px;
            font-family: 'Gothic A1', sans-serif;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #tourIntroContent {
            overflow: hidden;
            font-family: 'Gothic A1', sans-serif;
            font-size: 16px;
            line-height: 20px;
        }

        #meetAreaBox,
        .courseBox {
            position: relative;
            width: 660px;
            min-height: 100px;
            margin: auto;
            margin-bottom: 10px;
            overflow: hidden;
            /*background:red;*/
            padding-bottom: 5px;
            border-bottom: 1px solid lightgray;
        }
        #tourCourseBox h5{
            margin-left: 20px;
        }
        #tourCourseBox h5,
        #meetAreaBox h5,
        .courseBox h5 {
            font-size: 18px;
            font-family: 'Gothic A1', sans-serif;
            font-weight: bold;
            width: 660px;
            line-height: 40px;
            height: 40px;
            position: relative;
        }

        .courseBox .time_span {
            font-size: 16px;
            display: inline-block;
            text-indent: 30px;
            margin-bottom: 5px;
        }

        .courseBox > p {
            color: #6b6a69;
            font-family: 'Gothic A1', sans-serif;
            font-weight: bold;
        }

        .courseBox .category {
            font-size: 16px;
        }

        .left_box {
            width: 325px;
            min-height: 150px;
            position: relative;
            margin-right: 6px;
            margin-left: 2px;
            float: left;
            box-shadow: 0px 0px 1px lightgray;
            border-radius: 10px;
        }

        .right_box {
            width: 325px;
            min-height: 150px;
            float: left;
            overflow: hidden;
            position: relative;
            box-shadow: 0px 0px 1px lightgray;
            border-radius: 10px;
            text-indent: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .right_box img,
        .left_box img {
            width: 325px;
            height: 150px;
            display: block;
            border-radius: 10px;
        }

        #tourCourseBox {
            overflow: hidden;
        }

        #tourGuidance {
            width: 630px;
            min-height: 100px;
            margin: auto;
            overflow: hidden;
            padding-left: 30px;
            list-style-type: disc;
        }

        #tourGuidance li {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
            font-family: 'Gothic A1', sans-serif;
        }

        #tourReviewBox {
            min-height: 300px;
            width: 870px;
            /*background:red;*/
            position: relative;
            /*overflow: hidden;*/
            box-shadow: 0 0 1px lightgray;
            margin-bottom: 10px;
        }

        #tourReviewBox h4 {
            font-weight: bold;
            font-family: 'Gothic A1', sans-serif;
            text-indent: 20px;
            font-size: 25px;
            height: 60px;
            line-height: 70px;
        }

        #tourRightBox {
            width: 360px;
            min-height: 300px;
            position: absolute;
            right: 0;
            top: 0;
            /*background: blue;*/
            box-shadow: 0 0 1px lightgray;
        }

        #tourPriceBox {
            width: 360px;
            height: 60px;
            background: #64b5f6;
            text-align: center;
            padding-top: 5px;
        }

        #tourPriceBox span {
            color: #6b6a69;
            font-weight: bold;
            font-family: 'Gothic A1', sans-serif;
        }

        #tourCalender {
            width: 360px;
            height: 300px;
            background: red;
            margin-top: 1px;
        }

        #tourSelectDate {
            width: 360px;
            height: 50px;
            background: blue;
        }

        #tourUserSelect {
            width: 360px;
            min-height: 60px;
            margin-top: 2px;
        }

        #selectBox {
            width: 360px;
            height: 40px;
            box-shadow: 0 0 1px #424242;
            line-height: 40px;
            text-align: center;
        }

        #selectBox select:nth-child(1) {
            width: 45px;
            font-size: 15px;
            height: 30px;
            display: inline-block;
            margin-right: 10px;
        }

        #selectBox select:nth-child(2) {
            width: 78px;
            font-size: 15px;
            height: 30px;
            display: inline-block;
            margin-right: 10px;
        }

        #selectBox #giveNumCount {
            width: 30px;
            text-align: center;
            font-weight: bold;
            font-size: 15px;
            font-family: 'Gothic A1', sans-serif;
            background: transparent;
            border: none;
            outline: none;
            border-bottom: 2px solid #616161;
        }

        #selectBox button {
            font-size: 16px;
            font-weight: bold;
            width: 20px;
            height: 20px;
            line-height: 20px;
            outline: none;
            cursor: pointer;
            padding: 2px;
            font-family: 'Gothic A1', sans-serif;
            border-radius: 30px;
            background: transparent;
            box-shadow: 1px 1px 1px #424242;
            border: none;
        }

        #selectBox #addUser {
            width: 90px;
            display: inline-block;
            margin-left: 10px;
            height: 30px;
        }

        #selectBox button:hover {
            background: #424242;
            color: white;
        }

        #selectContent {
            width: 350px;
            min-height: 40px;
            padding: 10px 0 0 10px;
            border-bottom: 1px solid lightgray;
            overflow: hidden;
        }

        #selectContent li {
            float: left;
            width: 165px;
            height: 40px;
            font-size: 16px;
            font-weight: bold;
            font-family: 'Gothic A1', sans-serif;
            line-height: 40px;
            margin-bottom: 10px;
            box-shadow: 0 0 1px #424242;
            border-radius: 20px;
            text-align: center;
        }

        #selectContent li:nth-child(2n) {
            margin-right: 10px;
        }

        #selectContent button {
            display: inline-block;
            margin-left: 5px;
            font-size: 18px;
            height: 40px;
            line-height: 30px;
            color: #424242;
            background: transparent;
            border: none;
            outline: none;
            border-radius: 20px;
            cursor: pointer;
        }

        #selectContent button:hover {
            color: red;
        }

        #tourPriceText,
        #tourMaxText {
            padding: 5px 10px;
            /*background: blue;*/
            display: inline-block;
            font-weight: bold;
            font-size: 20px;
            font-family: 'Gothic A1', sans-serif;
        }

        #tourMaxText {
            display: block;
            font-size: 15px;
            text-decoration: underline #424242;
        }
        #tourRightBox h4{
            margin-top: 10px;
            border-bottom: 2px solid #424242;
            min-width: 10px;
            color:#424242;
            display: inline-block;
            margin-left: 5px;
            margin-bottom: 5px;

            font-weight: bold;
            font-size: 17px;
            font-family: 'Gothic A1', sans-serif;
        }
        #tourRightBox h4 span{
            font-size: 14px;
            color: #6b6a69;
        }
        #tourRightBox .right_list_ul{
            width: 330px;
            list-style: disc;
            padding-left: 20px;
            margin-left:10px;
            margin-bottom: 10px;
        }
        #rightTotalPrice{
            width:360px;
            height:60px;
            line-height: 60px;
            text-align: center;
            font-weight: bold;
            text-indent: 30px;
            font-size: 17px;
            font-family: 'Gothic A1', sans-serif;
            box-shadow: 0 0 1px lightgray;
        }
        #rightTotalPrice span:nth-child(1){
            display: inline-block;
            margin-left: -80px;
            margin-right: 10px;
        }
        #rightTotalPrice span:nth-child(2){
            border-bottom: 2px solid lightgray;
        }
        #rightBtnBox{
            width: 360px;
            height:60px;
        }

        #rightBtnBox a:visited{
            color:#424242;
        }
        #rightBtnBox a,
        #rightBtnBox button{
            width: 180px;
            height:60px;
            color:#424242;
            border:none;
            background:transparent;
            font-size:20px;
            text-align: center;
            line-height: 60px;
            display: inline-block;
            margin: 0;
            cursor: pointer;
            text-decoration: none;
            padding: 0;
            font-family: 'Gothic A1', sans-serif;
        }
        #rightBtnBox a:hover,
        #rightBtnBox button:hover{
            font-weight: bold;
        }
        #rightBtnBox a{
            width: 170px;
            border-right: 1px solid #c0bfbe;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div class="content_wrap">
<div id="content">
    <div id="tourPicBox" class="box_relative">
        <img src="<%=picS%>"/>
    </div>
    <div id="tourTitleBox">
        <!-- <h2>동현이와 함께하는 제주도 무박2일</h2> -->
        <h2><%=tour.getTitle() %></h2>
	        <h3><%=cityName %> · 투어</h3>
        <div id="tourScore">
            <div><img src="img/hive_default.png"/></div>
            <div><span><i class="far fa-comment-alt"> </i> 57</span></div>
        </div>
    </div><!-- //#tourTitleBox end -->

    <div id="topTabBox">
        <div>
        <ul>
            <li class="topTabList select">가이드 소개</li>
            <li class="topTabList">투어 소개</li>
            <li class="topTabList">필수 안내</li>
            <li class="topTabList">후기</li>
        </ul>
        <button id="topTabBtn" class="">위시리스트에 담기 <i class="far fa-heart"></i></button>
        </div>
    </div><!-- //#topTabBox end -->
    <div id="tourContent">
        <div id="tourLeftBox">
            <div id="beeIntroBox" class="left_box_content"><h4>가이드 소개</h4>
                <div id="userCard" class="tour_card">
                    <div id="userImgBox"><img src="img/gong.jpg"/></div>
                    <ul id="userBeeBox">
                        <li class="bee">
                        	<img src="/img/bee_tourBee%20.png" width="26" height="26"/>
                        </li>
                        <li class="bee">
                        	<img src="/img/bee_koBee%20.png" width="26" height="26"/>
                        </li>
                        <li class="bee">
                        	<img src="/img/bee_honeyBee.png" width="26" height="26"/>
                        </li>
                        <li class="bee">
                        	<img src="/img/bee_bumbleBee.png" width="26" height="26"/>
                        </li>
                        <li class="bee">
                        	<img src="/img/bee_wasp%20.png" width="26" height="26"/>
                        </li>
                    </ul>
                    <div id="userName"><i class="fas fa-female"></i><span id="age"> 25 / </span><em
                            id="nameText">공승연</em>
                    </div>
                    <div id="shortIntroBox">이런이런이런 !!!!아즈아아즈아아즈아~!</div>

                    <ul id="contactBox">
                        <li>메일</li>
                        <li>페이스북</li>
                        <li>인스타그램</li>
                        <li>트위터</li>
                    </ul>

                    <div id="beeHeartBtn"><i class="far fa-heart"></i></div>
                    <div id="scoreBox">
                        <div>
                            <div><img src="img/hive_default.png"/></div>
                            <div><span><i class="far fa-comment-alt"> </i> 5700</span></div>
                        </div>
                        <div>
                            <div><img src="img/hive_default.png"/></div>
                            <div><span><i class="far fa-comment-alt"> </i> 57</span></div>
                        </div>
                    </div><!-- //#scoreBox end -->

                </div><!-- #userCard end -->
            </div><!--end #beeIntroBox-->
            <div id="tourIntroBox" class="left_box_content"><h4>투어 소개</h4>
                <ul id="tourIntroCard" class="tour_card">
                    <li><img src="img/mo.png"/>
                        <p class="tour_intro_title">소요시간</p><%=tour.getTotalTime()/60 %> 시간
                    </li>
                    <li><img src="img/meet.png"/>
                        <p class="tour_intro_title">만나는시간</p><%=tour.getStartTime()/100 %>:00~<%=tour.getEndTime()/100 %>:00
                    </li>
                    <li><img src="img/food.png"/>
                        <p class="tour_intro_title">음식</p><%=eatTime/60 + ((double)eatTime%60/60) %>시간
                    </li>
                    <li><img src="img/lang.png"/>
                        <p class="tour_intro_title">언어</p><%=avalLangCnt %>개 국어
                    </li>
                    
                    <li><img src="img/car.png"/>
                        <p class="tour_intro_title">이동수단</p><%=moveTime/60 + ((double)moveTime%60/60) %>시간
                    </li>
                </ul>
                <div id="tourIntro">
                    <p id="tourIntroTitle"><%=tour.getTitle() %></p>
                    <div id="tourIntroContent">
                    	<%=tour.getTourInfo() %>
                    </div><!-- //#tourIntroContent end -->
                </div><!-- //#tourIntro end -->
            </div><!-- //#tourIntroBox end -->
            <div id="tourCourseBox" class="left_box_content"><h5>코스 설명</h5>
                <div id="meetAreaBox">
                    <h5><%=tour.getMeetPoint() %></h5>
                    <div class="left_box" id="daumMap"></div>
                    <div class="right_box"><img src="<%=picS%>"/></div>
                </div>
                <!--코스 템플릿 예상-->
                <% for(Course course: list){ %>
                <div class="courseBox">
                    <h5><%=course.getTitle() %></h5>
                    <p>
                        <!-- <span class="category">음식·한식</span> -->
                        <span class="category"><%=course.getCategory() %></span>
                        <span class="time_span">소요시간 : <%=course.getDemandTime()/60 + ((double)course.getDemandTime()%60/60) %>시간</span>
                    </p>
                    <div class="left_box"><img src="<%=course.getFileName()%>"/></div>
                    <div class="right_box"><p><%=course.getContent() %></p></div>
                </div>
                <%} %>
                <!--코스 템플릿-->
            </div><!-- //#tourCourseBox end -->
            <div id="tourGuidanceBox" class="left_box_content"><h4>필수 안내</h4>
                <ul id="tourGuidance">
                <%for(TourTerm tourTerm: list2){ %>
                	<%if(tourTerm.getType().equals("M")){ %>
                    <li><%=tourTerm.getContent() %></li>
                    <%} %>
				<%} %>
                </ul>
            </div><!-- //#tourGuidanceBox end -->
        </div><!--//end #tourLeftBox-->
        
        
        <div id="tourRightBox">
        <form method="POST" action="/paymentForm.jsp">
        <fieldset>
        	<legend class="screen_out">오른쪽 박스</legend>
        	<input type="hidden" name="noTour" value="<%=noTour%>"/>
        	<input type="hidden" name="cityName" value="<%=cityName %>"/>
        	<input type="hidden" name="titleTour" value="<%=tour.getTitle() %>"/>
        	<input type="hidden" name="tourPrice" value="<%=tour.getPrice()%>"/>
        	<input type="hidden" name="picS" value="<%=picS%>"/>
        	<input type="hidden" name="meetPoint" value="<%=tour.getMeetPoint() %>"/>           	
            <div id="tourPriceBox">
                <div id="tourPriceText">&#8361; <em><%=tour.getPrice() %></em></div>
                <span>/1인</span>
                <div id="tourMaxText">최대 <%=tour.getMaximum() %>명</div>
            </div>
            <div id="tourCalender">

            </div>
            <div id="tourSelectDate">

            </div>
            <div id="tourUserSelect">
                <h4 class="right_title">인원선택</h4>
                <div id="selectBox">
                    <select id="giveNumGender">
                        <option>남</option>
                        <option>여</option>
                    </select>
                    <select id="giveNumAge">
                        <option>10미만</option>
                        <option>10대</option>
                        <option>20대</option>
                        <option>30대</option>
                        <option>40대</option>
                        <option>50대</option>
                        <option>60대</option>
                        <option>70이상</option>
                    </select>
                    <button type="button"><i class="fas fa-minus"></i></button>
                    <input value="1" id="giveNumCount">
                    <button type="button"><i class="fas fa-plus"></i></button>
                    <button id="addUser" type="button">추가하기</button>
                </div> <!--//end #selectBox-->
                <ul id="selectContent">
                    <!--생성되는 템플릿-->
                    <script type="text/template" id="addSelectUser">
                        <li><@=user.user@>
                            <button><i class="far fa-times-circle"></i></button>
                        </li>
                    </script>
                </ul>
            </div><!-- //#tourUserSelect end -->
            <div id="rightList">
                <h4>포함사항</h4>
                <ul id="includedList" class="right_list_ul">
                <%for(TourTerm tourTerm: list2){ %>
                	<%if(tourTerm.getType().equals("I")){ %>
                    <li><%=tourTerm.getContent() %></li>
                    <%} %>
				<%} %>
                </ul>
                <h4>불포함사항<span>(여행자 부담)</span></h4>
                <ul id="notIncludedList" class="right_list_ul">
                <%for(TourTerm tourTerm: list2){ %>
                	<%if(tourTerm.getType().equals("E")){ %>
                    <li><%=tourTerm.getContent() %></li>
                    <%} %>
				<%} %>
                </ul>
            </div><!-- //#rightList end -->
            <div id="rightTotalPrice"><span>총 금액 &#8361; :</span><span>19,878</span></div>
            <div id="rightBtnBox">
                <a href="#" class="right_bottom_btn"><i class="far fa-comments"></i>메세지보내기</a>
                <button class="right_bottom_btn" type="submit"><span>&#8361;</span>결제하기</button>
            </div>
            </fieldset><!-- fieldset end -->
            </form><!-- form end -->
        </div><!-- //#tourRightBox end -->
    </div><!-- //#tourContent end -->
    
    <div id="tourReviewBox">
    	<h4>후기<em>(40)</em></h4>
    
    
    </div><!-- //#tourReviewBox end -->
	    
</div><!-- //#content end -->
</div><!-- //.content_wrap end -->

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

    <div class="review_box">
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
                <div class="review_num value"><i class="far fa-comment-alt"></i> 10개</div>
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
    </div><!-- //.review_box end -->

	</script>	
<%@ include file="/WEB-INF/template/footer.jsp" %>  
<script src="js/underscore-min.js"></script>
<script src="js/jquery.js"></script>
<script src="/js/fix-footer.js"></script>
<script src="/js/tui-chart-all.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a7b0ce1d3ae300dc78f74818909e4d9&libraries=services"></script>
<script>

	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};

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

    $(".navigator").css("right",right-74);
}

setFixedPosition();

$(".hive_img").hover(function () {
    $(".review_hover_box").toggle();
});//


//alert("크크");

$("#tourReviewBox").on("click",".review_photos",function () {
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

var tmp = _.template($("#replayTmp").html());
for(var i = 0 ; i<3 ; i++) {

    $("#tourReviewBox").append(tmp());

}//for() end

///////////////////////////////

/*     var replayTmp = _.template($('#replayTmp').html());
    var i;
    for(i=0; i<7; i++){
        $('#tourReviewBox').append(replayTmp);
    } */

    $('#topTabBox button').click(function () {
        if ($(this).children(1).hasClass('far')) {
            $(this).children(1).removeClass('far').addClass('fas');
        } else {
            $(this).children(1).removeClass('fas').addClass('far');
        }
        $(this).toggleClass('heart');
    });
    $('#beeHeartBtn').click(function () {
        if ($(this).children(1).hasClass('far')) {
            $(this).children(1).removeClass('far').addClass('fas');
        } else {
            $(this).children(1).removeClass('fas').addClass('far');
        }
        $(this).toggleClass('heart');
    });

    $('.fa-minus').click(function () {
        var value = $('#giveNumCount').val() - 1;
        $('#giveNumCount').val(value);
    });
    $('.fa-plus').click(function () {
        var value = $('#giveNumCount').val() - (-1);
        $('#giveNumCount').val(value);
    });

    //우측 인원 템플릿
    var tempAddUser = _.template($('#addSelectUser').html());
    $('#addUser').click(function () {
        var usercontent = '' + $('#giveNumAge').val() + ', ' + $('#giveNumGender').val() + ', ' + $('#giveNumCount').val();
        var user = {user: usercontent};
        $('#selectContent').append(tempAddUser({"user":user}));
        $('#selectContent').append("<input type='hidden' name= 'giveNumGender' value='"+ $('#giveNumAge').val() +"'>");
        $('#selectContent').append("<input type='hidden' name= 'giveNumAge' value='"+ $('#giveNumGender').val() +"'>");
        $('#selectContent').append("<input type='hidden' name= 'giveNumCount' value='"+ $('#giveNumCount').val() +"'>");
        rightBoxHeight = $('#tourRightBox').height();
    });
    $('#selectContent').on('click', "button", function () {
        $(this).parent().remove();
        rightBoxHeight = $('#tourRightBox').height();
    });

    /**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

    var tabTop = $('#topTabBox').offset().top;
    var h4Top1 =$('h4').eq(0).offset().top-50;
    var h4Top2 =$('h4').eq(1).offset().top-50;
    // alert(h4Top2);
    var h4Top3 =$('h4').eq(2).offset().top-50;
    var h4Top4 =$('h4').eq(6).offset().top-50;
    // alert(h4Top3);
    //우측 바 초기 값 top
    var rightBox=$('#tourRightBox').offset().top;
    var rightBoxHeight = $('#tourRightBox').height();
    var tourReviewTop =$('#tourReviewBox').offset().top;
    var rightBoxtop;
    
    
    $(window).scroll(function () {
        // 스크롤 높이
        var sTop = $(this).scrollTop();
        var rightBox2=$('#tourRightBox').offset().top;
        //우측 바 고정
        if(tourReviewTop<sTop+rightBoxHeight+50){

        }else if(sTop+50>=rightBox){
            rightBoxtop = sTop-rightBox+50;
            $("#tourRightBox").css("top", rightBoxtop);
        }else{
            $("#tourRightBox").css("top", "0");
        }
        // alert($('#topTabBox').offset().top);
        //상단 고정

        if(sTop>=tabTop){
            $('#topTabBox>div').css("position","fixed");
        }else {
            $('#topTabBox>div').css("position","relative");
        }
        // 상단고정탭 변화
        if(h4Top2>=sTop){
            $('li.topTabList').removeClass('select');
            $('li.topTabList').eq(0).addClass('select');
        }else if(h4Top2<sTop && h4Top3>=sTop){
            $('li.topTabList').removeClass('select');
            $('li.topTabList').eq(1).addClass('select');
        }else if(h4Top3<sTop && h4Top4>=sTop){
            $('li.topTabList').removeClass('select');
            $('li.topTabList').eq(2).addClass('select');
        }else if(h4Top4<sTop){
            $('li.topTabList').removeClass('select');
            $('li.topTabList').eq(3).addClass('select');
        }
        
        
        
        
        /*
        var topTab = $('#topTabBox').offset();
        if(nowTop>=)*/
        
        
        ////////나리추가
        //브라우저의 높이
		var wTop = $(window).height();

		//문서의 높이
		var dTop = $(document).height();

		if ((dTop - 350) <= wTop + sTop) {

    		//언더스코어 템플릿을 이용해서 추가
    		for (var i = 0; i < 20; i++) {

        		$("#tourReviewBox").append(tmp());

        		var charArea = $(".chart-area:last").get(0);

        		tui.chart.barChart(charArea, data, options);

    		}//for() end
		}//if end
        
    });//window scroll() end

    $('#topTabBox li').click(function () {
        var index =$(this).index();
        if(index == 0){
            $('html').animate({scrollTop:h4Top1},100);
        }else if(index == 1){
            $('html').animate({scrollTop:h4Top2+1},100);
        }else if(index == 2){
            $('html').animate({scrollTop:h4Top3+1},100);
        }else if(index ==3){
            $('html').animate({scrollTop:h4Top4+1},100);
        }
        
    });//#topTabBox li click() end

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

    ///////////////////////////////////



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


    $(".chart-area").each(function () {
        // var container = document.querySelector('.chart-area');
        var chart = tui.chart.barChart(this, data, options);

        console.log(chart);

    });

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

    $('.header_left a').eq(3).addClass('on');

    var mapContainer = document.getElementById('daumMap'), // 지도를 표시할 div
   
    /*좌표 넣기  */
    mapOption = {
    center: new daum.maps.LatLng(<%=lat%>, <%=lng%>), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
    };

    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    //var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);
    var markerPosition = new daum.maps.LatLng(<%= lat%>, <%= lng%>);

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
    position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);


</script>
</body>
</html>  
    
