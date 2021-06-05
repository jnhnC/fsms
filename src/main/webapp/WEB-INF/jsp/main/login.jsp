<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./bootstrap/icon/bootstrap-icons.css" rel="stylesheet">
<link href="./css/normalize.css" rel="stylesheet">
<link href="./css/tablet/login.css" type="text/css" rel="stylesheet">


<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>

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

</head>


<body>
	<form id="form" name="form">
		<div class="container">
			<div class="row justify-content-center align-items-center"
				style="height: 100vh">
				<div id="main-box"
					class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 mb-5">

					<div class="panel-heading">
						<div class="logo">
							<img src="./images/logo.png">
						</div>
					</div>

					<div class="login-box ">
						<div class="item">
							<img src="./images/lf_txt.png">
						</div>

						<div class="item">
							<div class="left-box">
								<div class="panel-body">
									<!-- <img src="./images/login_title.png" alt="장례지도사 로그인"> -->
								</div>
								<input id="login-id" type="text" class="form-control" name="id"	placeholder="Username">
								<input id="login-pass" type="password" class="form-control" name="pw"placeholder="Password">
								<button type="button" class="form-control btn btn-warning" id="login-btn">로그인</button>
								<div class="copyright">Copyright © 2021&nbsp;hyunjinsn ALL RESERVED.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="alertBox" class="alert alert-danger" style="position:absolute;display:none;left:50%;width:80%;transform: translate(-50%);box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;text-align:center">
			<div><strong></strong></div>
		</div>
		<div>

		</div>


	</form>
</body>





<script>
	$('#login-btn').click(function() {
		$.ajax({
			type : "post",
			url : "login",
			dataType : 'json',
			data : $("#form").serialize(), //보낼데이터
			success : function(data) {

				if(data.result == 'SUCCESS'){

					location.replace('main');
				}else{
					alertBox(data.resultTxt,"warning");

				}
			}
		});

	});


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
</script>

</html>
