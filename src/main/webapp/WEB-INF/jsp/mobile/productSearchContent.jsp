<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="/css/component/tableList.css" rel="stylesheet">
<link href="/css/component/search.css" rel="stylesheet">
<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/tab.css" rel="stylesheet">
<link href="/css/component/buttonbar.css" rel="stylesheet">

<script src="/js/selectSearch.js"></script>
<script src="/js/tab.js"></script>

<link href="/css/mobile/productSearchContent.css" rel="stylesheet">


<div id="productSearchContent" >

	<div class="item"> <!--1  -->
		<%-- <jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div class="item" >
				<!-- <i class="bi bi-chevron-left"></i> -->
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control " placeholder="경기본부"
							onclick="" onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div>
				</div>
			</div>


			<div class="item">
				<!-- <button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>
			   	<button class="btn btn-secondary shadow-sm pt-1">
					<i class="far fa-save"></i>
					<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
			   	</button>
 -->

			</div>

		</div>

	</div>

	<div class="item"><!--3  -->
		<div id="mobile-search" class="">
			<div class="title">
				<div>검색조건</div>
				<div class="hideButton"><i class="bi bi-caret-up-fill"></i></div>
			</div>
			<div class="table-box">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="border-left: 0px;">
								<div class="dropbox">
									<div class="table-title">
										<span>고객사</span>
									</div>
									<div class="dropdown">
									<div class="dropdown-input">
										<input type="text" id="" class="drop3btn form-control " placeholder="고객사"
											onclick="" onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div id="" class="dropdown-content">
										<a href="#about">본인상</a>
										<a href="#base">부친상</a>
										<a href="#blog">모친상</a>
									</div>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td style="border-left: 0px;">
							<div class="dropbox">
								<div class="table-title">
									<span>경조사유</span>
								</div>
								<div class="dropdown">
								<div class="dropdown-input">
									<input type="text" id="" class="drop3btn form-control " placeholder="경조사유"
										onclick="" onkeyup="filterFunction(this)">
									<i class="down-icon bi bi-caret-down-fill"></i>
								</div>
								<div id="" class="dropdown-content">
									<a href="#about">본인상</a>
									<a href="#base">부친상</a>
									<a href="#blog">모친상</a>
								</div>
								</div>
							</div>


							</td>
							<td style="border-right: 0px;">
								<div class="dropbox">
									<div class="table-title">
										<span>품목</span>
									</div>
									<div class="dropdown">
									<div class="dropdown-input">
										<input type="text" id="" class="drop3btn form-control " placeholder="품목"
											onclick="" onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div id="" class="dropdown-content">
										<a href="#about">본인상</a>
										<a href="#base">부친상</a>
										<a href="#blog">모친상</a>
									</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<div class="item"><!--4  -->
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
		  <tbody>
		    <tr>
		      <td class="title">상품금액</td>
		      <td class="value">2,000,000</td>
	          <td class="title">행사차감액</td>
		      <td class="value">2,000,000</td>
		    </tr>
		     <tr>
		      <td class="title">개인부담금</td>
		      <td colspan="3" class="value">2,000,000</td>
		    </tr>

		  </tbody>
		</table>
	</div>

	<div class="item"><!--5  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">고객사지원내역</a></li>
				<li class="nav-item"><a class="nav-link">상품지역내역</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="mobile-result">
						<div class="tablebox">
							<table class="table">
								<thead>
									<tr id="header">
										<td></td>
										<td>지원품목</td>
										<td>지원내용</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>장례지도사</td>
										<td>2021-03-03 17:00</td>
									</tr>
									<tr>
										<td>2</td>
										<td>장례지도사</td>
										<td>2021-03-03 17:00</td>
									</tr>
									<tr>
										<td>3</td>
										<td>24시간여부</td>
										<td>2021-03-03 17:00</td>
									</tr>
									<tr>
										<td>4</td>
										<td>조사용품</td>
										<td>2021-03-03 17:00</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
					<div class="mobile-result">
						<div class="tablebox">
							<table class="table">
								<thead>
									<tr id="header">
										<td></td>
										<td>지원품목</td>
										<td>지원내용</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>배정완료</td>
										<td>2021-03-03 17:00</td>
									</tr>
									<tr>
										<th>2</th>
										<td>배정완료</td>
										<td>2021-03-03 17:00</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$('#menu-nav').html("상품조회")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


</script>
