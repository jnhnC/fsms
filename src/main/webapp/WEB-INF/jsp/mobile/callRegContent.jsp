<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/tableList.css" rel="stylesheet">
<link href="/css/component/buttonbar.css" rel="stylesheet">
<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/nextpage.css" rel="stylesheet">
<link href="/css/component/tab.css" rel="stylesheet">
<link href="/css/component/tableRow.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="/js/tab.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="/css/mobile/callRegContent.css" rel="stylesheet">


<div id="callRegContent" class="card mx-2 rounded border-0" style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0 / 2%) !important;">
	<div class="item">
		<!--1  -->
		<%-- 	<jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item">
		<!--2  -->
		<div id="mobile-buttonbar">
			<div id="prevPage" class="item">
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control "
							placeholder="경기본부" onclick="" onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<div id="" class="dropdown-content">
						<a href="#about">인천본부</a>
						<a href="#base">충남본부</a>
						<a href="#blog">서울본부</a>
						<a href="#blog">부산본부</a>
						<a href="#blog">전남본부</a>
						<a href="#blog">구미본부</a>
						<a href="#blog">울산본부</a>
					</div>
				</div>
			</div>


			<div class="item">
				<!-- 		<button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>-->
		 	 	 <button class="btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>


			</div>

		</div>

	</div>

	<div class="item">
		<!--3  -->
		<table class="table table-row"
			style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
					<td class="title">고객사</td>
					<td class="value"></td>
				</tr>
				<tr>
					<td class="title">장례식장</td>
					<td class="value"></td>
				</tr>
				<tr>
					<td class="title">대상자</td>
					<td class="value"></td>
				</tr>
				<tr>
					<td class="title">경조사유</td>
					<td class="value"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="item">
		<!--4  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item "><a class="nav-link active p-0 px-2 py-1">사전상담내용</a></li>
				<li class="nav-item"><a class="nav-link  p-0 px-2 py-1">고객사지원내역</a></li>
				<li class="nav-item"><a class="nav-link  p-0 px-2 py-1">상품지역내역</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="mobile-result">
						<div class="tablebox">
							<table class="table">
								<thead>
									<tr id="header">
										<td style="width:20px;text-align:center"></td>
										<td style="width:100px;text-align:center">지원품목</td>
										<td >지원내용</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td >1</td>
										<td>장례지도사</td>
										<td>1일근무 or 3일근무</td>
									</tr>
									<tr>
										<td>2</td>
										<td>장례관리사</td>
										<td>지도사 3일근무 관리사 6명</td>
									</tr>
									<tr>
										<td>3</td>
										<td>24시간여부</td>
										<td>Y</td>
									</tr>
									<tr>
										<td>4</td>
										<td>조사용품</td>
										<td>00인분 지원 후 추가 200인분</td>
									</tr>
									<tr>
										<td>5</td>
										<td>근조기</td>
										<td>본인,배우자,자녀,양가부모</td>
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
										<td style="width:20px;text-align:center"></td>
										<td style="width:100px;text-align:center">지원품목</td>
										<td >지원내용</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td >1</td>
										<td>장례지도사</td>
										<td>1일근무 or 3일근무</td>
									</tr>
									<tr>
										<td>2</td>
										<td>장례관리사</td>
										<td>지도사 3일근무 관리사 6명</td>
									</tr>
									<tr>
										<td>3</td>
										<td>24시간여부</td>
										<td>Y</td>
									</tr>
									<tr>
										<td>4</td>
										<td>조사용품</td>
										<td>00인분 지원 후 추가 200인분</td>
									</tr>
									<tr>
										<td>5</td>
										<td>근조기</td>
										<td>본인,배우자,자녀,양가부모</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="content" id="tab3">

					<div class="item">
						<!--1  -->
						<div class="dropdown">
							<div class="dropdown-input">
								<input type="text" class="drop3btn form-control"
									placeholder="고급형" onclick="" onkeyup="filterFunction(this)">
								<i class="down-icon bi bi-caret-down-fill"></i>
							</div>
							<div id="" class="dropdown-content">
								<a href="#base">(의전패키지)임직원보호상품 230</a>
								<a href="#base">(의전패키지)임직원보호상품 190</a>
								<a href="#base">(의전패키지)가족장 160</a>
							</div>
						</div>
						<div>
							<button type="button" class="btn btn-warning" style="background-color:rgba(255,238,51,0.99);">알림톡 <i class="bi bi-chat-fill"></i></button>
						</div>
					</div>

					<div class="item">
						<!--2  -->
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
									<td class="value">2,000,000</td>
									<td class="title"></td>
									<td class="value"></td>
								</tr>

							</tbody>
						</table>
					</div>

					<div class="item">
						<!--3  -->
						<div class="mobile-result">
							<div class="tablebox">
								<table class="table">
									<thead>
										<tr id="header">
											<td style="width:20px;text-align:center"></td>
											<td style="width:100px;text-align:center">지원품목</td>
											<td >지원내용</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td >1</td>
											<td>장례지도사</td>
											<td>1일근무 or 3일근무</td>
										</tr>
										<tr>
											<td>2</td>
											<td>장례관리사</td>
											<td>지도사 3일근무 관리사 6명</td>
										</tr>
										<tr>
											<td>3</td>
											<td>24시간여부</td>
											<td>Y</td>
										</tr>
										<tr>
											<td>4</td>
											<td>조사용품</td>
											<td>00인분 지원 후 추가 200인분</td>
										</tr>
										<tr>
											<td>5</td>
											<td>근조기</td>
											<td>본인,배우자,자녀,양가부모</td>
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

	$('#allCheck').click(function() {
		var checked = $(this).is(":checked");

		if (checked) {
			$(this).parents("table").find('input').prop("checked", true);
		} else {
			$(this).parents("table").find('input').prop("checked", false);
		}
	});

	$('#prevPage').click(function() {
		/* alert($(this).children('td:first').html()); */

		var url = '/mobile/callSearchContent';
		$.ajax({
			type : "get",
			url : url,
			dataType : 'html',
			success : function(data) {
				$("#content").children().remove();
				$("#content").html(data);

				// 접속 URL만 페이지 변환없이 변경
				// IE 10 이상이서만 지원...
				/*   history.pushState({"html":data},'',currentMenuUrl) */
			},
			beforeSend : function() {

			},
			complete : function() {
			}
		});

	});

	$('#nextPage').click(function() {
		/* alert($(this).children('td:first').html()); */

		var url = '/mobile/productSearchContent';
		$.ajax({
			type : "get",
			url : url,
			dataType : 'html',
			success : function(data) {
				$("#content").children().remove();
				$("#content").html(data);

				// 접속 URL만 페이지 변환없이 변경
				// IE 10 이상이서만 지원...
				/*   history.pushState({"html":data},'',currentMenuUrl) */
			},
			beforeSend : function() {

			},
			complete : function() {
			}
		});

	});
</script>


