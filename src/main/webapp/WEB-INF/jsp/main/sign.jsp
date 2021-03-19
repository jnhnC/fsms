<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>title</title>
<script src="bootstrap/js/jquery-3.6.0.min.JS"></script>

</head>


<body>
	<!-- 서명 공간 -->
	<div id="convasContent">
		<canvas id="canvas" style="border: 1px solid lightgray"></canvas>
	</div>
	<div>
		<!-- 저장 버튼 -->
		<button type="button" id="save" class="btn btn-success">확인</button>
	</div>

	<!-- 사인 js는 화면그려지고 난 다음에 적용해야 함 -->
	<script src="js/sign.js"></script>

	<img id="img" style="width:300px; hegiht:200px"/>
</body>

<script>

	$("#save").on("click", function() {
		var canvas = document.createElement('canvas');
	    var imgDataUrl = canvas.toDataURL('image/png');

	    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
	    var array = [];
	    for (var i = 0; i < blobBin.length; i++) {
	        array.push(blobBin.charCodeAt(i));
	    }

	    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
	    var formdata = new FormData();	// formData 생성
	    formdata.append("file", file);	// file data 추가

		var request = $.ajax({
			type : 'POST',
			enctype: 'multipart/form-data',
			dataType : 'json',
			processData: false,
			contentType: false,
			data : formdata,
			url : '/fileupload',
			success : function(result) {
				alert(result);

			}
		});


	});





</script>

</html>



