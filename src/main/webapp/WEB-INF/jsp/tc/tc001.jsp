<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/component/search.css" rel="stylesheet">
<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<script src="./js/selectSearch.js"></script>
<script src="./js/datepicker.js"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap-datepicker.css">
<script src="./bootstrap/js/bootstrap-datepicker.js"></script>
<script src="./bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<link href="./css/tc/tc001.css" rel="stylesheet">

<div id="tcSearchContent" class="card mx-2 rounded border-0" style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0 / 2%) !important;">

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
					<!-- <div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div> -->
				</div>
			</div>


			<div class="item">
				<button id="searchBtn" type="button" class="btn btn-secondary shadow-sm  p-0" >
					 <i class="bi bi-search" style="font-size: calc(0.26vw + 11.6pt); padding:0 14px;"></i>
		  		</button>
			 <!--   	 <button class="btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button> -->
			</div>
		</div>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-search" >
			<div class="title rounded">
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
										<input type="text" class="datePicker" id="endDate"	name="endDate" class="form-control" autocomplete="off"   inputmode="none" >
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
										<input type="text"  class="drop3btn form-control " placeholder="진행상태"
											 onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
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
									<div class="table-title">
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
			<div class="tablebox" style="overflow-x:auto;">
				<table class="table" style=" white-space: nowrap;">					<thead>
			  			<tr id="header">
				      		<td></td>
							<td>상태<br>탁송</td>
							<td>주문일시<br>고객사</td>
							<td>대상자<br>의전팀장</td>
							<td class="text-start px-3">장례사유<br>장례식장</td>
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
<input type="hidden" name="itemCd">
<input type="hidden" name="hsType">
<input type="hidden" name="hsCode">
<input type="hidden" name="orderDt1">
<input type="hidden" name="adPackItem">
<input type="hidden" name="soldToParty">


<script>
$('#menu-nav').html("유선상담/조회");

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


$('#tcSearchContent').on('click', '.tablebox tbody tr', function(){

	$('input[name="poBpCd"]').val($(this).find(".poBpCd").html());
	$('input[name="itemCd"]').val($(this).find(".itemCd").html());
	$('input[name="hsType"]').val($(this).find(".hsType").html());
	$('input[name="hsCode"]').val($(this).find(".hsCode").html());
	$('input[name="orderDt1"]').val($(this).find(".orderDt1").html());
	$('input[name="adPackItem"]').val($(this).find(".adPackItem").html());
	$('input[name="soldToParty"]').val($(this).find(".soldToParty").html());
	 var soNo = $(this).find(".soNo").val();
	$('input[name="soNo"]').val(soNo);

	 var url = './tc/1';
    $.ajax({
        type        :    "post",
        url : url,
        dataType    :    'html',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);
            $('#tcSearchContent').off("click");
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
        url : "./api/tc",
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
					"<td>"+e.ownNm+"</td>"+
					"<td class='text-start px-3'>"+e.hsNm+"</td>"+
					"<td class='poBpCd d-none'>"+e.poBpCd+"</td>"+
					"<td class='itemCd d-none'>"+e.itemCd+"</td>"+
					"<td class='hsType d-none'>"+e.hsType+"</td>"+
					"<td class='hsCode d-none'>"+e.hsCode+"</td>"+
					"<td class='orderDt1 d-none'>"+e.orderDt1+"</td>"+
					"<td class='adPackItem d-none'>"+e.adPackItem+"</td>"+
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