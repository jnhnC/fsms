<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="/css/mobile/header.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
<style>
@font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

</style>
	<div id="mobile-header">
		<div class="item" onClick="activeMenu();">
			<i class="bi bi-grid-3x3-gap-fill"></i>
		</div>
		<div class="item">
			<div id="menu-nav">

			</div>
		</div>
		<div class="item">
			홍길동
		</div>
	</div>


<script>
	activemenu = 0;
	function activeMenu(){
		if(activemenu == 0){
			/* $("#sidebar>nav>div").css("display","none"); */
			$("#sidebar").css("width","0");
			activemenu = 1;
		}else{
			/* $("#sidebar>nav>div").css("display",""); */
			$("#sidebar").css("width","800px");
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

