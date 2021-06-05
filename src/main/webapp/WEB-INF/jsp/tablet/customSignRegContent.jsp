<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="/css/component/tableList.css" rel="stylesheet">
<link href="/css/component/search.css" rel="stylesheet">
<link href="/css/component/selectSearch.css" rel="stylesheet">
<link href="/css/component/tab.css" rel="stylesheet">
<link href="/css/component/buttonbar.css" rel="stylesheet">
<link href="/css/component/nextpage.css" rel="stylesheet">
<link href="/css/component/tableRow.css" rel="stylesheet">

<script src="/js/datepicker.js"></script>
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<script src="/js/selectSearch.js"></script>
<script src="/js/tab.js"></script>

<link href="/css/tablet/customSignRegContent.css" rel="stylesheet">


<div id="customSignRegContent" class="card mx-2 rounded border-0" style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0 / 2%) !important;">

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
						<a href="#about">인천본부</a>
						<a href="#base">서울본부</a>
						<a href="#blog">충남본부</a>
						<a href="#blog">부산본부</a>
						<a href="#blog">전남본부</a>
						<a href="#blog">구미본부</a>
						<a href="#blog">울산본부</a>
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
			<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
				<tbody>
					<tr>
						<td class="title">고객사</td>
						<td class="value">삼성디스플레이</td>
						<td class="title">대상자</td>
						<td class="value">CO2006273</td>
					</tr>
					<tr>
						<td class="title">장례식장</td>
						<td class="value"></td>
						<td class="title">경조사유</td>
						<td class="value"></td>
					</tr>
				</tbody>
			</table>
	</div>



	<div class="item "><!--4  -->
		<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
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

	<div class="item "><!--5  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item px-3"><a class="nav-link active">상품선택내역</a></li>
				<li class="nav-item px-3"><a class="nav-link">장례일정</a></li>
				<li class="nav-item px-3"><a class="nav-link">동의/서명</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="mobile-result">
						<div class="title">
							<i  class=" bi bi-layers-half"></i> 기본지원
						</div>
						<div class="tablebox">
							<table class="table">
								<thead>
									<tr id="header">
										<td></td>
										<td>지원품목</td>
										<td>지원내용</td>
										<td></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>장례지도사</td>
										<td>1일근무 or 3일근무</td>
										<td></td>
									</tr>
									<tr>
										<td>2</td>
										<td>장례지도사</td>
										<td>지도사 3일근무 관리사 6명<br>지도사 1일근무 <br>관리사 8명 <br>24시간이내 10시간근무</td>
										<td></td>
									</tr>
									<tr>
										<td>3</td>
										<td>24시간여부</td>
										<td>Y</td>
										<td></td>
									</tr>
									<tr>
										<td>4</td>
										<td>조사용품</td>
										<td>00인분 지원 후 추가지원시 200인분 지원<br>퇴임 임원은 용품만지원 근조기<br>본인,배우자,자녀,양가부모,승중상 지원근조화환<br>임원 / 별도 담당업체가 있음 직원 / 3단근조화환+영정바구니
										</td>
										<td></td>
									</tr>
									<tr>
										<td>5</td>
										<td>근조기</td>
										<td>본인,배우자,자녀,양가부모,승중상 지원</td>
										<td></td>
									</tr>
									<tr>
										<td>6</td>
										<td>근조화환</td>
										<td>임원 / 별도 담당업체가 있음  직원 / 3단근조화환+영정바구니</td>
										<td></td>
									</tr>
									<tr>
										<td>7</td>
										<td>특이사항</td>
										<td>용품 정상 배치전까지 의전배송<br> 지도사 3일근무  <br> 패키지행사상품 235만원, 275만원 <br> 제주지역  장례관리사 1명 또는 제주용품 택 1  - 본인,배우자,자녀,양가부모,승중상에 한하여</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
					<div class="item-content">
						<div class="item">
							<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
								<tbody>
									<tr>
										<td class="title">고인명</td>
										<td class="value"><input type="text" class="form-control p-0"></td>
									</tr>
									<tr>
										<td class="title">상주명</td>
										<td class="value"><input type="text" class="form-control p-0"></td>
									</tr>
									<tr>
										<td class="title">호실</td>
										<td class="value"><input type="text" class="form-control p-0"></td>
									</tr>
									<tr>
										<td class="title">장묘형태</td>
										<td class="value">
											<div class="dropdown">
												<div class="dropdown-input">
													<input type="text" id="" class="drop3btn form-control "
														placeholder="선택" onclick="" onkeyup="filterFunction(this)">
													<i class="down-icon bi bi-caret-down-fill"></i>
												</div>
												<div id="" class="dropdown-content">
													<a href="#about">본인상</a> <a href="#base">부친상</a> <a
														href="#blog">모친상</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="title">화장장</td>
										<td class="value"><input type="text" class="form-control p-0"></td>
									</tr>
									<tr>
										<td class="title">장지</td>
										<td class="value"><input type="text" class="form-control p-0"></td>
									</tr>
									<tr>
										<td class="title">관리사팀장</td>
										<td class="value">
											<div class="dropdown">
												<div class="dropdown-input">
													<input type="text" class="drop3btn form-control "
														placeholder="팀장검색" onclick=""
														onkeyup="filterFunction(this)"> <i
														class="down-icon bi bi-caret-down-fill"></i>
												</div>
												<div id="" class="dropdown-content">
													<a href="#about">본인상</a> <a href="#base">부친상</a> <a
														href="#blog">모친상</a>
												</div>
											</div>

										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="item">
							<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
								<tbody>
									<tr>
									<td class="title">별세일시</td>
									<td class="value">
										<div class="datebox d-flex">
											<div class="datePickerbox d-flex align-items-center mx-1">
												<input type="text" class="datePicker form-control py-0 mx-1 text-right"
													autocomplete="off" id="dieDate"	onfocus="this.blur()" inputmode="none">
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
									</td>
									</tr>
									<tr>
										<td class="title">입관일시</td>
										<td class="value">
											<div class="datebox d-flex">
												<div class="datePickerbox d-flex align-items-center mx-1">
													<input type="text" class="datePicker form-control py-0 mx-1 text-right"
														id="immiDate" autocomplete="off" onfocus="this.blur()" inputmode="none">
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

										</td>
									</tr>
									<tr>
										<td class="title">발인일시</td>
										<td class="value">
											<div class="datebox d-flex">
												<div class="datePickerbox d-flex align-items-center mx-1">
													<input type="text"  class="datePicker form-control py-0 mx-1 text-right"
														id="imprDate" autocomplete="off" onfocus="this.blur()" inputmode="none">
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

										</td>
									</tr>
									<tr>
										<td class="title">빈소도착</td>
										<td class="value">
											<div class="datebox d-flex">
												<div class="datePickerbox d-flex align-items-center mx-1">
													<input type="text" class="datePicker form-control py-0 mx-1 text-right"
														id="murDate"autocomplete="off" onfocus="this.blur()" inputmode="none">
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

										</td>
									</tr>
									<tr>
										<td class="title">용품도착</td>
										<td class="value">
											<div class="datebox d-flex">
												<div class="datePickerbox d-flex align-items-center mx-1">
													<input type="text"class="datePicker form-control py-0 mx-1 text-right"
													 	id="suplDate" autocomplete="off" onfocus="this.blur()" inputmode="none">
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

										</td>
									</tr>
									<tr>
										<td class="title">근조기설치</td>
										<td class="value">
											<div class="datebox d-flex ">
												<div class="datePickerbox d-flex align-items-center mx-1">
													<input type="text" class="datePicker form-control py-0 mx-1 text-right"
														id="flagDate"autocomplete="off"	onfocus="this.blur()" inputmode="none">
													<i	class="bi bi-calendar-check calendar-icon"></i>
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
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content" id="tab3">
					<div class="item-content">
						<div class="item">
							<div>
								<input id="allCheck" name="checkbox" class="form-check-input me-1" type="checkbox">
								<span>상담한 잘례 패키지 상품진행에 동의합니다.</span>
							</div>
							<div class="py-1">
								<input id="allCheck" name="checkbox" class="form-check-input me-1" type="checkbox">
								<span>
									개인정보 수집 및 활용 동의문
								</span>
							</div>
						</div>

						<div class="item">

							<div id="convasContent">
								<canvas id="canvas" style="border: 1px solid lightgray"></canvas>
							</div>
							<div style="text-align:right;margin-top:10px;">
								<button type="button" id="save" class="btn btn-secondary">확인</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="item">
		<div id="nextPage">
			<button class="btn btn-primary nextBtn">
				상담결과등록으로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div> -->

</div>
<script>
$('#menu-nav').html("고객서명 /등록")

$('#convasContent').css('width',$('#tab3 .item:nth-child(2)').width()/2);
$('#convasContent').css('height',$('#tab3 .item:nth-child(2)').width()/4);

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});




$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = '/customSignSearchContent';
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

	var url = '/customSignRegContent';
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

<script src="js/sign.js"></script>

