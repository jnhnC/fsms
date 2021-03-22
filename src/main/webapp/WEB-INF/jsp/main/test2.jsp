<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/contents/test3.css" rel="stylesheet">

<script>
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		div = document.getElementById("myDropdown");
		a = div.getElementsByTagName("a");
		for (i = 0; i < a.length; i++) {
			txtValue = a[i].textContent || a[i].innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
	}
</script>

<style>
#myInput:focus {
	outline: 3px solid #ddd;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	/* min-width: 230px; */
	width: 100%;
	border: 1px solid #ddd;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.show {
	display: block;
}
</style>

<div id="seachContant">
	<div id="searchCompany">
		<div class="inputItem item">
			<span>고객사</span>
			<input type="text" class=" form-control" placeholder="고객사 입력"	>
		</div>
		<div class="buttonItem item">
			<button type="button" class=" btn btn-primary">검색</button>
		</div>

	</div>

	<div id="searchEtc">
		<div class="item dropdown">
			<span>경조사</span>
			<input type="text" id="myInput" onclick="myFunction()"
				class="drop3btn form-control" placeholder="경조사 검색"
				onkeyup="filterFunction()">
			<div id="myDropdown" class="dropdown-content">
				<a href="#about">본인상</a>
				<a href="#base">부친상</a>
				<a href="#blog">모친상</a>
				<a href="#contact">본인조부상</a>
				<a href="#custom">본인조모상</a>
				<a href="#support">본인외조부상</a>
				<a href="#tools">본인외조모상</a>
			</div>
		</div>


		<div class="item">
			<span>고객상품</span>
			<select class="form-select">
				<option selected>고객상품 선택</option>
				<option value="1">One</option>
				<option value="2">Two</option>
				<option value="3">Three</option>
				<option value="3">Three</option>
				<option value="3">Three</option>
				<option value="3">Three</option>
				<option value="3">Three</option>
			</select>
		</div>

	</div>

	<hr>

	<div id="resultContent">
		<div class="contentWrap">
			<div class="inputItem item">
				<span>상품금액</span>
				<input type="number" class="form-control" placeholder="상품금액"  >
			</div>
			<div class="inputItem item">
				<span>개인부담금</span>
				<input type="number" class="form-control" placeholder="개인부담금"  >
			</div>

			<div class="inputItem item">
			<span>행사차감액</span>
			<input type="number" class="form-control" placeholder="행사차감액"  >
		</div>
		</div>


	</div>
</div>

<hr>

<div></div>

<div class="tab-wrapper">
	<!-- tab 영역이다. -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active">회사지원내역</a></li>
		<li class="nav-item"><a class="nav-link">상품지원내역</a></li>
		<li class="nav-item"><a class="nav-link">고객확인</a></li>
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
		<div class="content" id="tab2">메뉴 상세내용</div>
		<div class="content" id="tab3">Active3</div>
	</div>
</div>
<script>
	$('.nav-item').click(function() {
		var tabNth = "tab" + Number($(this).index() + 1);
		var navLinkNth = $(this).index();
		$(".nav-link").removeClass("active");
		$(".nav-tabs").find("li").eq(navLinkNth).find("a").addClass("active");
		$("#" + tabNth).toggleClass("show").siblings().removeClass("show");
	});
</script>



