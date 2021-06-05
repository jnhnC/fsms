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
<!-- currentCss -->
<link href="./css/fc/fc001.css" rel="stylesheet">

<div id="finalCheckSearchContent">

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

			  <button id="searchBtn"  type="button" class="btn btn-secondary shadow-sm p-0 px-3 py-1" style="text-align:center" >
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
									<div>
										<input type="text"	class="form-control input-bottom-border" placeholder="대상자"  />
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
							<td style="width:10%">진행상태<br>사전상담</td>
							<td style="width:28%">주문일시<br>고객사</td>
							<td style="width:23%">경조사유<br>장례식장</td>
							<td style="width:15%">대상자<br>의전팀장</td>
							<td style="width:20%">상담결과<br>지원내역</td>
						</tr>
					</thead>
					<tbody id="soInfoList">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="soNo">
<input type="hidden" name="poBpCd">
<input type="hidden" name="adPackItem">
<input type="hidden" name="hsType">
<input type="hidden" name="hsCode">
<input type="hidden" name="orderDt1">
<input type="hidden" name="adType">
<input type="hidden" name="billToParty">
<input type="hidden" name="soldToParty">

<script>
$( document ).ready(function() {
	sos();
});

$('#searchBtn').click(function(){
	sos();
});

$('#menu-nav').html("최종점검/조회")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('#finalCheckSearchContent').on('click', '.tablebox tbody tr', function(){
	 var soNo = $(this).find(".soNo").val();
		$('input[name="soNo"]').val(soNo);
		$('input[name="poBpCd"]').val($(this).find(".poBpCd").html());
		$('input[name="hsType"]').val($(this).find(".hsType").html());
		$('input[name="hsCode"]').val($(this).find(".hsCode").html());
		$('input[name="orderDt1"]').val($(this).find(".orderDt1").html());
		$('input[name="adType"]').val($(this).find(".adType").html());
		$('input[name="adPackItem"]').val($(this).find(".adPackItem").html());
		$('input[name="billToParty"]').val($(this).find(".billToParty").html());
		$('input[name="soldToParty"]').val($(this).find(".soldToParty").html());


	var url = './fc/1';
    $.ajax({
        type        :    "post",
        url : url,
        dataType    :    'html',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);
            $('#finalCheckSearchContent').off("click");
        }
		, beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
    });

});

var sos = function (){

	$.ajax({
        type : "get",
        url : "./api/fc",
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
					"<td>"+e.poStatusNm+"</td>"+
					"<td>"+e.orderDt+"</td>"+
					"<td class='text-start px-3'>"+e.hsNm+"</td>"+
					"<td>"+e.ownNm+"</td>"+
					"<td class='text-start px-3'>"+e.itemAcct+"</td>"+
					"<td class='poBpCd d-none'>"+e.poBpCd+"</td>"+
					"<td class='adPackItem d-none'>"+e.adPackItem+"</td>"+
					"<td class='hsType d-none'>"+e.hsType+"</td>"+
					"<td class='hsCode d-none'>"+e.hsCode+"</td>"+
					"<td class='ad d-none'>"+e.hsCode+"</td>"+
					"<td class='orderDt1 d-none'>"+e.orderDt1+"</td>"+
					"<td class='adType d-none'>"+e.adType+"</td>"+
					"<td class='soldToParty d-none'>"+e.soldToParty+"</td>"+
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


</script>



