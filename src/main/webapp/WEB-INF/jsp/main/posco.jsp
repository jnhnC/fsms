<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css">
<link href="./bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >

<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>
<link href="./css/posco/posco.css" rel="stylesheet" >
<link rel="shortcut icon" type="image/x-icon" href=images/favicon.ico />


<head>
    <title>현진시닝 포스코 포스웰</title>
    <meta charset="utf-8" />
</head>
<body>
    <div id="posco">
    	<div id="sidebox" class="cursor upBtn">TOP</div>
   		<div>
   			<div>
   				<img src="./images/posco/header.png">
   			</div>
   			<div class="d-flex justify-content-center">
	   			<div id="phone" style="text-align:right;" >
	   				<img id="phoneImg" src="./images/posco/phone.png" style="">
	   			</div>
   			</div>
			<div id="menubarWrap" class="d-flex justify-content-around" >
				<div id ="menubar" class="d-flex justify-content-around ">
					<div id="" class="cursor" style="width:125px;"><img src="./images/posco/logoBtn.png" id="logoImg" class="upBtn"></div>
					<div class="cursor align-self-center" onclick="fnMove('fs')"><img src="./images/posco/fsBtn.png"></div>
					<div class="cursor align-self-center" onclick="fnMove('pp')"><img src="./images/posco/ppBtn.png"></div>
					<div class="cursor align-self-center" onclick="fnMove('pc')"><img src="./images/posco/pcBtn.png"></div>
					<div class="cursor align-self-center" onclick="fnMove('sc')"><img src="./images/posco/scBtn.png"></div>
					<div class="cursor align-self-center" onclick="fnMove('hu')"><img src="./images/posco/huBtn.png"></div>
				</div>
			</div>
			<div >
				<img src="./images/posco/main.png">
			</div>
			<div id="fs" >
				<img src="./images/posco/fs.png">
			</div>
			<div id="pp">
				<div>
					<img src="./images/posco/pp.png">
				</div>
				<div style="width:100%;" class="d-flex justify-content-center">
					<div id="videoBox"  style="background-color:#fefbf2;">
				    	<video id="video" src='./images/posco/poscoMp4.mp4' width='420'  controls muted autoplay loop class="py-4 pe-3"></video>
				    </div>
				</div>
			</div>
			<div id="pc" class="mt-5">
				<img src="./images/posco/pc.png">
			</div>
			<div id="sc" class="mt-5">
				<div>
					<img src="./images/posco/sc.jpg">
				</div>
				<div class="cursor">
					<!-- <a href="http://www.ehyunjin.com/web/mo/index.html?gv_Val='poswel"> -->
					<div onclick="mobileCheck()">
						<img src="./images/posco/sabyul.jpg">
					</div>
					<!-- </a> -->

				</div>
				<div class="mt-2 cursor">
					<a href="https://www.grapecenter.kr/">
							<img src="./images/posco/grape.jpg">
					</a>
				</div>
				<div>
					<img src="./images/posco/sc2.jpg">
				</div>
			</div>
			<div id="hu">
				<img src="./images/posco/bottom.png">
				<div id="homeImgBox" class="d-flex">
					<a href="http://www.hyunjinsn.com/main/">
						<img id="homeImg"  src="./images/posco/logoBtn.png" class="cursor" style="">
					</a>
				</div>
			</div>
   		</div>
    </div>

</body>
</html>

<script>

	function mobileCheck(){
		var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
		if(isMobile){
			  location.href = "http://www.ehyunjin.com/web/mo/index.html?gv_Val='poswel'";
		}else{
			alert("모바일로 접속해주세요!");
		}

	}


    function fnMove(name){
        var idName='#'+name;
        var offset = $(idName).offset();
        $('html, body').animate({scrollTop : offset.top-30}, 400);
    }

    function reflesh(){
        window.location.reload(true);
    };

    $("document").ready(function() {

        $(window).scroll(function() {
	         var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

	         if(position>100){
				$('#menubar').addClass("fixed");
	           }else{
	           	$('#menubar').removeClass("fixed");
           	}

            /*  $("#sidebox").stop().animate({"top":position+currentPosition+"px"},100); */

	         $('#sidebox').addClass("fixedTop");

        });


        $('.upBtn').click(function (e) {
            e.preventDefault();
            $('html, body').animate({scrollTop: 0}, 200);
          });


        var currentPosition = parseInt($("#sidebox").css("top"));

        $(window).scroll(function() {

          });



    });







</script>




