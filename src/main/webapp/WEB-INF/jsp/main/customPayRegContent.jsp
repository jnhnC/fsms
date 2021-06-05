<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="/css/mobile/tableList.css" rel="stylesheet">
<link href="/css/mobile/search.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<link href="/css/mobile/tab.css" rel="stylesheet">
<link href="/css/mobile/buttonbar.css" rel="stylesheet">
<link href="/css/mobile/nextpage.css" rel="stylesheet">

<script src="/js/datepicker.js"></script>
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<script src="/js/selectSearch.js"></script>
<script src="/js/tab.js"></script>

<link href="/css/contents/customPayRegContent.css" rel="stylesheet">


<div id="customPayRegContent" >

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
				<li class="nav-item"><a class="nav-link active">상담현황</a></li>
				<li class="nav-item"><a class="nav-link">서명</a></li>
				<li class="nav-item"><a class="nav-link">결제</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="item-content">
						<div class="item">
							<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
								<tbody>
									<tr>
										<td class="title">고인명</td>
										<td class="value"></td>
									</tr>
									<tr>
										<td class="title">상주명</td>
										<td class="value"></td>
									</tr>
									<tr>
										<td class="title">호실</td>
										<td class="value"></td>
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
										<td class="value"></td>
									</tr>
									<tr>
										<td class="title">장지</td>
										<td class="value"></td>
									</tr>
									<tr>
										<td class="title">관리사팀장</td>
										<td class="value">
											<div class="dropdown">
												<div class="dropdown-input">
													<input type="text" id="" class="drop3btn form-control "
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
											<div class="datebox">
												<div class="datePickerbox">
													<input type="text" class="datePicker" id="dieDate"
														class="form-control today" autocomplete="off"
														onfocus="this.blur()" inputmode="none"> <i
														class="bi bi-calendar-check calendar-icon"></i>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="title">입관일시</td>
										<td class="value">
											<div class="datebox">
												<div class="datePickerbox">
													<input type="text" class="datePicker" id="immiDate"
														class="form-control today" autocomplete="off"
														onfocus="this.blur()" inputmode="none"> <i
														class="bi bi-calendar-check calendar-icon"></i>
												</div>
											</div>

										</td>
									</tr>
									<tr>
										<td class="title">발인일시</td>
										<td class="value">
											<div class="datebox">
												<div class="datePickerbox">
													<input type="text" class="datePicker" id="imprDate"
														class="form-control today" autocomplete="off"
														onfocus="this.blur()" inputmode="none"> <i
														class="bi bi-calendar-check calendar-icon"></i>
												</div>
											</div>

										</td>
									</tr>
									<tr>
										<td class="title">빈소도착</td>
										<td class="value">
											<div class="datebox">
												<div class="datePickerbox">
													<input type="text" class="datePicker" id="murDate"
														class="form-control today" autocomplete="off"
														onfocus="this.blur()" inputmode="none"> <i
														class="bi bi-calendar-check calendar-icon"></i>
												</div>
											</div>

										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
						<div class="item-content">

						<div class="item">
							<script>
								$('#convasContent').css('width',$('#tab2').width());
								$('#convasContent').css('height',$('#tab2').width()/2);
							</script>

							<div id="convasContent" >
								<canvas id="canvas" style="border: 1px solid lightgray"></canvas>
							</div>
							<div style="text-align:right;">
								<button type="button" id="save" class="btn btn-success">확인</button>
							</div>
							<!-- 사인 js는 화면그려지고 난 다음에 적용해야 함 -->
							<script src="js/sign.js"></script>

						</div>
					</div>
				</div>
				<div class="content" id="tab3">
					<div>
						<div class="title"></div>
						<div>
							<div>
								<div class="d-flex align-items-center">
									<span>결제대상금액</span>
									<span><input type="text" class="form-control h-25"></span>
								</div>
							</div>
							<div>

							</div>
							<div>

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
$('#menu-nav').html("고객결제 /등록")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
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
