<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="/css/mobile/search.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

<link href="/css/mobile/tableList.css" rel="stylesheet">
<link href="/css/mobile/search.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>

<link href="/css/mobile/productSearchContent.css" rel="stylesheet">
<link href="/css/mobile/tab.css" rel="stylesheet">
<script src="/js/tab.js"></script>

<div id="productSearchContent">

	<div class="item"> <!--1  -->
		<jsp:include page="header.jsp" flush="false" />
	</div>

	<div class="item"><!--2  -->
		<jsp:include page="buttonbar.jsp" flush="false" />
	</div>

	<div class="item"><!--3  -->
		<div id="mobile-search" class="">
			<div class="title">
				<div>검색조건</div>
			</div>
			<div class="table-box">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="border-left: 0px;">
								<div class="dropbox">
									<span>고객사</span>
									<div class="dropdown">
									<input type="text" id="" class="drop3btn form-control " placeholder="고객사"
										onclick="" onkeyup="filterFunction(this)">
									<i class="down-icon bi bi-caret-down-fill"></i>
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
								<span>경조사유</span>
								<div class="dropdown">
								<input type="text" id="" class="drop3btn form-control " placeholder="경조사유"
									onclick="" onkeyup="filterFunction(this)">
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
								<div class="dropbox">
									<span>품목</span>
									<div class="dropdown">
									<input type="text" id="" class="drop3btn form-control " placeholder="품목"
										onclick="" onkeyup="filterFunction(this)">
									<i class="down-icon bi bi-caret-down-fill"></i>
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
		      <td>상품금액</td>
		      <td></td>
		    </tr>
		    <tr>
		      <td>행사차감액</td>
		      <td></td>
		    </tr>
		     <tr>
		      <td>개인부담금</td>
		      <td></td>
		    </tr>

		  </tbody>
		</table>
	</div>

	<div class="item">
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
				<div class="content" id="tab2">
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
<script>

</script>
