<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">

<script src="/bootstrap/js/bootstrap-datepicker.js"></script>

<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>
<link href="/css/mobile/search.css" rel="stylesheet">
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<link href="/css/mobile/datepicker.css" rel="stylesheet">
<script src="/js/datepicker.js"></script>


<div id="mobile-search" style="white-space:nowrap">
	<div class="title">
		<div>검색조건</div>
		<div><i class="bi bi-caret-up-fill"></i></div>
	</div>
	<div class="table-box">
		<table>
			<tbody>
				<tr>
					<td style="border-left: 0px;">
						<div class="datebox">
							<div>
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
							<div>
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
						<div>
							<span>진행상태</span>
						</div>
						<div class="dropdown">
							<input type="text"  class="drop3btn form-control " placeholder="진행상태"
								 onkeyup="filterFunction(this)">
							<i class="down-icon bi bi-caret-down-fill"></i>
							<div id="" class="dropdown-content">
								<a href="#about">본인상</a>
								<a href="#base">부친상</a>
								<a href="#blog">모친상</a>
							</div>
						</div>
					</div>


					</td>
					<td style="border-right: 0px;">
						<div class="inputbox">
							<div>
								<span>대상자</span>
							</div>
							<div>
								<input type="text"	class="form-control input-bottom-border" placeholder="대상자" />
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

	</div>
</div>


<script>


$('#startDate').val(new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString().slice(0, 10))
$('#lastDate').val(new Date().toISOString().slice(0, 10));


</script>