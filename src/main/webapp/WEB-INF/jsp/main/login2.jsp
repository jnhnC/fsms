<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>

<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="/css/normalize.css" rel="stylesheet">
<link href="/css/contents/login2.css" rel="stylesheet">
<link href="/css/contents/style.css" rel="stylesheet">


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

</head>


<body>

    <div id="main-wrap">

	<div class="main">
		
		<form id="frm" name="frm" target="_self" method="POST">
		<div class="main-box">
			<div class="logo"><img src="/images/logo.png"></div>
			<div class="login-box">
				<div class="lf-box">
					<div class="txt-box">
						<img src="/images/lf_txt.png">
					</div>
				</div>
				<div class="rt-box">
					<div class="inner">
						<h1><img src="/images/login_title.png" alt="장례지도사 로그인"></h1>
						<ul>
							<li><input type="text" name="str_userid" id="str_userid" placeholder="아이디"></li>
							<li><input type="password" name="str_passwd" id="str_passwd" placeholder="패스워드"></li>
						</ul>
						<div class="txt">아이디, 패스워드를 입력해주세요.</div>
						<div class="login-btn"><a href="javascript:void(0);" id="btn_Login">로그인</a></div>
					</div>
					<div class="copyright">Copyright © 2019&nbsp;hyunjinsn ALL RESERVED.</div>
				</div>
			</div>
		</div>
		</form>

	</div>

</div>
	
</body>
</html>

<script>
$('#login-btn').click(function(){

	location.replace('/main');

});
</script>