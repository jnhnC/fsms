<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">
<link href="./css/component/search.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<script src="./js/selectSearch.js"></script>
<script src="./js/datepicker.js"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap-datepicker.css">
<script src="./bootstrap/js/bootstrap-datepicker.js"></script>
<script src="./bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<link href="./css/pa/pa001.css" rel="stylesheet">

<div id="paSearchContent">

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
						<input type="text" class="drop3btn form-control " placeholder="경기본부"
							onclick="" onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<!-- <div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div> -->
				</div>
			</div>


			<div class="item">

			   	<button id="searchBtn" type="button" class="btn btn-secondary shadow-sm p-0 px-3 py-1" style="text-align:center" >
				 <i class="bi bi-search" style="font-size: calc(0.26vw + 11.6pt);"></i>
		  		</button>

		   		<!--  <button class="btn btn-secondary shadow-sm p-0 ">
					<div style="font-size: calc(0.26vw + 7.6pt);  padding:3px 14px ">저장</div>
			   	</button> -->

			</div>

		</div>
	</div>

	<div class="item"><!--3  -->
		<div id="mobile-search">
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
										<input type="text" class="datePicker" name="startDate" id="startDate" class="form-control" autocomplete="off"  onfocus="this.blur()"  inputmode="none" >
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
										<input type="text" class="datePicker" name="endDate" id="endDate"	class="form-control" autocomplete="off"   onfocus="this.blur()"  inputmode="none" >
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
										<input type="text"  class="drop3btn form-control " placeholder="진행상태"  inputmode="none" onfocus="this.blur()"  autocomplete="off"
											 onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div class="dropdown-content">
										<a href="#about">배송중</a>
										<a href="#base">상품설명완료</a>
										<a href="#blog">상담완료</a>
									</div>
								</div>
							</div>


							</td>
							<td style="border-right: 0px;">
								<div class="inputbox">
									<div class="table-title">
										<span>대상자</span>
									</div>
									<div>
										<input type="text"	class="form-control input-bottom-border" placeholder="대상자"  />
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td style="border-left: 0px;">
							<div class="dropbox">
								<div class="table-title">
									<span>근조기</span>
								</div>
								<div class="dropdown">
									<div class="dropdown-input">
										<input type="text"  class="drop3btn form-control " placeholder="근조기"  inputmode="none" onfocus="this.blur()"  autocomplete="off"
											 onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div class="dropdown-content">
										<a>1일차</a>
										<a>2일차</a>
										<a>미회수</a>
										<a>회사</a>
									</div>
								</div>
							</div>


							</td>
							<td style="border-right: 0px;">
								<div class="inputbox">
									<div class="table-title">
										<span>상담결과</span>
									</div>
									<div class="dropdown">
									<div class="dropdown-input">
										<input type="text"  class="drop3btn form-control " placeholder="상담결과"  inputmode="none" onfocus="this.blur()"  autocomplete="off"
											 onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div class="dropdown-content">
										<a>기본지원</a>
										<a>선택지원</a>
										<a>대체지원</a>
										<a>패키지</a>
									</div>
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
							<td style="width:5%"></td>
							<td style="width:10%">진행상태<br>요청팀장</td>
							<td style="width:10%">주문번호<br>요청일자</td>
							<td style="width:30%">장례식장<br>고객사</td>
							<td style="width:30%">품목코드<br>품목명</td>
							<td style="width:10%;margin-top:10px;">승인</td>
						</tr>
					</thead>
					<tbody id="soInfoList">
						<!-- ajax에서 리스트 처리  -->

				  	</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<input type="hidden" name="itemAddNo">
<input type="hidden" name="soNo">
<input type="hidden" name="soQty">
<input type="hidden" name="poBpCd">
<input type="hidden" name="paaItemCd">

<input type="hidden" name="hsType">
<input type="hidden" name="hsCode">
<input type="hidden" name="orderDt1">
<input type="hidden" name="adPackItem">
<input type="hidden" name="soldToParty">





<script>
$('#menu-nav').html("품목추가승인")

$( document ).ready(function() {
	sos();
});

$('#searchBtn').click(function(){
	sos();
});

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('#paSearchContent').on('click', '.saveBtn', function(e){
	var con_test = confirm("승인하시겠습니까?");


	if(con_test == true){
		$('input[name="itemAddNo"]').val($(this).parent().parent().find(".itemAddNo").text());
		$('input[name="soNo"]').val($(this).parent().parent().find(".soNo").text());
		$('input[name="paaItemCd"]').val($(this).parent().parent().find(".itemCd").text());
		$('input[name="poBpCd"]').val($(this).parent().parent().find(".poBpCd").text());
		$('input[name="soQty"]').val($(this).parent().parent().find(".soQty").text());

		$.ajax({
	        type : "post",
	        url : "paa",
	        dataType : 'json',
	        data: $("#form").serialize(), //보낼데이터
	        success        :    function(data){
		        alertBox("저장되었습니다","primary");
		        refreshPage();
	        }
			, beforeSend: function() {
				$('.loadingbar').css("display","block");
		    },
		    complete:function(){
		     	$('.loadingbar').css("display","none");
		    }
		});
	}

});

var sos = function (){

	$.ajax({
        type : "get",
        url : "./api/paa",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
           	$('#soInfoList').empty();
           	var list;

           	if(data.length > 0 ){

				$(data).each(function(i, e) {
					list += "<tr class='so-info'>"+
					"<td style='display:none;'><input type='hidden' class='soNo' value='"+e.soNo+"'></td>"+
					"<td>"+ (++i) +"</td>"+
					"<td>"+e.poStatus+"<br>"+e.empNm+"</td>"+
					"<td>"+e.soNo+"<br>"+e.addDt+"</td>"+
					"<td class='text-start ps-5'>"+e.dlvyNm+"<br>"+e.bpNm+"</td>"+
					"<td class='text-start ps-3'>"+e.itemCd+"<br>"+e.itemNm+"</td>"+
					"<td class=''>"+
					"<button type='button' class='btn btn-secondary shadow-sm p-0 saveBtn'>"+
						"<div style='font-size: calc(0.26vw + 8.6pt); padding:4px 14px'>승인</ div>"+
			   		"</button>"+
					"</td>"+
				    "<td class='itemAddNo d-none'>"+e.itemAddNo+"</td>"+
					"<td class='soNo d-none'>"+e.soNo+"</td>"+
					"<td class='itemCd d-none'>"+e.itemCd+"</td>"+
					"<td class='poBpCd d-none'>"+e.poBpCd+"</td>"+
					"<td class='soQty d-none'>"+e.soQty+"</td>"+
					"</tr>";
			 	});

			}else{

				list = '<td colspan="6">등록된 데이터가 없습니다</td>';
			}
			$('#soInfoList').html(list);
        }
		, beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
	});

};



var refreshPage = function() {

	sos();
};




</script>


