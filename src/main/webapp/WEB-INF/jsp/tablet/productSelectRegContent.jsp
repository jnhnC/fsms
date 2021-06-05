<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="/css/component/tableList.css" rel="stylesheet">
<link href="/css/component/search.css" rel="stylesheet">
<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/tab.css" rel="stylesheet">
<link href="/css/component/buttonbar.css" rel="stylesheet">
<link href="/css/component/nextpage.css" rel="stylesheet">

<script src="/js/datepicker.js"></script>
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<script src="/js/selectSearch.js"></script>
<script src="/js/tab.js"></script>

<link href="/css/tablet/productSelectRegContent.css" rel="stylesheet">


<div id="productSelectRegContent" >

	<div class="item"> <!--1  -->
		<%-- <jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div id="prevPage" class="item" >
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control " placeholder="경기본부"
							onclick="" onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<div class="dropdown-content">
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
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
					<td class="title">고객사</td>
					<td class="value">상성디스풀레이</td>
					<td class="title">대상자</td>
					<td class="value">CO2006273</td>
				</tr>
				<tr>
					<td class="title">장례식장</td>
					<td class="value"></td>
					<td class="title">경주사유</td>
					<td class="value"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="item"><!--4  -->
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
		  <tbody>
		    <tr>
		      <td class="title">상품금액</td>
		      <td class="value">2,000,000</td>
	          <td class="title">고객부담금</td>
		      <td class="value">2,000,000</td>
		    </tr>
		     <tr>
		      <td class="title">행사차감액</td>
		      <td class="value">2,000,000</td>
		       <td class="title"></td>
		      <td class="value"></td>
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
					<div class="table-content">
						<div class="mobile-result">
							<div class="title">
								기본지원
							</div>
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
											<td></td>
										</tr>
										<tr>
											<td>2</td>
											<td>장례지도사</td>
											<td></td>
										</tr>
										<tr>
											<td>3</td>
											<td>24시간여부</td>
											<td></td>
										</tr>
										<tr>
											<td>4</td>
											<td>조사용품</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="mobile-result">
							<div class="title">
								대체/선택지원
							</div>
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
											<td>대체지원</td>
											<td></td>
										</tr>
										<tr>
											<td>2</td>
											<td>대체지원</td>
											<td></td>
										</tr>
										<tr>
											<td>3</td>
											<td>선택지원</td>
											<td></td>
										</tr>
										<tr>
											<td>4</td>
											<td>선택지원</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
					<div class="mobile-result">
						<div class="tablebox">
							<table class="table">
								<thead>
									<tr>
										<td></td>
										<td></td>
										<td>
											<div class="dropbox">
												<div class="dropdown">
													<div class="dropdown-input">
														<input type="text"  class="drop3btn form-control " placeholder="일반형"  inputmode="none" onfocus="this.blur()"  autocomplete="off"
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
										<td>
											<div class="dropbox">
												<div class="dropdown">
													<div class="dropdown-input">
														<input type="text"  class="drop3btn form-control " placeholder="고급형"  inputmode="none" onfocus="this.blur()"  autocomplete="off"
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
									</tr>

									<tr id="header">
										<td></td>
										<td>지원품목</td>
										<td>지원내용</td>
										<td>지원내용</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>장례지도사</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>2</th>
										<td>장례관리사</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>3</th>
										<td>24시간여부</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>4</th>
										<td>조사용품</td>
										<td></td>
										<td></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="item">
		<div id="nextPage">
			<button class="btn btn-primary nextBtn">
				상담결과등록으로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div>

</div>
<script>
$('#menu-nav').html("상품선택/등록")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = '/productSelectSearchContent';
    $.ajax({
        type        :    "get",
        url : url,
        dataType    :    'html',
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);

            // 접속 URL만 페이지 변환없이 변경
            // IE 10 이상이서만 지원...
          /*   history.pushState({"html":data},'',currentMenuUrl) */
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
       });

});

$('.nextBtn').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = '/consultResultSearchContent';
    $.ajax({
        type        :    "get",
        url : url,
        dataType    :    'html',
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);

            // 접속 URL만 페이지 변환없이 변경
            // IE 10 이상이서만 지원...
          /*   history.pushState({"html":data},'',currentMenuUrl) */
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
       });

});


</script>
