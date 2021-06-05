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

<link href="./css/ex/ex001.css" rel="stylesheet">

<div id="exSearchContent" class="card mx-2 rounded border-0" style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0 / 2%) !important;">

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
				<table class="table" style=" white-space: nowrap;">
					<thead>
			  			<tr id="header">
				      		<td></td>
				      		<td>상태<br>탁송</td>
				      		<td>주문일시<br>고객사</td>
				      		<td>대상자<br>의전팀장</td>
				      		<td>경조사유<br>장례식장</td>
		          		</tr>
				  	</thead>
				 	<tbody id="soInfoList">
						<c:choose>
						    <c:when test="${not empty soInfos}">
						    	<c:forEach var="soInfo" items="${soInfos}" varStatus="status">
								<tr>
									<td style="display:none;"><input type="hidden" class="soNo" value="${soInfo.soNo}"></td>
									<td >${status.count}</td>
									<td>${soInfo.poStatusNm}</td>
									<td>${soInfo.orderDt}</td>
									<td>${soInfo.ownNm}</td>
									<td>${soInfo.dlvyNm}</td>
								</tr>
								</c:forEach>
					   		</c:when>
					    	<c:otherwise>
								<tr>
									<td colspan="5">등록된 데이터가 없습니다</td>
								</tr>
						    </c:otherwise>
						</c:choose>
				  	</tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<input type="hidden" name="soNo">

<script>
$('#menu-nav').html("출고처리/조회");

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


$('#exSearchContent').on('click', '.tablebox tbody tr', function(){

	var soNo = $(this).find(".soNo").val();
	$('#form [name="soNo"]').val(soNo);

	var url = './ex/1';
    $.ajax({
        type        :    "post",
        url : url,
        dataType    :    'html',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);
            $('#exSearchContent').off("click");
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
        url : "./api/ex",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
           	$('#soInfoList').empty();
           	var list;

           	if(data.length > 0 ){

				$(data).each(function(i, e) {
					list += "<tr>"+
					"<td style='display:none;'><input type='hidden' class='soNo' value='"+e.soNo+"'></td>"+
					"<td>"+ (++i) +"</td>"+
					"<td>"+e.poStatusNm+"</td>"+
					"<td>"+e.orderDt+"</td>"+
					"<td>"+e.ownNm+"</td>"+
					"<td class='text-start px-3'>"+e.hsNm+"</td>"+
					"</tr>";
			 	});

			}else{

				list = '<td colspan="5">등록된 데이터가 없습니다</td>';
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