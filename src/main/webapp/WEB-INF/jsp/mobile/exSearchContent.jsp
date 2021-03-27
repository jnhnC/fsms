<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/mobile/search.css" rel="stylesheet">
<link href="/css/mobile/tableList.css" rel="stylesheet">
<link href="/css/mobile/buttonbar.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>
<script src="/js/datepicker.js"></script>
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<link href="/css/mobile/exSearchContent.css" rel="stylesheet">

<div id="exSearchContent" style="white-space: nowrap;">

	<div class="item"> <!--1  -->
		<%-- <jsp:include page="header.jsp" flush="false" /> --%>
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
				<button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>
			   	<button class="btn btn-secondary shadow-sm pt-1">
					<!-- <i class="far fa-save"></i> -->
					<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
			   	</button>


			</div>

		</div>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-search" class="">
			<div class="title">
				<div>검색조건</div>
			</div>
			<div class="table-box">
				<table>
					<tbody>
						<tr>
							<td style="border-left: 0px;">
								<div class="datebox">
									<div>
										<span>주문일자(From)</span>
									</div>
									<div class="datePickerbox">
										<input type="text" class="datePicker" id="startDate" class="form-control" autocomplete="off"  inputmode="none" >
										<i class="bi bi-calendar-check calendar-icon"></i>
									</div>
								</div>
							</td>
							<td style="border-right: 0px;">
								<div class="datebox">
									<div>
										<span>주문일자(To)</span>
									</div>
									<div class="datePickerbox">
										<input type="text" class="datePicker" id="lastDate"	class="form-control" autocomplete="off"   inputmode="none" >
										<i class="bi bi-calendar-check calendar-icon"></i>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td style="border-left: 0px;">
							<div class="dropbox">
								<div>
									<span>진행상태</span>
								</div>
								<div class="dropdown">
									<input type="text"  class="drop3btn form-control " placeholder="진행상태"
										 onkeyup="filterFunction(this)">
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
								<div class="inputbox">
									<div>
										<span>대상자</span>
									</div>
									<div>
										<input type="text"	class="form-control input-bottom-border" placeholder="대상자" />
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<div class="item"><!--3  -->
		<div id="" class="mobile-result">
			<div class="tablebox">
				<table class="table">
				  <thead>
				  	<tr id="header">
				      <td></td>
				      <td>상태<br>탁송</td>
				      <td>주문일시<br>고객사</td>
				      <td>대상자<br>의전팀장</td>
				      <td></td>
		          </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th>1</th>
				      <td>배정완료</td>
				      <td>2021-03-03 17:00<br>제일병원</td>
				      <td>테스트<br>한재호</td>
				      <td>부친<br>삼성</td>
				    </tr>
				     <tr>
				      <th>2</th>
				      <td>배정완료</td>
				      <td>2021-03-03 17:00<br>제일병원</td>
				      <td>테스트<br>이수환</td>
				       <td>부친<br>삼성</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<script>
$('#menu-nav').html("출고처리/조회")

$('.tablebox tbody tr').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = '/mobile/exRegContent';
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