<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="../br/br001.jsp";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>FSMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1  user-scalable=no" />
<link rel="stylesheet" href="./css/component/swiper-bundle.min.css" />
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css">
<link href="./bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="./css/layout/main.css" rel="stylesheet" >
<link href="./css/layout/main.css" rel="stylesheet" >
<link href="./css/normalize.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="./js/priceComma.js"></script>
<script src="./js/validate.js"></script>

<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="./js/swiper-bundle.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href=images/favicon.ico />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- CSS only -->
<link rel="stylesheet" href="./css/component/loadingbar.css" />

<style>
/* @font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;


@font-face {
    font-family: 'BMEuljiro10yearslater';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/BMEuljiro10yearslater.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
 */
@font-face {
   font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
    font-weight: normal;
    font-style: normal;
}


</style>

	<style>

/* 		.content {
			width: 100%;
		}
 */
/* 		.menu {
			min-width:80px;
			width:170px;

		}
		.menu-button {
			position: absolute;
			top: 0px;
			left: 0px;

			color: #FF8C0A;
			font-size: calc(0.26vw + 16.08pt);
			padding:0px 8px;

		}

		.menu-button .bar:nth-of-type(1) {
			margin-top: 0px;
		}

		.menu-button .bar:nth-of-type(3) {
			margin-bottom: 0px;
		} */

	</style>

</head>


<body>
	<form id="form" name="form">
<%-- 		<div id="wrapper"  class="swiper-container">
			<div class="swiper-wrapper">
				<div id="sidebar" class="swiper-slide menu">
					<jsp:include page="sidebar.jsp" />
				</div>

				<div id="main" class="swiper-slide content">
					<div class="menu-button">
						<i class="bi bi-grid-3x3-gap-fill"></i>
					</div>
					<header id="header">
						<jsp:include page="header.jsp" />
					</header>

					<div id="content">
						<jsp:include page="<%=contentPage%>" />

					</div>


				</div>

			</div>
		</div> --%>


		<div id="wrapper"  class="">
			<div id="sidebar">
				<jsp:include page="sidebar.jsp" />
			</div>

			<div id="main" class="main">
			<!-- 	<div class="menu-button">
					<i class="bi bi-grid-3x3-gap-fill"></i>
				</div> -->
				<header id="header" class="main">
					<jsp:include page="header.jsp" />
				</header>

				<div id="content" class="main">
					<jsp:include page="<%=contentPage%>" />

				</div>

				<div class="mask">

				</div>
			</div>

		</div>

		<div class="loadingbar">
			<div class="loadingMask">
				<div class="spinner-border text-light" role="status">
			 		<span class="sr-only">Loading...</span>
				</div>
			</div>
		</div>


		<div id="alertBox" class="alert alert-danger" style="position:absolute;display:none;left:50%;width:80%;transform: translate(-50%);box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;text-align:center">
			<div><strong></strong></div>
		</div>

		<div id="confirmBox" class="alert alert-danger" style="position:absolute;display:none;left:50%;width:80%;transform: translate(-50%);box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;text-align:center">
			<div class="mt-4"><strong></strong></div>

			<div class="d-flex justify-content-end mt-5">
				<div class="me-2">
					 <button type="button" id="confirmYBtn" class=" btn btn-primary shadow-sm p-0">
						<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">확인</div>
				   	</button>
				</div>

				<div class="me-2">
					 <button type="button" id="confirmNBtn" class=" btn btn-secondary shadow-sm p-0">
						<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">취소</div>
				   	</button>
				</div>


			</div>
		</div>

	</form>
</body>
<script>

	var height = $( window ).height()+'px';
 	var menuButton = document.querySelector('.menu-button');

	var openMenu = function () {
		swiper.slidePrev();
	};

	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 'auto',
		initialSlide: 1,
		resistanceRatio: 0,
		slideToClickedSlide: true,
		on: {
			slideChangeTransitionStart: function () {
				var slider = this;
				if (slider.activeIndex === 0) {
					menuButton.classList.add('cross');
					// required because of slideToClickedSlide
					menuButton.removeEventListener('click', openMenu, true);
				} else {
					menuButton.classList.remove('cross');
				}
			}
			, slideChangeTransitionEnd: function () {
				var slider = this;
				if (slider.activeIndex === 1) {
					menuButton.addEventListener('click', openMenu, true);
				}
			},
		}
	});


	 /*경고창  type="primary:파랑색창 , danger:빨간색창" */
	 function alertBox(text, type){

		var top =  Number( $(document).scrollTop() ) + ( Number(window.innerHeight)/2 ) - 100;
		$('#alertBox').children("div").children("strong").html(text);
		$('#alertBox').css("display","");
		$('#alertBox').css("top",top);
		$('#alertBox').attr("class","alert alert-"+type);
		$('#alertBox').css("width","300px");
		setTimeout(function() {
			$('#alertBox').fadeOut( "slow" );
		},1700);
	 }

	 /* function confirmBox(text, type){
			var top =  Number( $(document).scrollTop() ) + ( Number(window.innerHeight)/2 ) - 100;
			$('#confirmBox').children("div").children("strong").html(text);
			$('#confirmBox').css("display","");
			$('#confirmBox').css("top",top);
			$('#confirmBox').attr("class","alert");
			$('#confirmBox').css("width","300px");
			$('#confirmBox').css("background-color","white");
		 } */



	var phoneForm =  function(number){
		 return number.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");

	 }


	var numberWithCommas =  function(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}





</script>
</html>

