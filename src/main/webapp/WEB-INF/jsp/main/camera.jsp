<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/component/swiper-bundle.min.css" />
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="/css/layout/main.css" rel="stylesheet" >
<link href="/css/normalize.css" rel="stylesheet">

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

</head>

<body>
	<div class="container" style="justify-content: center;align-items: center; margin-top: 100px;">
			<div class="filename">
				등록된 파일이 없습니다.
			</div>

			<button class="btn btn-primary shadow-sm p-0" id="camera">
				<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">카메라</div>
		   	</button>

	   		<button class="btn btn-warning shadow-sm p-0" id="gallay">
				<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">갤러리</div>
		   	</button>

	   		<button class="btn btn-secondary shadow-sm p-0" id="save">
				<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
		   	</button>
	</div>

	<input type="hidden" name="path">


</body>
</html>

<script>
	$('#camera').click(function() {
	 	if (window.ReactNativeWebView) {
			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			window.ReactNativeWebView.postMessage(JSON.stringify({
				gubun:"camera",
				type : "REQ_CAMERA_PERMISSION"

			}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}



	});


	$('#gallay').click(function() {
		if (window.ReactNativeWebView) {
			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			window.ReactNativeWebView.postMessage(JSON.stringify({
				gubun:"gallary",
				type : "REQ_CAMERA_PERMISSION"

			}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}

	});

	$('#save').click(function() {

		var pathlength = $("input[name=path]").length;


		if (window.ReactNativeWebView) {
			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			window.ReactNativeWebView.postMessage(JSON.stringify({
				gubun:"save",
				path: $('input[name=path]').val()


			}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}

	});

	document.addEventListener("message", function(data) {
		$('input[name=path]').val(data.data);


	})
</script>