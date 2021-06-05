<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="/css/component/tableList.css" rel="stylesheet">
<link href="/css/component/buttonbar.css" rel="stylesheet">
<link href="/css/component/search.css" rel="stylesheet">
<link href="/css/component/selectSearch.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>
<script src="/js/datepicker.js"></script>
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>
<!-- currentCss -->
<link href="/css/mobile/teamSearchContent.css" rel="stylesheet">


<div id="teamSearchContent">

	<div class="item"><!--1  -->
	</div>


	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div class="item" >
				<!-- <i class="bi bi-chevron-left"></i> -->
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control" placeholder="경기본부" onkeyup="filterFunction(this)">
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

			   	<button class="btn btn-secondary shadow-sm p-0 px-3 py-1" style="text-align:center" >
				 <i class="bi bi-search" style="font-size: calc(0.26vw + 11.6pt);"></i>
		  		</button>

		  		<!--  <button class="btn btn-secondary shadow-sm p-0 ">
					<div style="font-size: calc(0.26vw + 7.6pt);  padding:3px 14px ">저장</div>
			   	</button> -->
			</div>

		</div>
	</div>

	<div class="item"><!--3  -->
		<div id="mobile-search" class="">
			<div class="title">
				<div>검색조건</div>
				<div class="hideButton"><i class="bi bi-caret-up-fill"></i></div>
			</div>
			<div class="table-box">
				<table>
					<tbody>
						<tr>
							<td style="border-left: 0px;">
								<div class="datebox">
									<div class="table-title">
										<span>주문일자(From)</span>
									</div>
									<div class="datePickerbox">
										<input type="text" class="datePicker" id="startDate" name="startDate" class="form-control" autocomplete="off"  inputmode="none" >
										<i class="bi bi-calendar-check calendar-icon"></i>
									</div>
								</div>
							</td>
							<td style="border-right: 0px;">
								<div class="datebox">
									<div class="table-title">
										<span>주문일자(To)</span>
									</div>
									<div class="datePickerbox">
										<input type="text" class="datePicker" id="endDate" name="endDate" class="form-control" autocomplete="off"   inputmode="none" >
										<i class="bi bi-calendar-check calendar-icon"></i>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-left: 0px;">
								<div class="dropbox">
									<div class="table-title">
										<span>진행상태</span>
									</div>
									<div class="dropdown">
										<div class="dropdown-input">
											<input type="text" name="" class="drop3btn form-control" placeholder="진행상태" onkeyup="filterFunction(this)">
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
							<td style="border-right: 0px;">
								<div class="inputbox">
									<div class="table-title">
										<span>대상자</span>
									</div>
									<div class="dropdown">
										<input type="text" name="" class="form-control input-bottom-border" placeholder="대상자"  value=""/>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<div class="item">
		<!--4  -->
		<div class="mobile-result">
			<div class="tablebox">
				<table class="table">
					<thead>
						<tr id="header">
							<td></td>
							<td>상태<br>탁송
							</td>
							<td>주문일시<br>고객사
							</td>
							<td>대상자<br>의전팀장
							</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="tmDtos" items="${tmDtos}" varStatus="status">

						<tr>
							<td style="display:none;"><input type="hidden" name="soNo" class="soNo" value="${tmDtos.soNo}"></td>
							<td>${status.count}</td>
							<td>${tmDtos.poStatusNm}</td>
							<td>${tmDtos.orderDt}</td>
							<td>${tmDtos.ownNm}</td>
							<td>${tmDtos.dlvyNm}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
$('#menu-nav').html("팀장배정/조회")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('.tablebox tbody tr').click(function(){
	/* alert($(this).children(".soNo").val()); */
	alert($(this).html());
	/* alert($(this).children('td:first').html()); */
	/* var url = '/mobile/teamRegContent';
    $.ajax({
        type : "post",
        url : url,
        dataType : 'html',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);

        }
        , beforeSend: function() {

        },
        complete:function(){
        }
       }); */

});




</script>



