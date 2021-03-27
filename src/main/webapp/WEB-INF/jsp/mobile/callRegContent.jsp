<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<link href="/css/mobile/tableList.css" rel="stylesheet">
<link href="/css/mobile/buttonbar.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<link href="/css/mobile/nextpage.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
<link href="/css/mobile/tab.css" rel="stylesheet">
<script src="/js/tab.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="/css/mobile/callRegContent.css" rel="stylesheet">


<div id="callRegContent">
	<div class="item"> <!--1  -->
	<%-- 	<jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div class="item" >
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<input type="text" class="drop3btn form-control " placeholder="경기본부"
						onclick="" onkeyup="filterFunction(this)">
					<i class="down-icon bi bi-caret-down-fill"></i>
					<div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div>
				</div>
			</div>


			<div class="item">
		<!-- 		<button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>
			   	<button class="btn btn-secondary shadow-sm pt-1">
					<i class="far fa-save"></i>
					<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
			   	</button> -->


			</div>

		</div>

	</div>

	<div class="item">
		<!--3  -->
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
					<td>고객사</td>
					<td></td>
				</tr>
				<tr>
					<td>장례식장</td>
					<td></td>
				</tr>
				<tr>
					<td>대상자</td>
					<td></td>
				</tr>
				<tr>
					<td>경조사유</td>
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
				<li class="nav-item"><a class="nav-link active">사전사당내용</a></li>
				<li class="nav-item"><a class="nav-link">고객사지원내역</a></li>
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

				<div class="content" id="tab3">

					<div class="item"><!--1  -->
						<div class="dropdown">
							<input type="text" id="" class="drop3btn form-control " placeholder="경기본부"
								onclick="" onkeyup="filterFunction(this)">
							<i class="down-icon bi bi-caret-down-fill"></i>
							<div id="" class="dropdown-content">
								<a href="#about">본인상</a>
								<a href="#base">부친상</a>
								<a href="#blog">모친상</a>
							</div>
						</div>
						<div>
							<button type="button" class="btn btn-warning">알림톡발송</button>
						</div>
					</div>

					<div class="item"><!--2  -->
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

					<div class="item"><!--3  -->
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
</div>


<script>
	$('#menu-nav').html("유선상담/등록")

	$('#allCheck').click(function(){
		var checked = $(this).is(":checked");

		if(checked){
			$(this).parents("table").find('input').prop("checked", true);
		} else {
			$(this).parents("table").find('input').prop("checked", false);
		}
	});


	$('#nextPage').click(function(){
		/* alert($(this).children('td:first').html()); */

		var url = '/mobile/productSearchContent';
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


