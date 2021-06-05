<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/contents/test3.css" rel="stylesheet" >

<div class="tab-wrapper">
	<!-- tab 영역이다. -->
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" >출고 처리</a>
	  </li>
	</ul>
	<!-- tab-content 영역이다. -->
	<div class="tab-content">
		<div class="content show" id="tab1">
		<table class="table">
		<thead>
		    <tr>
				<th scope="col"></th>
				<th scope="col">지원품목</th>
				<th scope="col">지원품목내용</th>
				<th scope="col">비고</th>
		    </tr>
	 	</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>특이사항</td>
					<td>200, 350패키지 상담 가능 / 개인행사대상</td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>특이사항</td>
					<td>200, 350패키지 상담 가능 / 개인행사대상</td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2"></td>
					<td></td>
				</tr>
			</tbody>
		</table>

		</div>

		<div>
			<button type="button" class="btn btn-dark" id="qr">QR</button>
		</div>
	</div>
</div>
<script>
	$('#qr').click(function(){
	  if (window.ReactNativeWebView) {
	    // 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
	    window.ReactNativeWebView.postMessage(
	      JSON.stringify({ type: "REQ_CAMERA_PERMISSION" })
	    );
	  } else {
	    // 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
	    alert({ message: ERROR_TYPES.notMobile });
	  }
	});

	document.addEventListener("message", function(data) {
	/* 	alert(data.data) */
	})


	$('.nav-item').click(function(){
		var tabNth = "tab"+Number($(this).index()+1);
		var navLinkNth = $(this).index();
		$(".nav-link").removeClass("active");
	 	$(".nav-tabs").find("li").eq(navLinkNth).find("a").addClass("active");
		$("#"+tabNth).toggleClass("show").siblings().removeClass("show");
	});
</script>



