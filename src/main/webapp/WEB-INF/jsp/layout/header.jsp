<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
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
	</nav>


<script>
	activemenu = 0;
	function activeMenu(){
		if(activemenu == 0){
			$("#sidebar>nav>div").css("display","none");
			$("#sidebar").css("width","0");
			activemenu = 1;
		}else{
			$("#sidebar>nav>div").css("display","");
			$("#sidebar").css("width","200px");
			activemenu = 0;
		}
	}

	$('#dropBtn').click(function(){
		$('#dropmenu').toggleClass("show");
	});

	$('#homeBtn').click(function(){
		$('.sidebar-item').removeClass("active");
		$('.sub-item').removeClass("active");


	});

	$(document).click(function(e){
		if (!$(e.target).hasClass("dropBtnBox")) {
			if($('#dropmenu').hasClass("show")){
				 $('#dropmenu').removeClass("show");
			}
	   	}

	});

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
	        }
	        , beforeSend: function() {

	        },
	        complete:function(){
	        }
	       });



	}



</script>

