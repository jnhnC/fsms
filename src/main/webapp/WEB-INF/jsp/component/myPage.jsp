<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="./css/component/tableList.css" rel="stylesheet">

<link rel="stylesheet" href="./bootstrap/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="./css/component/myPage.css">

<script src="./bootstrap/js/bootstrap-datepicker.js"></script>

<link href="./css/component/selectSearch.css" rel="stylesheet">
<script src="./js/selectSearch.js"></script>
<link href="./css/component/search.css" rel="stylesheet">
<script src="./bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<!-- <link href="/css/mobile/datepicker.css" rel="stylesheet"> -->
<script src="./js/datepicker.js"></script>


<div id="myPage" class="card mx-2 rounded border-0"	style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0/ 2%) !important;">
	<div class="item-content">
		<div id="myInfo" class="item mb-3">
			<div class="my-3 px-3" style="box-shadow: 0 0.5rem 1rem rgb(0 0 0/ 3%) !important;border-radius:7px;">
				<i class="bi bi-app-indicator "></i> <span>기본정보</span>
			</div>
			<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
				<tbody>
					<tr>
						<td>이름</td>
						<td style="padding-left:70px;">최진형</td>
					</tr>
					<tr>
						<td>소속</td>
						<td style="padding-left:70px;">PI팀</td>
					</tr>
					<tr>
						<td>직급</td>
						<td style="padding-left:70px;">대리</td>
					</tr>
					<tr>
						<td>담당</td>
						<td style="padding-left:70px;"></td>
					</tr>

					<tr>
						<td>연락처</td>
						<td style="padding-left:70px;">010-9497-6266</td>
					</tr>

				</tbody>
			</table>
		</div>

		<div id="pdInfo" class="item mb-3">
			<div class="my-3 px-3" style="box-shadow: 0 0.5rem 1rem rgb(0 0 0/ 3%) !important;border-radius:7px;">
				<i class="bi bi-app-indicator "style="font-size: calc(0.26vw + 9.08pt);"></i> <span>비밀번호 변경</span>
			</div>
			<input type="text" class="form-control p-1 mb-2 pl-3" style="font-size: calc(0.26vw + 10.08pt);" placeholder="기존비밀번호">
			<input type="text" class="form-control p-1 mb-2 pl-3" style="font-size: calc(0.26vw + 10.08pt);"placeholder="새비밀번호">
			<input type="text" class="form-control p-1 mb-5 pl-3" style="font-size: calc(0.26vw + 10.08pt);"placeholder="새비밀번호확인">
			<button class="btn btn-primary  btn-block p-1 w-100" style="font-size: calc(0.26vw + 10.08pt);">암호변경</button>
		</div>


	</div>

</div>


<script>
	$('#menu-nav').html("마이페이지");

</script>