<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<nav class="nav-side" >
		<div>
			<div class="sidebar-brand" onclick="changeContents('/home')">
		      <div class="align-middle"><img src="/images/icon_logo.png"></img></div>
		      <div id="band-text"> 현진시닝</div>
		    </div>

		    <div class="sidebar-menu">

			<ul>
				<c:forEach var="categroies" items="${categroies}">
					<li class="sidebar-item">
						<a href="#" class="sidebar-link">
			              	<span class="align-middle"><i class="bi bi-layout-text-sidebar"></i> <c:out value="${categroies.menuName}" /> </span>
		            		<span><i class="bi bi-caret-up-fill"></i></span>
						</a>
						<ul id="" class="sidebar-dropdown" style="">
				<c:forEach var="menues" items="${menues}">

				<c:if test="${categroies.menuId eq menues.paMenuId}">
					<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/1')"><c:out value="${menues.menuName}" /></a></li>
				</c:if>
				</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>

			<ul>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-layout-text-sidebar"></i> 기본메뉴 </span>
	            		<span><i class="bi bi-caret-up-fill"></i></span>
	            	</a>
	            	<ul id="" class="sidebar-dropdown" style="">
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/mobile')">팀장배정</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/2')">상품조회</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/3')">출고처리</a></li>
						<li class="sub-item"><a class="sidebar-link" onclick="changeContents('/4')">고객상담</a></li>
					</ul>

				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-truck"></i>PKG</span>
		              	<span><i class="bi bi-caret-up-fill"></i></span>
	            	</a>
	            	<ul id="" class="sidebar-dropdown" style="">
						<li class="sub-item"><a class="sidebar-link" href="#">상당등록</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">FD일지</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">관리등록</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">추가판매</a></li>
					</ul>

				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-calendar2-fill"></i>지원</span>
	            	</a>
	            	<ul id="" class="sidebar-dropdown" style="">
						<li class="sub-item"><a class="sidebar-link" href="#">고객상담</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">상담등록</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">FD일지</a></li>
					</ul>
				</li>

			</ul>
			</div>
		</div>
	</nav>

<script>
function changeContents(url){
    $.ajax({
        type        :    "get",
        url : url,
        dataType    :    'html',
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);

            // 접속 URL만 페이지 변환없이 변경
            // IE 10 이상이서만 지원...
            history.pushState({"html":data},'',currentMenuUrl)
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
       });

}

$('.sidebar-link').click(function(){
	$(this).next('.sidebar-dropdown').toggleClass("hide");
	$(this).children('span:eq(1)').toggleClass("rotate");
});

$('.sidebar-item').click(function(){
 	 $(this).addClass("active").siblings().removeClass("active");

});

$('.sub-item').click(function(){
	$('.sub-item').siblings().removeClass("active");
 	$(this).addClass("active");
 	$('#menu-nav span').eq(0).html($(this).parents("ul").siblings("a").children("span").text());
 	$('#menu-nav span').eq(2).html($(this).find('a').html());
 	$('#menu-nav span').css("display","block");

});


$('.sidebar-brand').click(function(){
	$('.sidebar-item').removeClass("active");
	$('.sub-item').removeClass("active");
	$('#menu-nav span').css("display","none");

});



</script>
