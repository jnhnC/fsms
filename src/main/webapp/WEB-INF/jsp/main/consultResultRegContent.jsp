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

<link href="/css/contents/consultResultRegContent.css" rel="stylesheet">


<div id="consultResultRegContent" >

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
	</div>

	<div class="item"><!--4  -->
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
					<td class="title">주문번호</td>
					<td class="value">상성디스풀레이</td>
					<td class="title">주문일시</td>
					<td class="value">CO2006273</td>
				</tr>
				<tr>
					<td class="title">고객사</td>
					<td class="value"></td>
					<td class="title">대상자</td>
					<td class="value"></td>
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

	<div class="item"><!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">장지/장례일정 등록</a></li>
				<li class="nav-item"><a class="nav-link">알림톡 전송
				</a></li>
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

				<div class="content" id="tab2">
					<div class="item-content">
						<div class="item">
							<div class="title">
								<div><i class="bi bi-file-person"></i> 발송대상자</div>
								<div>
									 <button class="btn btn-primary shadow-sm p-0 ">
										<div style="font-size: calc(0.26vw + 7.6pt);  padding:3px 14px ">추가</div>
								   	</button>
								</div>
							</div>
							<div class="mobile-result">
								<div class="tablebox">
									<table class="table">
										<thead>
											<tr id="header">
												<td></td>
												<td><input id="allCheck" name="checkbox"
													class="form-check-input me-1" type="checkbox"></td>
												<td>품목명</td>
												<td>수량</td>
												<td>QR코드</td>
												<td>출고일자</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td><input name="checkbox"
													class="form-check-input me-1" type="checkbox"></td>
												<td>인력지원</td>
												<td>1</td>
												<td>A0108670-A1228016</td>
												<td>2021-03-24</td>
											</tr>
											<tr>
												<td></td>
												<td><input name="checkbox"
													class="form-check-input me-1" type="checkbox"></td>
												<td>지원상품</td>
												<td>12</td>
												<td>A0102630-A1257018</td>
												<td>2021-03-24</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="title">
								<div><i class="bi bi-chat-dots"></i> 발송 메시지 내용</div>
								<div>
									 <button class="btn btn-warning shadow-sm p-0 ">
										<div style="font-size: calc(0.26vw + 7.6pt);  padding:3px 14px ">발송</div>
								   	</button>
								</div>
							</div>

							<div class="alimtalk-content">


							</div>
						</div>
					</div>

				</div>

			</div>
		</div>

	<!-- 	<div class="alimtalkBtn">
			<button type="button" class="btn btn-warning">알림톡발송</button>
		</div> -->
	</div>
	<div class="item pt-3">
		<div id="nextPage">
			<button class="btn btn-primary nextBtn">
				고객서명페이지로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div>
</div>
<script>
$('#menu-nav').html("상담결과등록/등록(구.상담등록)")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});

$('.today').val(new Date().toISOString().slice(0, 10));



$('.nextBtn').click(function(){
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


</script>
