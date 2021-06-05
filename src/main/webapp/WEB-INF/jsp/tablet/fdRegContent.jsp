<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">


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

<link href="/css/tablet/fdRegContent.css" rel="stylesheet">


<div id="fdRegContent" >

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
				<li class="nav-item"><a class="nav-link active">근무현황등록</a></li>
				<li class="nav-item"><a class="nav-link">사진등록</a></li>
				<li class="nav-item"><a class="nav-link">기타 정보입력</a></li>
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
										<td>시작일</td>
										<td>출근(시)</td>
										<td>출근(분)</td>
										<td>퇴근(시)</td>
										<td>퇴근(분)</td>
										<td>근무내용</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>2</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>3</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>4</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
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
							<div><!-- <i class="bi bi-box" style="font-size: calc(0.26vw + 13.08pt);"></i> -->
								<span style="font-size: calc(0.26vw + 10.08pt);">용품설치</span>
							</div>
							<div><button type="button" class="btn btn-danger p-1" >사진올리기</button></div>
						</div>

						<div class="item">
							<div><!-- <i class="bi bi-box" style="font-size: calc(0.26vw + 13.08pt);"></i> -->
								<span style="font-size: calc(0.26vw + 10.08pt);">근조기설치</span>
							</div>
							<div><button type="button" class="btn  btn-secondary p-0" >사진올리기</button></div>
						</div>

						<div class="item">
							<div><!-- <i class="bi bi-box" style="font-size: calc(0.26vw + 13.08pt);"></i> -->
								<span style="font-size: calc(0.26vw + 10.08pt);">인수증</span>
							</div>
							<div><button type="button" class="btn  btn-warning p-0" >사진올리기</button></div>
						</div>

						<div class="item">
							<div><!-- <i class="bi bi-box" style="font-size: calc(0.26vw + 13.08pt);"></i> -->
								<span style="font-size: calc(0.26vw + 10.08pt);">공급확인서</span>
							</div>
							<div><button type="button" class="btn btn-primary p-0" >사진올리기</button></div>
						</div>
					</div>
				</div>
				<div class="content" id="tab3">
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
$('#menu-nav').html("FD일지/등록")

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
