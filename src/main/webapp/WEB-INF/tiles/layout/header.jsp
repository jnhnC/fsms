<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="navbar navbar-light  justify-content-between">
		<div class="header-contnets">
			<div id="menuicon" onClick="activeMenu();">
				<i class="bi bi-list h2"></i>
			</div>
			
			<div>
				<div id="dropContent">
					<div id="dropBtn" class="dropBtn dropBtnBox">
						<span class="dropBtnBox"><i class="bi bi-person-circle"></i></span>
						<span class="dropBtnBox">최진형</span>
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

	$(document).click(function(e){
		if (!$(e.target).hasClass("dropBtnBox")) { 
			if($('#dropmenu').hasClass("show")){
				 $('#dropmenu').removeClass("show");
			}
	   	}
	    
	});
	
</script>	
	
	