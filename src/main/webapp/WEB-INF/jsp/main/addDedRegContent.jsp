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

<link href="/css/contents/addDebRegContent.css" rel="stylesheet">


<div id="addDebRegContent" >

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
		<div class="table-content">
			<div class="mobile-result">
				<div class="title">
					추가항목
				</div>
				<div class="tablebox">
					<table class="table">
						<thead>
							<tr id="header">
								<td></td>
								<td>품목명</td>
								<td>수량</td>
								<td>판매단가</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" class="drop3btn form-control " placeholder="선택"
												onclick="" onkeyup="filterFunction(this)">
											<i class="down-icon bi bi-caret-down-fill"></i>
										</div>
										<div class="dropdown-content">
											<a href="#about">본인상</a>
											<a href="#base">부친상</a>
											<a href="#blog">모친상</a>
										</div>
									</div>

								</td>
								<td>1</td>
								<td>1,000,000</td>
							</tr>
							<tr>
								<td>2</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" class="drop3btn form-control " placeholder="선택"
												onclick="" onkeyup="filterFunction(this)">
											<i class="down-icon bi bi-caret-down-fill"></i>
										</div>
										<div class="dropdown-content">
											<a href="#about">본인상</a>
											<a href="#base">부친상</a>
											<a href="#blog">모친상</a>
										</div>
									</div>


								</td>
								<td>1</td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" class="drop3btn form-control " placeholder="선택"
												onclick="" onkeyup="filterFunction(this)">
											<i class="down-icon bi bi-caret-down-fill"></i>
										</div>
										<div class="dropdown-content">
											<a href="#about">본인상</a>
											<a href="#base">부친상</a>
											<a href="#blog">모친상</a>
										</div>
									</div>
								</td>
								<td>1</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="mobile-result">
				<div class="title">
					공제항목
				</div>
				<div class="tablebox">
					<table class="table">
						<thead>
							<tr id="header">
								<td></td>
								<td>품목명</td>
								<td>수량</td>
								<td>판매단가</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" class="drop3btn form-control " placeholder="선택"
												onclick="" onkeyup="filterFunction(this)">
											<i class="down-icon bi bi-caret-down-fill"></i>
										</div>
										<div class="dropdown-content">
											<a href="#about">본인상</a>
											<a href="#base">부친상</a>
											<a href="#blog">모친상</a>
										</div>
									</div>

								</td>
								<td>1</td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" class="drop3btn form-control " placeholder="선택"
												onclick="" onkeyup="filterFunction(this)">
											<i class="down-icon bi bi-caret-down-fill"></i>
										</div>
										<div class="dropdown-content">
											<a href="#about">본인상</a>
											<a href="#base">부친상</a>
											<a href="#blog">모친상</a>
										</div>
									</div>


								</td>
								<td>1</td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" class="drop3btn form-control " placeholder="선택"
												onclick="" onkeyup="filterFunction(this)">
											<i class="down-icon bi bi-caret-down-fill"></i>
										</div>
										<div class="dropdown-content">
											<a href="#about">본인상</a>
											<a href="#base">부친상</a>
											<a href="#blog">모친상</a>
										</div>
									</div>
								</td>
								<td>1</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$('#menu-nav').html("추가/공제 등록/등록")

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
