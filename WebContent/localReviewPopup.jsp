<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>local_review_popup</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>
    #reviewPopup {
        background: rgba(0,0,0,.8);

    }
    .full {
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        position: fixed;
    }

    #reviewPopupView {
        width: 900px;
        height: 500px;
        background: white;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -450px;
        margin-top: -250px;
        border-radius: 10px;
    }
    #reviewView {
        width: 800px;
        height:150px;
        /*background: #e4e3e2;*/
        position: relative;
        top: 75px;
        left: 50px;
    }
    #profile {
        width: 200px;
        height: 150px;
        /*background: red;*/
        position: absolute;
    }
    /*#profile img {*/
        /*width: 200px;*/
        /*height: 150px;*/
        /*border: solid #424242 1px;*/
    /*}*/
    #proPic {
        width: 200px;
        height: 150px;
        border: 1px solid lightgray;
        border-radius: 10px;
    }
    #level {
        width: 300px;
        height: 75px;
        /*background: blue;*/
        position: absolute;
        top: 0;
        left: 210px;
    }
    .bee_level {
        width: 50px;
        height: 50px;
        /*background: red;*/
        position: absolute;
        top: 0;
        /*border: solid #424242 1px;*/

    }
    #bee1 {
        left: 0px;
    }
    #bee2 {
        left: 60px;
    }
    #bee3 {
        left: 120px;
    }
    #bee4 {
        left: 180px;
    }
    #bee5 {
        left: 240px;
    }
    .bee_level img {
        width: 50px;
        height: 50px;
    }


    #name {
        width: 300px;
        height: 75px;
        /*background: lawngreen;*/
        position: absolute;
        top: 75px;
        left: 210px;
        line-height: 120px;
        font-size: 20px;
    }
    #assessment {
        width: 280px;
        height: 150px;
        /*background: #4AB1E9;*/
        /*opacity: .5;*/
        position: absolute;
        top:0;
        left: 520px;
        /*border: solid #424242 1px;*/
    }


    /*#veryGood {*/
        /*width: 50px;*/
        /*height: 50px;*/
        /*!*background: blue;*!*/
        /*position: absolute;*/
        /*bottom: 0;*/
        /*border: solid #424242 1px;*/
    /*}*/
    /*#good {*/
        /*width: 50px;*/
        /*height: 50px;*/
        /*!*background: blue;*!*/
        /*position: absolute;*/
        /*bottom: 0;*/
        /*left: 56px;*/
        /*border: solid #424242 1px;*/
    /*}*/
    /*#soso {*/

        /*width: 50px;*/
        /*height: 50px;*/
        /*!*background: blue;*!*/
        /*position: absolute;*/
        /*bottom: 0;*/
        /*left: 112px;*/
        /*border: solid #424242 1px;*/
    /*}*/
    /*#bad {*/

        /*width: 50px;*/
        /*height: 50px;*/
        /*!*background: blue;*!*/
        /*position: absolute;*/
        /*bottom: 0;*/
        /*left: 168px;*/
        /*border: solid #424242 1px;*/
    /*}*/
    /*#veryBad {*/

        /*width: 50px;*/
        /*height: 50px;*/
        /*!*background: blue;*!*/
        /*position: absolute;*/
        /*bottom: 0;*/
        /*left: 224px;*/
        /*border: solid #424242 1px;*/
    /*}*/




    .view_button {
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
    .view_button:hover, .picture_button:hover {
        background: #FAE100;
        cursor: pointer;
        font-weight: bold;
    }
    #closeReviewPopupButton {
        top: 15px;
        right: 15px;
    }
    .picture_button {
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
    #reviewDoneButton {
        right: 50px;
    }

    #reviewPopupName {
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

    #inputPlace {
        width: 800px;
        height:190px;
        /*background: #e4e3e2;*/
        position: relative;
        top: 75px;
        left: 50px;
        margin-top: 10px;
    }
    #picUpload {
        width: 190px;
        height: 190px;
        /*background: red;*/
        position: absolute;
        right: 0;
        top:0;
        border: 1px solid lightgray;
        border-radius: 10px;
    }
    #inputPlace textarea {
        width: 590px;
        height: 180px;
        border: 1px solid lightgray;
        overflow-y: scroll;
    }
    #picUpload:hover {
        background: #aaaaaa;
        cursor: pointer;
    }

    .off {
        display: none;
    }




    /*********************************/



    #picturePopup, #fullPicturePopup {
        background: rgba(0,0,0,.6);

    }
    .full {
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        position: fixed;
    }

    #picturePopupView {
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
    #pictureView {
        width: 800px;
        height: 200px;
        background: #e4e3e2;
        position: relative;
        top: 75px;
        left: 50px;
        overflow: hidden;
    }
    #pictures {
        width: 1000px;
        height: 200px;
        background: #e4e3e2;
        position:absolute;
        left:0;
        transition: ease .5s;
    }
    #pictures div {
        float: left;
    }


    .view_button {
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
    .view_button:hover, .picture_button:hover {
        background: #FAE100;
        cursor: pointer;
        font-weight: bold;
    }
    #leftButton {
        top: 155px; /*350/2-40/2*/
        left: 5px;
    }
    #rightButton {
        top: 155px; /*350/2-40/2*/
        right: 5px;
    }
    #closePopupButton {
        top: 15px;
        right: 15px;
    }
    .picture_button {
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
    #addButton {
        position:absolute;
        right: 270px;
        bottom: 0px;
    }
    #doneButton {
        right: 50px;
    }

    #popupName {
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
    .img_box {
        position: relative;
        width:200px;
        height:200px;
    }
    .small_img {
        width: 200px;
        height: 200px;
    }
    .small_img:hover {
        opacity: .5;
        cursor: pointer;
    }
    .delete_button {
        position: absolute;
        top:5px;
        right:5px;
        background: #aaaaaa;
        border: none;
        border-radius: 50px;
    }
    .delete_button:hover {
        background: #FAE100;
        cursor: pointer;
    }


    #fullPicturePopup {

        display: none;
    }
    #fullPicture {
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

    #addButton input[type="file"] {
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0;
    }
    .radio_button {
        display: none;
    }

    .radio_button:checked+.radio_label {
        /*background: gold;*/
        /*font-weight: bold;*/
        color: #FAE100;
    }
    .radio_label {
        width: 50px;
        height: 50px;
        /*background: blue;*/
        position: absolute;
        bottom: 0;
        /*border: solid #424242 1px;*/
        cursor: pointer;
        text-align: center;
        line-height: 50px;
        font-size: 50px;
    }

    #vg {
        left: 0;
    }
    #g {
        left: 56px;
    }
    #s {
        left: 112px;
    }
    #b {
        left: 168px;
    }
    #vb {
        left: 224px;
    }


</style>
<body>

<div id="reviewPopup" class="full">
    <div id="reviewPopupView">
        <button id="closeReviewPopupButton" class="view_button"><i class="fas fa-times"></i></button>
        <div id="reviewPopupName">여행자 후기 작성</div>
        <div id="reviewView">

            <div id="profile">
                <div id="profilePic">
                    <img src="img/k1.png" id="proPic"/>
                </div>
                <div id="level">
                    <div class="bee_level" id="bee1"><img src="img/bee_tourBee%20.png"></div>
                    <div class="bee_level" id="bee2"><img src="img/bee_koBee%20.png"></div>
                    <div class="bee_level" id="bee3"><img src="img/bee_honeyBee.png"></div>
                    <div class="bee_level" id="bee4"><img src="img/bee_bumbleBee.png"></div>
                    <div class="bee_level" id="bee5"><img src="img/bee_wasp%20.png"></div>

                </div>
                <div id="name">김아무개</div>
                <div id="assessment">
                    <!--<div id="veryGood"></div>-->
                    <!--<div id="good"></div>-->
                    <!--<div id="soso"></div>-->
                    <!--<div id="bad"></div>-->
                    <!--<div id="veryBad"></div>-->

                    <input type="radio" name="assessment" id="veryGood" class="radio_button" value="veryGood" required/>
                    <label for="veryGood" class="radio_label" id="vg"><i class="far fa-grin-hearts"></i></label>

                    <input type="radio" name="assessment" id="good" class="radio_button" value="good" required/>
                    <label for="good" class="radio_label" id="g"><i class="far fa-laugh-beam"></i></label>

                    <input type="radio" name="assessment" id="soso" class="radio_button" value="soso" required/>
                    <label for="soso" class="radio_label" id="s"><i class="far fa-smile"></i></label>

                    <input type="radio" name="assessment" id="bad" class="radio_button" value="bad" required/>
                    <label for="bad" class="radio_label" id="b"><i class="far fa-frown"></i></label>

                    <input type="radio" name="assessment" id="veryBad" class="radio_button" value="veryBad" required/>
                    <label for="veryBad" class="radio_label" id="vb"><i class="far fa-angry"></i></label>





                </div>
            </div>

        </div>

        <div id="inputPlace">
            <div id="inputText">
                <textarea></textarea>

            </div>
            <div id="picUpload">

            </div>
        </div>



        <button id="reviewDoneButton" class="picture_button">작성 완료</button>
    </div>

    </div><!--//fullPicture end-->


</div>


<!------------------------------------------------------------------------------------->





<div id="picturePopup" class="full off">
    <div id="picturePopupView">
        <button id="closePopupButton" class="view_button"><i class="fas fa-times"></i></button>
        <div id="popupName"><i class="far fa-images"></i> 이미지 추가</div>
        <div id="pictureView">
            <div id="pictures">
                <!--<img class="small_img" src="img/pic2.png"/>-->
                <!--<img class="small_img" src="img/k2.png"/>-->
                <!--<img class="small_img" src="img/k4.png"/>-->
                <!--<img class="small_img" src="img/k5.png"/>-->
                <!--<div class="img_box">-->
                    <!--<img class="small_img" src="img/k7.png"/>-->
                    <!--<button class="delete_button">x</button>-->
                <!--</div>-->
            </div>


        </div>

        <div id="addButton">
            <label for="uploadImg" class="picture_button">업로드</label>
            <input type="file" id="uploadImg" accept="image/*" multiple required >
        </div>


        <!--<button id="addButton" class="picture_button">사진 추가</button>-->

        <button id="doneButton" class="picture_button">완료</button>
        <button id="leftButton" class="view_button"><i class="fas fa-angle-left"></i></button>
        <button id="rightButton" class="view_button"><i class="fas fa-angle-right"></i></button>
    </div>

</div><!--//fullPicture end-->


</div>

<div id="fullPicturePopup" class="full">
    <div id="fullPicture">

    </div>
</div>




<script src="js/underscore-min.js"></script>
<script src="js/jquery.js"></script>
<script>


    var imgFiles = [];

    var arrLength = 0;
    var changeWidth = 0;

    $(document).ready(function () {
        $("#uploadImg").on("change", ImgFilesView);
    });

    function ImgFilesView(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        arrLength = filesArr.length;
        changeWidth = changeWidth + (200 * arrLength);
        alert(changeWidth);
        $("#pictures").css("width", changeWidth);

        filesArr.forEach(function (e) {
            imgFiles.push(e);

            var reader = new FileReader();
            reader.onload = function (e) {
                var img_html = "<div class='img_box'><img class='small_img' src='" + e.target.result + "'/><button class='delete_button'>x</button></div>";
                $("#pictures").append(img_html);
            }
            reader.readAsDataURL(e);
        });
    }

    $("body").on("click", ".delete_button", function () {

        alert("ttt");
    });





    $("body").on("click", ".small_img", function () {
        var pic = $(this).attr("src");

        $("#fullPicture").css("background-image", "url('" + pic + "')");

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
    $("#doneButton").click(function () {
       $("#picturePopup").hide();
    });
    $("#closePopupButton").click(function () {
        $("#picturePopup").hide();
    });

    $("#closeReviewPopupButton").click(function () {
        $("#reviewPopup").hide();
    });

</script>

</body>
</html>