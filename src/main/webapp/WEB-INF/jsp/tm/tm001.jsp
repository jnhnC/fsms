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
<link href="./css/tm/tm001.css" rel="stylesheet">


<div id="teamSearchContent" class="card mx-2 rounded border-0" style="box-shadow: 0 0.5rem 0.5rem rgb(0 0 0 / 2%) !important;">
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
					<!-- <div class="dropdown-content">
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

	<div class="item" style="overflow-x:scroll"><!--3  -->
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
									<div class="dropdown">
										<input type="text" name="" class="form-control input-bottom-border" placeholder="대상자" />
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
		<div class="mobile-result" >
			<div class="tablebox" style="overflow-x:auto;">
				<table class="table" style=" white-space: nowrap;">
					<thead>
						<tr id="header">
							<td></td>
							<td>상태<br>탁송</td>
							<td>주문일시<br>고객사</td>
							<td>대상자<br>의전팀장</td>
							<td class="text-start px-3">장례사유<br>장례식장</td>
						</tr>
					</thead>
					<tbody id="soInfoList">
						<%-- <c:choose>
						    <c:when test="${not empty teams}">
						    	<c:forEach var="team" items="${teams}" varStatus="status">
								<tr>
									<td style="display:none;"><input type="hidden" class="soNo" value="${team.soNo}"></td>
									<td >${status.count}</td>
									<td>${team.poStatusNm}</td>
									<td>${team.orderDt}</td>
									<td>${team.ownNm}</td>
									<td class="text-start px-3">${team.dlvyNm}</td>
								</tr>
								</c:forEach>
					   		</c:when>
					    	<c:otherwise>
								<tr>
									<td colspan="5">등록된 데이터가 없습니다</td>
								</tr>
						    </c:otherwise>
						</c:choose> --%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<input type="hidden" name="soNo">

<script>

$( document ).ready(function() {
	soInfos();
});

$('#menu-nav').html("팀장배정/조회");

$('#searchBtn').click(function(){
	soInfos();
});


$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});

$('#teamSearchContent').on('click', '.tablebox tbody tr', function(){
	var soNo = $(this).find(".soNo").val();
	if (soNo) {
		$('input[name="soNo"]').val(soNo);
		var url = './tm/' + soNo;
		$.ajax({
			type : "get",
			url : url,
			dataType : 'html',
			data : $("#form").serialize(), //보낼데이터
			success : function(data) {
				$("#content").children().remove();
				$("#content").html(data);
				$('#teamSearchContent').off("click");
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


var soInfos = function (){

	$.ajax({
        type : "get",
        url : "./api/tm",
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
}



</script>



