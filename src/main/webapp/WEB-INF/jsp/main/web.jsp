<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>

<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="/css/normalize.css" rel="stylesheet">

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

</head>
<style>
#qr{
	width: 400px;
	height: 400px;
	position: absolute;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

</style>

<body>
	<div class="container" style="">
		<div>
			<button type="button" class="btn btn-dark" id="qr">QR</button>
		</div>

	</div>


</body>
</html>

<script>
	$('#qr').click(function() {
		if (window.ReactNativeWebView) {
			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			window.ReactNativeWebView.postMessage(JSON.stringify({
				type : "REQ_CAMERA_PERMISSION"
			}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}

	});
	document.addEventListener("message", function(data) {
		alert(data.data)
	})
</script>