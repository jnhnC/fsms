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

	<img id="img1" style="width:300px; hegiht:200px"/>
</body>

<script>

	$("#save").on("click", function() {
		var canvas = $("#canvas");
	    var imgDataUrl = canvas[0].toDataURL('image/png');

	    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
	    var array = [];
	    for (var i = 0; i < blobBin.length; i++) {
	        array.push(blobBin.charCodeAt(i));
	    }

	    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
	    var formdata = new FormData();	// formData 생성
	    formdata.append("file", file);	// file data 추가 */

	    formdata.append("fileUrl", blobBin);	// file data 추가


		var request = $.ajax({
			url : '/fileupload',
			type : 'POST',
			dataType : 'json',
			data : formdata,
			 processData: false,
			 contentType: false,
			success : function(result) {

	/* 			var data = result.img;

				alert(data);
				//Convert the string to bytes
				var bytes = new Uint8Array(data.length / 2);':'
				for (var i = 0; i < data.length; i += 2) { */
			//	 bytes[i / 2] = parseInt(data.substring(i, i + 2), /* base = */ 16);
			//	}

				//Make a Blob from the bytes
			/* 	var blob = new Blob([bytes], {type: 'image/bmp'});

				//Use createObjectURL to make a URL for the blob
				var image = new Image();
				image.src = URL.createObjectURL(blob);
				document.body.appendChild(image);
				$("#img1").attr("src", image.src); */

			}
		});

	});




/* 	uploadCanvasToServer = function() {
		  const canvas = document.getElementById('canvas');
		  const imgBase64 = canvas.toDataURL('image/png', 'image/octet-stream');
		  const decodImg = atob(imgBase64.split(',')[1]);

		  let array = [];
		  for (let i = 0; i < decodImg .length; i++) {
		    array.push(decodImg .charCodeAt(i));
		  }

		  const file = new Blob([new Uint8Array(array)], {type: 'image/png'});
		  const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.png';
		  let formData = new FormData();
		  formData.append('file', file, fileName);

		  $.ajax({
		    type: 'post',
		    url: '/fileupload/',
		    cache: false,
		    data: formData,
		    processData: false,
		    contentType: false,
		    success: function (data) {
		      alert('Uploaded !!')
		    }
		  })
		}; */

//	var data = '${img}';

//	alert(data);
	//Convert the string to bytes
//	var bytes = new Uint8Array(data.length / 2);':'

//	for (var i = 0; i < data.length; i += 2) {
	// bytes[i / 2] = parseInt(data.substring(i, i + 2), /* base = */ 16);
//	}

	//Make a Blob from the bytes
	//var blob = new Blob([bytes], {type: 'image/bmp'});

	//Use createObjectURL to make a URL for the blob
//	var image = new Image();
	//image.src = URL.createObjectURL(blob);
//	document.body.appendChild(image);
	//$("#img1").attr("src", image.src);




</script>

</html>



