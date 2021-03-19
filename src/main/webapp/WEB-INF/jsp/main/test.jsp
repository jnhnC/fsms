<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>

<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet">
<link href="/css/normalize.css" rel="stylesheet">
<link href="/css/contents/test.css" rel="stylesheet">


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

@font-face {
	font-family: 'BMEuljiro10yearslater';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/BMEuljiro10yearslater.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

</head>


<body>
	<div id="wrapper">

		<div>
			<img id="img" style="width:300px; hegiht:200px"/>

		</div>

	</div>

</body>
</html>


<script>
var data = '${img}';

//Convert the string to bytes
var bytes = new Uint8Array(data.length / 2);

for (var i = 0; i < data.length; i += 2) {
 bytes[i / 2] = parseInt(data.substring(i, i + 2), /* base = */ 16);
}

//Make a Blob from the bytes
var blob = new Blob([bytes], {type: 'image/bmp'});

//Use createObjectURL to make a URL for the blob
var image = new Image();
image.src = URL.createObjectURL(blob);
//document.body.appendChild(image);
$("#img").attr("src", image.src);

</script>