<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/search.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/tab.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">
<link href="./css/component/nextpage.css" rel="stylesheet">
<link href="./css/component/tableRow.css" rel="stylesheet">

<script src="./js/datepicker.js"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap-datepicker.css">
<script src="./bootstrap/js/bootstrap-datepicker.js"></script>
<script src="./bootstrap/js/bootstrap-datepicker.ko.min.js"></script>

<script src="./js/selectSearch.js"></script>
<script src="./js/tab.js"></script>

<link href="./css/pa/pa002.css" rel="stylesheet">

<div id="paRegContent" >

	<div class="item"> <!--1  -->
		<%-- <jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div id="prevPage" class="item" >
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control " placeholder="경기본부"
							onclick="" onkeyup="filterFunction(this)">
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
		    	 <button type="button" id="saveBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>


			</div>

		</div>

	</div>

	<div class="item"><!--3  -->
		<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
					<td class="title">주문번호</td>
					<td class="value">${so.soNo}</td>
					<td class="title">주문일시</td>
					<td class="value">${so.orderDt}</td>
				</tr>
				<tr>
					<td class="title">고객사</td>
					<td class="value">${so.bpNm} </td>
					<td class="title">대상자</td>
					<td class="value">${so.ownNm}</td>
				</tr>
				<tr>
					<td class="title">장례식장</td>
					<td class="value">${so.dlvyNm}</td>
					<td class="title">경조사유</td>
					<td class="value">${so.hsNm}</td>
				</tr>
			</tbody>
		</table>
	</div>


	<div class="item ">
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs ms-3">
				<li class="nav-item"><a class="nav-link active">품목추가</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="text-end" style="">
						<span id="addRowBtn"><i class="h2 bi bi-plus-square text-primary mx-1"></i></span>
						<span id="delRowBtn"><i class="h2 bi bi-dash-square text-danger mx-1"></i></span>
					</div>
					<div class="mobile-result m-2">
						<div class="tablebox" style="">
							<table class="table">
								<thead>
									<tr id="header">
										<td class="d-none"></td>
										<td class="d-none"></td>
										<td style="width:50px;"></td>
										<td style="width:80px;">품목코드</td>
										<td style="width:400px;">품목명</td>
										<td style="width:50px;">재고</td>
										<td style="width:50px;">수량</td>
									</tr>
								</thead>
								<tbody id="paList">
									<c:forEach var="pa" items="${pas}" varStatus="status">
										<tr>
											<td class="d-none"><input type='hidden' class='status' name='status' value='U'> </td>
											<td class="d-none"><input type='hidden' class='seq' name='seq' value='${pa.seq}'> </td>
											<td>${status.count }</td>
											<td>${pa.itemCd}</td>
											<td class=''>
												<input type="hidden" name="itemCd" value= "${pa.itemCd}">
												<c:forEach var="addItem" items="${addItems}" varStatus="status">
													<c:if test="${addItem.itemCd eq pa.itemCd}">
														${addItem.itemNm}
													</c:if>
												    </c:forEach>
											</td>
											<td >
												${pa.invQty}
											</td>
											<td class='d-flex justify-content-center'>
												<input class='form-control py-0 px-1 text-center' name='addQty' value='${pa.addQty}' type='text' style='width:80px'>
											</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<input type="hidden" name="soNo" value="${so.soNo}">
<input type="hidden" name="soldToParty" value="${so.soldToParty}">
<input type="hidden" name="hsType" value="${so.hsType}">
<input type="hidden" name="pakage" value="${so.adPackItem}">
<input type="hidden" name="subs" value="${so.adChItem}">
<input type="hidden" name="trCount" id="trCount" value="">

<script>
$('#menu-nav').html("품목추가/등록")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('#paRegContent').on("click", ".itemCdBox", function() {
	$(this).closest("tr").find('.itemCdValue').html($(this).find('.itemCd').html());
	$(this).closest("tr").find('.invQtyValue').html($(this).find('.invQty').html());


	$(this).parent().find('input[name="itemCd"]').val($(this).find('.itemCd').html());
});


$('#addRowBtn').click(function(){
	var count = $('#paList>tr').length;

	<c:choose>
		<c:when test = "${not empty addItems }">
			var list = "<tr>"+
			"<td class='d-none'><input type='hidden' class='status' name='status' value='I'></td>"+
			"<td class='d-none'><input type='hidden' class='seq' name='seq' value=''></td>"+
			"<td>"+ (++count) +"</td>"+
			"<td class='itemCdValue'></td>"+
			"<td class=''>"+
				"<div class='dropdown'>"+
					"<div class='dropdown-input'>"+
						"<input type='text' class='drop3btn form-control itemCdInput text-center' name='itemCdInput' style='ime-mode:active;'>"+
						 "<i class='down-icon bi bi-caret-down-fill'></i>"+
					"</div>"+
					"<div  class='dropdown-content rounded'>"+
						"<input type='hidden' name='itemCd' value=''>"+
						"<c:forEach var='addItem' items='${addItems}' varStatus='status'>"+
							"<a class='itemCdBox'>"+
								"<span class='badge bg-danger itemCd ms-5 me-2'>${addItem.itemCd}</span>"+
								"<span class='me-1 select-value'>${addItem.itemNm}</span>"+
								"<span class=''>${addItem.invQty}</span>"+
								"<span class='d-none invQty'>${addItem.invQty2}</span>"+
							"</a>"+
						"</c:forEach>"+
					"</div>"+
				"</div>"+
			"</td>"+
			"<td class='invQtyValue'>"+
			"</td>"+
			"<td class='d-flex justify-content-center'>"+
				"<input class='form-control py-0 px-1 text-center' name='addQty' value='1' type='text' style='width:80px'>"+
			"</td>"+

			"</tr>";

			$('#paList').append(list);

		</c:when>
		<c:otherwise>
			alertBox("해당 고객사는 품목추가 대상고객사가 아닙니다.","danger");
		</c:otherwise>
	</c:choose>


});



$('#saveBtn').click(function(){
	$('#trCount').val($('#paList tr').length);

	var saveFlag = 0;
	$('.invQtyValue').each(function(i, e){
	    if($(this).text() == '0'){
	    	saveFlag = 1;
		 }
	});

	if(saveFlag == 1){
		alertBox("재고수량이 '0' 인<br>상품이 포함되어 있습니다","warning");
	}else{
		saveItem();
	}


});

$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = 'pa';
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


/* 테이블 리스트 선택시 색변경 */
$('#paRegContent').on('click', '#paList tr', function(){
	if($(this).hasClass('backcolor')){
		$(this).removeClass("backcolor");

	}else if($(this).hasClass('statusD')){
		$(this).removeClass("statusD");
		$(this).find('.status').val("U");

	}else{
		$(this).addClass("backcolor");
	}



});

/* 삭제버튼 클릭시 STATUS D로 변경  */
$('#delRowBtn').click(function(){
	$('#paList tr').each(function (index, item) {
		if($(this).hasClass('backcolor')){
			if($(this).find('.dedStatus').val() == 'I'){
				$(this).remove();
			}
			$(this).removeClass("backcolor");
			$(this).addClass("statusD");
			$(this).find('.status').val("D");

		}

	});
});





var saveItem = function (){

	$.ajax({
        type : "post",
        url : "pa",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
			alertBox("저장이 완료 되었습니다.","primary");
             	refreshPage();
        }
		, beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
	});
};


var refreshPage = function (){

	var url = 'pa/1';
    $.ajax({
        type        :    "post",
        url : url,
        dataType    :    'html',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);
        }
   });
};





</script>
