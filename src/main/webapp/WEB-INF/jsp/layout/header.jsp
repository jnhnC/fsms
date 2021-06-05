<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="./css/layout/header.css" rel="stylesheet" >



<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 	<nav class="navbar navbar-light bg-light justify-content-between">
		<div class="header-contents">
			<div class="hearder-item align-self-center" id="menuicon" onClick="activeMenu();">
				<i class="bi bi-list h2"></i>
			</div>

			<div class="hearder-item align-self-center">
				<div id="menu-nav">
					<span>기본메뉴</span><span> ></span><span>팀장배정</span>
				</div>
			</div>


			<div class="hearder-item align-self-center" >
				<div id="homeBtn" onclick="changeContents('/home')"><i class="bi bi-house-door-fill"></i></div>
				<div id="dropContent">
					<div id="dropBtn" class="dropBtn dropBtnBox">
						<span class="dropBtnBox"><i class="bi bi-person-circle"></i></span>
						<span class="dropBtnBox">홍길동</span>
						<span ><i class="bi bi-caret-down-fill dropBtnBox"></i></span>
					</div>
					<ul id="dropmenu" >
						<li> <a class="" href="#">암호변경</a></li>
						<li> <a class="" href="#">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav> -->
	<div id="header-contents">


		<div class="item " id="menuBtn" onClick="activeMenu()">
		 	<i class="bi bi-grid-3x3-gap-fill"></i>
			<div id="menu-nav" style="font-size: calc(0.26vw + 10.08pt);"></div>
		</div>


		<div class="item" id="funcBtn">
			<div class="hearder-item" >
				<div id="homeBtn" onclick="changeContents('index')"><i class="bi bi-house-door-fill"></i></div>
				<div id="dropContent">
					<div id="dropBtn" class="dropBtn dropBtnBox"  onclick="checkConfirm()">
						<span class="dropBtnBox"><i class="bi bi-person-circle"></i></span>
						<span class="dropBtnBox">홍길동 <!-- <i class="bi bi-caret-down-fill dropBtnBox"></i> --></span>
					</div>

				</div>
			</div>
		</div>
	</div>


<script>
	 activemenu = 1;
	function activeMenu(){
		if(activemenu == 0){
			$("#sidebar>nav #sidebar-content").css("display","none");
			$("#sidebar").removeClass('show');
			activemenu = 1;

			$(".mask").css("display","none");

		}else{
			$("#sidebar>nav #sidebar-content").css("display","block");
			$("#sidebar").toggleClass('show');
			activemenu = 0;

			setTimeout(function(){
				$(".mask").css("width",$('#main').width());
				$(".mask").css("height","100%");
				$(".mask").css("display","block");
			},400)
		}
	}

	$('#dropBtn').click(function(){
		$('#dropmenu').toggleClass("show");
	});

	$('#homeBtn').click(function(){
		$('.sidebar-item').removeClass("active");
		$('.sub-item').removeClass("active");


	});


	var checkConfirm = function (){
		var result = confirm('마이페이지로 이동하시겠습니까?');

		if(result) {
			changeContents('myPage');
		} else {

		}

	};


	$("#header-contents").click(function(e){
		if (!$(e.target).hasClass("dropBtnBox")) {
			if($('#dropmenu').hasClass("show")){
				 $('#dropmenu').removeClass("show");
			}
	   	}

	});


	$("#wrapper").click(function(e){
		if ($(e.target).hasClass("mask")) {
			if(activemenu == 0){
				activeMenu();
			}
		}else{
		}

	});







</script>

