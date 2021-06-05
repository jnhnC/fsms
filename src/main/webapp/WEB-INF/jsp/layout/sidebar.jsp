<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="./css/layout/sidebar.css" rel="stylesheet" >

	<nav class="nav-side" >
		<div id="sidebar-content">
			<div class="sidebar-brand" onclick="changeContents('/index')">
		    	<div><img src="./images/icon_logo.png"></img></div>
		    	<div id="band-text">현진시닝</div>
		    </div>

		    <div class="sidebar-menu">
		<%-- 		<ul>
					<c:forEach var="categroies" items="${categroies}">
						<li class="sidebar-item">
							<div class="sidebar-link">
				              	<span class="align-middle"><i class="bi bi-layout-text-sidebar "></i> <c:out value="${categroies.menuName}" /> </span>
			            		<span><i class="bi bi-caret-up-fill"></i></span>
							</div>
							<ul id="" class="sidebar-dropdown" style="">
								<c:forEach var="menues" items="${menues}">

								<c:if test="${categroies.menuId eq menues.paMenuId}">
									<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/1')"><c:out value="${menues.menuName}" /></a></li>
								</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul> --%>

				<ul class="m-menu">
					<li class="sidebar-item">
						<div class="sidebar-link">
			              	<span class="align-middle "> 모바일메뉴 </span>
		            		<span class=""><i class="bi bi-caret-up-fill"></i></span>
		            	</div>
		            	<ul id="" class="sidebar-dropdown" style="">
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./tm')"><i class="bi bi-caret-right me-1"></i> 팀장배정</a></li>
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./tc')"><i class="bi bi-caret-right me-1"></i> 유선상담</a></li>
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./ex')"><i class="bi bi-caret-right me-1"></i> 출고처리</a></li>
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./mg')"><i class="bi bi-caret-right me-1"></i> 관리사일지</a></li>
							<!-- <li class="sub-item"><a class="sidebar-link" onclick="changeContents('/mobile/dispatchReqSearchContent')"><i class="bi bi-truck"></i> 배차요청접수</a></li>
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/mobile/dispatchSearchContent')"><i class="bi bi-skip-forward-btn"></i> 배차접수</a></li>
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/mobile/driveRegSearchContent')"><i class="bi bi-plus-square-fill"></i> 운행등록</a></li> -->
						</ul>

			       		<!-- <ul id="" class="sidebar-dropdown" style="">
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/mobile/callSearchContent')"><i class="bi bi-headset"></i> 유선상담</a></li>
						</ul> -->
					</li>

				</ul>

				<ul class="t-menu">
				<li class="sidebar-item">
					<div class="sidebar-link ">
		              	<span class="align-middle">태블릿메뉴 </span>
	            		<span><i class="bi bi-caret-up-fill"></i></span>
	            	</div>
	            	<ul id="" class="sidebar-dropdown" style="">
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./ex')"><i class="bi bi-caret-right me-1"></i> 출고처리</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./ps')"><i class="bi bi-caret-right me-1"></i> 상품선택</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./pa')"><i class="bi bi-caret-right me-1"></i> 품목추가</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./paa')"><i class="bi bi-caret-right me-1"></i> 품목추가승인</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./cr')"><i class="bi bi-caret-right me-1"></i> 상담결과등록</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./fd')"><i class="bi bi-caret-right me-1"></i> FD일지</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./mg')"><i class="bi bi-caret-right me-1"></i> 관리사일지</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./ad')"><i class="bi bi-caret-right me-1"></i> 추가/공제등록</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./cp')"><i class="bi bi-caret-right me-1"></i> 고객결제</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('./fc')"><i class="bi bi-caret-right me-1"></i> 최종점검</a></li>
					</ul>

			 	<!-- 	<ul id="" class="sidebar-dropdown" style="">
							<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/customSignSearchContent')"><i class="bi bi-brush"></i> 고객서명</a></li>
					</ul> -->

				</li>

			</ul>

			</div>

		</div>
	</nav>
<script>
function changeContents(url){
     $.ajax({
        type: "get",
        url : url,
        dataType: 'html',
        data: $("#form").serialize(), //보낼데이터
        success : function(data){
        	  $("#content").children().remove();
              $("#content").html(data);
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
       });

}

$('.sidebar-link').click(function(){
	 $(this).next('.sidebar-dropdown').slideToggle(100);
	 $(this).find('.bi-caret-up-fill').toggleClass("rotate");
});

$('.sidebar-item').click(function(){
 	 $(this).addClass("active").siblings().removeClass("active");

});

$('.sub-item').click(function(){
	/* const swiper = document.querySelector('.swiper-container').swiper;
	swiper.slideNext(); */
	$('.sub-item').siblings().removeClass("active");
 	$(this).addClass("active");

  	activeMenu();

});


$('.sidebar-brand').click(function(){
	/* const swiper = document.querySelector('.swiper-container').swiper;
	swiper.slideNext(); */
	$('.sidebar-item').removeClass("active");
	$('.sub-item').removeClass("active");
	$('#menu-nav span').css("display","none");

});





</script>
