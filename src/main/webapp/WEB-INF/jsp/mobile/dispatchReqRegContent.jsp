<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/tableList.css" rel="stylesheet">
<link href="/css/component/buttonbar.css" rel="stylesheet">
<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/nextpage.css" rel="stylesheet">
<link href="/css/component/datepicker.css" rel="stylesheet">
<link href="/css/component/tab.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>
<script src="/js/tab.js"></script>

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>


<script src="/js/datepicker.js"></script>
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>


<link href="/css/mobile/dispatchReqRegContent.css" rel="stylesheet">


<div id="dispatchReqRegContent">
	<div class="item"> <!--1  -->
	<%-- 	<jsp:include page="header.jsp" flush="false" /> --%>
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
					<div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div>
				</div>
			</div>


			<div class="item">
				<!-- <button class="btn btn-secondary shadow-sm  p-0" >
					 <i class="bi bi-search" style="font-size: calc(0.26vw + 11.6pt); padding:0 14px;"></i>
		  		</button> -->
			 	 <button class="btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>
			</div>

		</div>

	</div>

	<div class="item"><!--3  -->
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
					<td class="title">배차요청일시</td>
					<td class="value">2021-04-02 09:00</td>
				</tr>
				<tr>
					<td class="title">발인일시</td>
					<td class="value">2021-04-02 09:00</td>
				</tr>
				<tr>
					<td class="title">고인명</td>
					<td class="value"></td>
				</tr>
				<tr>
					<td class="title">대상자</td>
					<td class="value"></td>
				</tr>
				<tr>
					<td class="title">장례식장</td>
					<td class="value" colspan="3"></td>
				</tr>
				<tr>
					<td class="title">화장장</td>
					<td class="value" colspan="3"></td>
				</tr>
				<tr>
					<td class="title">의전팀장</td>
					<td class="value" colspan="3"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="item "><!--4  -->
		<div class="d-flex justify-content-around my-3">
			<div class="text-center">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text"  class="drop3btn form-control " placeholder="경기본부"
							 onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<div  class="dropdown-content text-left">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div>
				</div>
			</div>

			<div class="text-center">
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
		</div>

		<div class="my-3">
			<div class="datebox d-flex">
				<div class="datePickerbox  d-flex justify-content-center align-items-center mx-1">
				 	<span>출발일시</span>
					<input type="text"  class="datePicker form-control py-0 mx-1 text-right w-50"
						id="startDate" autocomplete="off" onfocus="this.blur()" inputmode="none">
					<i class="bi bi-calendar-check calendar-icon"></i>
				</div>
				<div class="mx-1">
					<select class="form-select py-0 " aria-label="Default select example">
					 <c:forEach var="i"  begin="1" end="24">
					        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
					    </c:forEach>
					</select>
				</div>
				<div class="mx-1">
					<select class="form-select py-0" aria-label="Default select example">
					    <c:forEach var="i"  begin="0" end="60" step="10">
					        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
					    </c:forEach>
					</select>
				</div>
			</div>
		</div>

		<div class="my-3">
			<div class="datebox d-flex">
				<div class="datePickerbox d-flex  justify-content-center align-items-center mx-1">
					<span>도착일시</span>
					<input type="text"  class="datePicker form-control py-0 mx-1 text-right w-50"
						id="endDate" autocomplete="off" onfocus="this.blur()" inputmode="none">
					<i class="bi bi-calendar-check calendar-icon"></i>
				</div>
				<div class="mx-1">
					<select class="form-select py-0 " aria-label="Default select example">
					 <c:forEach var="i"  begin="1" end="24">
					        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
					    </c:forEach>
					</select>
				</div>
				<div class="mx-1">
					<select class="form-select py-0" aria-label="Default select example">
					    <c:forEach var="i"  begin="0" end="60" step="10">
					        <option value="${i}">${i>9?i:'0'}${i>9?'':i}</option>
					    </c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>

	<div class="item">
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">차량배정</a></li>
				<li class="nav-item"><a class="nav-link">기사배정</a></li>
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
										<td>선택</td>
										<td>직영여부</td>
										<td>차량번호</td>
										<td>배차상황</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td><input name="radio" class="form-check-input me-1" type="radio"></td>
										<td>직영</td>
										<td>35호1234</td>
										<td>운행중</td>
									</tr>
									<tr>
										<td></td>
										<td><input name="radio" class="form-check-input me-1" type="radio"></td>
										<td>직영</td>
										<td>77하4256</td>
										<td>운행가능</td>
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
										<td>선택</td>
										<td>직영여부</td>
										<td>기사명</td>
										<td>HP</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td><input name="radio" class="form-check-input me-1" type="radio"></td>
										<td>직영</td>
										<td>김기사</td>
										<td>010-3127-1542</td>
									</tr>
									<tr>
										<td></td>
										<td><input name="radio" class="form-check-input me-1" type="radio"></td>
										<td>직영</td>
										<td>박기사</td>
										<td>010-7422-3542</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>

				<div class="content" id="tab3">

					<div class="item"><!--1  -->
						<div class="dropdown">
							<div class="dropdown-input">
								<input type="text" id="" class="drop3btn form-control " placeholder="경기본부"
									onclick="" onkeyup="filterFunction(this)">
								<i class="down-icon bi bi-caret-down-fill"></i>
							</div>
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
						      <td class="value">2,000,000</td>
						      <td class="title"></td>
						      <td class="value"></td>
						    </tr>

						  </tbody>
						</table>
					</div>

					<div class="item"><!--3  -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="item"><!--6  -->

		<button class="btn btn-primary shadow-sm pt-1">
			<div>배차완료</div>
		</button>

	</div>
</div>


<script>
	$('#menu-nav').html("배차등록")

	$('#allCheck').click(function(){
		var checked = $(this).is(":checked");

		if(checked){
			$(this).parents("table").find('input').prop("checked", true);
		} else {
			$(this).parents("table").find('input').prop("checked", false);
		}
	});


	$('#prevPage').click(function(){
		/* alert($(this).children('td:first').html()); */

		var url = '/mobile/dispatchSearchContent';
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


