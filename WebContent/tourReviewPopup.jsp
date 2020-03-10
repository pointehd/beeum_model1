<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>tour_review_popup</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>
    #tourPopup {
        background: rgba(0,0,0,.8);

    }
    .full {
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        position: fixed;
    }

    #tourPopupView {
        width: 900px;
        height: 650px;
        background: white;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -450px;
        margin-top: -325px;
        border-radius: 10px;
    }
    #tourView {
        width: 800px;
        height:300px;
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
    #assessment1 {
        width: 280px;
        height: 50px;
        /*background: #4AB1E9;*/
        /*opacity: .5;*/
        position: absolute;
        top:0;
        left: 520px;
        /*border: solid #424242 1px;*/
    }
    #assessment2 {
        width: 280px;
        height: 50px;
        /*background: #4AB1E9;*/
        /*opacity: .5;*/
        position: absolute;
        top:60px;
        left: 520px;
        /*border: solid #424242 1px;*/
    }
    #assessment3 {
        width: 280px;
        height: 50px;
        /*background: #4AB1E9;*/
        /*opacity: .5;*/
        position: absolute;
        top:120px;
        left: 520px;
        /*border: solid #424242 1px;*/
    }
    #assessment4 {
        width: 280px;
        height: 50px;
        /*background: #4AB1E9;*/
        /*opacity: .5;*/
        position: absolute;
        top:180px;
        left: 520px;
        /*border: solid #424242 1px;*/
    }
    #assessment5 {
        width: 280px;
        height: 50px;
        /*background: #4AB1E9;*/
        /*opacity: .5;*/
        position: absolute;
        top:240px;
        left: 520px;
        /*border: solid #424242 1px;*/
    }
    .assessment_info {

        width: 70px;
        height: 50px;
        /*background: blue;*/
        position: absolute;
        left: 0;
        border: 1px solid lightgray;
        border-radius: 10px;
        line-height: 50px;
        text-align: center;
    }
    .assessment_bar {
        width:200px;
        height: 50px;
        /*background: red;*/
        position: absolute;
        /*border: solid #424242 1px;*/
        right:0;

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
    #closeTourPopupButton {
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
    #tourDoneButton {
        right: 50px;
    }

    #tourPopupName {
        width: 250px;
        height: 50px;
        /*background: #999999;*/
        position: absolute;
        font-size: 30px;
        text-align: center;
        line-height: 50px;
        top: 25px;
        left: 25px;

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
        overflow-y: scroll;
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
    .bar_place {
        width: 180px;
        margin-left: 10px;
    }

    #picUpload:hover {
        background: #aaaaaa;
        cursor: pointer;
    }

    .off {
        display: none;
    }

/****************************************************************/


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

    .bar_val_view {
        border: none;
        margin-left: 10px;
    }


</style>
<body>

<div id="tourPopup" class="full">
    <div id="tourPopupView">
        <button id="closeTourPopupButton" class="view_button"><i class="fas fa-times"></i></button>
        <div id="tourPopupName">투어 후기 작성</div>
        <div id="tourView">

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
                <div id="assessment1">
                    <div class="assessment_info">코스</div>
                    <div class="assessment_bar">
                        <input class="bar_val_view" type="text" id="bar1Val" value="50" readonly>
                        <input type="range" name="bar1" min="0" max="100" id="bar1" class="bar_place" onchange="setValue1(this.value)">
                    </div>
                </div>
                <div id="assessment2">
                    <div class="assessment_info">가격</div>
                    <div class="assessment_bar">
                        <input class="bar_val_view" type="text" id="bar2Val" value="50" readonly>
                        <input type="range" min="0" max="100" id="bar2" class="bar_place" onchange="setValue2(this.value)">
                    </div>
                </div>
                <div id="assessment3">
                    <div class="assessment_info">언어</div>
                    <div class="assessment_bar">
                        <input class="bar_val_view" type="text" id="bar3Val" value="50" readonly>
                        <input type="range" min="0" max="100" id="bar3" class="bar_place" onchange="setValue3(this.value)">
                    </div>
                </div>
                <div id="assessment4">
                    <div class="assessment_info">투어일치</div>
                    <div class="assessment_bar">
                        <input class="bar_val_view" type="text" id="bar4Val" value="50" readonly>
                        <input type="range" min="0" max="100" id="bar4" class="bar_place" onchange="setValue4(this.value)">
                    </div>
                </div>
                <div id="assessment5">
                    <div class="assessment_info">매너</div>
                    <div class="assessment_bar">
                        <input class="bar_val_view" type="text" id="bar5Val" value="50" readonly>
                        <input type="range" min="0" max="100" id="bar5" class="bar_place" onchange="setValue5(this.value)">
                    </div>
                </div>
            </div>

        </div>

        <div id="inputPlace">
            <div id="inputText">
                <textarea required></textarea>

            </div>
            <div id="picUpload">

            </div>
        </div>



        <button id="tourDoneButton" class="picture_button">작성 완료</button>
    </div>

    </div><!--//fullPicture end-->


</div>

<!-------------------------------------------------->





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
                <!--<img class="small_img" src="img/k7.png"/>-->
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

    document.getElementById("bar1").step = "25";
    document.getElementById("bar2").step = "25";
    document.getElementById("bar3").step = "25";
    document.getElementById("bar4").step = "25";
    document.getElementById("bar5").step = "25";

    function setValue1(val) {
        document.getElementById("bar1Val").value = val;
    }
    function setValue2(val) {
        document.getElementById("bar2Val").value = val;
    }
    function setValue3(val) {
        document.getElementById("bar3Val").value = val;
    }
    function setValue4(val) {
        document.getElementById("bar4Val").value = val;
    }
    function setValue5(val) {
        document.getElementById("bar5Val").value = val;
    }





    $("#bar1").change(function () {
       $("#bar1").val();
    });


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

        if(x == -(changeWidth -800)) {
            return;
        }
        x = x + -200;
        $("#pictures").css("left", x);
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
    $("#closeTourPopupButton").click(function () {
        $("#tourPopup").hide();
    });
</script>

</body>
</html>