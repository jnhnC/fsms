<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="./css/component/tableList.css" rel="stylesheet">

<link rel="stylesheet" href="./bootstrap/css/bootstrap-datepicker.css">

<script src="./bootstrap/js/bootstrap-datepicker.js"></script>

<link href="./css/component/selectSearch.css" rel="stylesheet">
<script src="./js/selectSearch.js"></script>
<link href="./css/component/search.css" rel="stylesheet">
<script src="./bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<!-- <link href="/css/mobile/datepicker.css" rel="stylesheet"> -->
<script src="./js/datepicker.js"></script>


<div class="card mx-2 rounded border-0" style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0 / 2%) !important;">
		<div id="mobile-search" >
		<div class="title rounded">
			<div>검색조건</div>
			<div class="hideButton"><i class="bi bi-caret-up-fill"></i></div>
		</div>
		<div class="table-box">
			<table>
				<tbody>
					<tr>
						<td style="border-left: 0px;">
							<div class="datebox">
								<div class="table-title">
									<span>주문일자(From)</span>
								</div>
								<div class="datePickerbox">
									<input type="text" class="datePicker" id="startDate" class="form-control" autocomplete="off"  inputmode="none" >
									<i class="bi bi-calendar-check calendar-icon"></i>
								</div>
							</div>
						</td>
						<td style="border-right: 0px;">
							<div class="datebox">
								<div class="table-title">
									<span>주문일자(To)</span>
								</div>
								<div class="datePickerbox">
									<input type="text" class="datePicker" id="lastDate"	class="form-control" autocomplete="off"   inputmode="none" >
									<i class="bi bi-calendar-check calendar-icon"></i>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="border-left: 0px;">
						<div class="dropbox">
							<div class="table-title">
								<span>진행상태</span>
							</div>
							<div class="dropdown">
								<div class="dropdown-input">
									<input type="text"  class="drop3btn form-control " placeholder="진행상태"
										 onkeyup="filterFunction(this)">
									<i class="down-icon bi bi-caret-down-fill"></i>
								</div>
								<div class="dropdown-content">
									<a href="#about">본인상</a>
									<a href="#base">부친상</a>
									<a href="#blog">모친상</a>
								</div>
							</div>
						</div>


						</td>
						<td style="border-right: 0px;">
							<div class="inputbox">
								<div class="table-title">
									<span>대상자</span>
								</div>
								<div class="dropdown">
									<input type="text"	class="form-control input-bottom-border" placeholder="대상자" />
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>


	<div class="mobile-result">
		<div class="tablebox">
			<table class="table">
				<thead>
					<tr id="header" style="height: 30px;">
						<td></td>
						<td>제목</td>
						<td>게시자</td>
						<td>등록일</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>게시판내용1</td>
						<td>홍길동</td>
						<td>2021-03-03</td>
					</tr>
					<tr>
						<td>1</td>
						<td>게시판내용2</td>
						<td>홍길영</td>
						<td>2021-03-03</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>


<script>
	$('#menu-nav').html("게시판");

	$('#mobile-search>.title').click(function() {
		$(this).next('.table-box').slideToggle(100);
		$('.hideButton i').toggleClass("rotate");
	});
</script>