<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<link href="./css/ad/ad002.css" rel="stylesheet">


<div id="addDebRegContent" >

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
					<div class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div>
				</div>
			</div>


			<div class="item">
				 <button type="button" id="searchBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">조회</div>
			   	</button>

				 <button type="button" id="saveBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>


			</div>

		</div>

	</div>

	<div class="item"><!--3  -->
	</div>

	<div class="item"><!--4  -->
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
					<td class="value">${so.bpNm}</td>
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

	<div class="item"><!--5  -->
		<div class="table-content">
			<div class="mobile-result">
				<div class="text-end">
					<span id="addAddBtn"><i class="h2 bi bi-plus-square text-primary mx-1"></i></span>
					<span id="delAddBtn"><i class="h2 bi bi-dash-square text-danger mx-1"></i></span>
				</div>
				<div class="title d-flex">
					<div class="px-2 flex-grow-1 bd-highlight">추가항목</div>
					<div class="px-2 bd-highlight">합계:</div>
					<div class="px-2 bd-highlight"><input type="text" id="addInput" class="form-control p-0 px-1 text-end"
						value="<fmt:formatNumber value="${total.addTotAmt}" groupingUsed="true"/>"
					></div>
				</div>

				<div class="tablebox">
					<table class="table">
						<thead>
							<tr id="header">
								<td class="d-none"></td>
								<td></td>
								<td style="width:130px">품목명</td>
								<td style="width:80px">수량</td>
								<td style="width:130px">판매단가</td>
							</tr>
						</thead>
						<tbody id="addList">
								<c:forEach var="inAdd" items="${inAdds}" varStatus="status" >
						           <tr>
						           		<td class="d-none"><input type='hidden' class='addStatus' name='addStatus' value='U'> </td>
										<td width="5" >${status.count}</td>
										<td width="10">
											<%-- <select class='form-select form-select-sm'  name="addCd"  aria-label='.form-select-sm example'>
												<option value="">선택</option>
										 		<c:forEach var="add" items="${adds}" varStatus="status">
											        <option value="${add.code}"  <c:if test="${add.code eq inAdd.itemCd}">selected</c:if>>${add.codeName}</option>
											    </c:forEach>
											</select> --%>
											<input type="hidden" name="addCd" value="${inAdd.itemCd}">
											${inAdd.itemNm}
										</td>
										<td width="10">
											<input type="text" class="form-control p-0 px-1 text-center" name= "addPoQty" value="${inAdd.poQty}">
										</td>
										<td width="30">
											<input type="text" class="form-control p-0 px-1 text-end addTotAmt1" name="addTotAmt1"
											value="<fmt:formatNumber value="${inAdd.totAmt1}" groupingUsed="true"/>"
											>
										</td>
									</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="mobile-result">
				<div class="text-end">
					<span id="addDedBtn"><i class="h2 bi bi-plus-square text-primary mx-1"></i></span>
					<span id="delDedBtn"><i class="h2 bi bi-dash-square text-danger mx-1"></i></span>
				</div>
				<div class="title d-flex">
					<div class="px-2 flex-grow-1 bd-highlight">공제항목</div>
					<div class="px-2 bd-highlight">합계:</div>
					<div class="px-2 bd-highlight"><input type="text" id="dedInput" class="form-control p-0 px-1 text-end"
						value="<fmt:formatNumber value="${total.dedTotAmt}" groupingUsed="true"/>"
					></div>
				</div>
				<div class="tablebox">
					<table class="table">
						<thead>
							<tr id="header">
								<td></td>
								<td style="width:130px">품목명</td>
								<td style="width:80px">수량</td>
								<td style="width:130px">판매단가</td>
							</tr>
						</thead>
						<tbody id="dedList">
								<c:forEach var="inded" items="${indeds}" varStatus="status" >
						           <tr>
						           		<td class="d-none"><input type='hidden' class='dedStatus' name='dedStatus' value='U'> </td>
										<td width="5" >${status.count}</td>
										<td width="10">
									<%-- 		<select class='form-select form-select-sm'  name="dedCd"  aria-label='.form-select-sm example'>
												<option value="">선택</option>
										 		<c:forEach var="ded" items="${deds}" varStatus="status">
											        <option value="${ded.code}"  <c:if test="${ded.code eq inded.itemCd}">selected</c:if>>${ded.codeName}</option>
											    </c:forEach>
											</select> --%>

											<input type="hidden" name="dedCd" value="${inded.itemCd}">
											${inded.itemNm}
										</td>
										<td width="10">
											<input type="text" class="form-control p-0 px-1 text-center" name= "dedPoQty" value="${inded.poQty}">
										</td>
										<td width="30">

											<input type="text" class="form-control p-0 px-1 text-end dedTotAmt1" name="dedTotAmt1"
											value="<fmt:formatNumber value="${inded.totAmt1}" groupingUsed="true"/>">
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

<div>
	<input type="hidden" name="soNo" value="${so.soNo}">
	<input type="hidden" name="addTrCount" id="addTrCount" >
	<input type="hidden" name="dedTrCount" id="dedTrCount" >

</div>

<script>
$('#menu-nav').html("추가/공제 등록/등록")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});

$('#searchBtn').click(function(){
	refreshPage();

});

/* ***************************************************************  */

$('#addDebRegContent').on('click', '.addTotAmt1', function(){
   if($(this).val() == 0){
	   $(this).val('') ;
	}
});

$('#addDebRegContent').on('click', '.dedTotAmt1', function(){
	if($(this).val() == 0){
	   $(this).val('') ;
	}
});

$('#addDebRegContent').on('keyup', '.addTotAmt1', function(){
   	inputNumberFormat(this);
   	sumAddPrice();

});

$('#addDebRegContent').on('keyup', '.dedTotAmt1', function(){
    inputNumberFormat(this);
    sumDedPrice();
});

/* ***************************************************************  */
$('#saveBtn').click(function(){
	$('#addTrCount').val($('#addList tr').length);
	$('#dedTrCount').val($('#dedList tr').length);

	$('.addTotAmt1').each(function (index, item) {
		$(this).val($(this).val().replace(/,/g, ''));
	});

	$('.dedTotAmt1').each(function (index, item) {
		$(this).val($(this).val().replace(/,/g, ''));
	});


	if(adValidate()){
		saveAd();
	}

});

/* ***************************************************************  */
 $('#addDebRegContent').on("click", ".addCdBox", function() {
		$(this).parent().find('input[name="addCd"]').val($(this).find('.addCd').html());
	});

 $('#addDebRegContent').on("click", ".dedCdBox", function() {
		$(this).parent().find('input[name="dedCd"]').val($(this).find('.dedCd').html());
	});
 /* ***************************************************************  */


$('#addAddBtn').click(function(){
	var count = $('#addList >tr').length;
	count++;
	var list =
	'<tr>'+
	'<td class="d-none"><input type="hidden" class="addStatus" name="addStatus" value="I"></td>'+
		'<td width="5"> '+ (count) +'</td>'+
		'<td width="">'+
		/* '<select class="form-select form-select-sm" name="addCd"  aria-label=".form-select-sm example">'+
			'<option value="">선택</option>'+
	 		'<c:forEach var="add" items="${adds}" varStatus="status">'+
		        '<option value="${add.code}">${add.codeName}</option>'+
		    '</c:forEach>'+
		'</select>'+
		 */
			 "<div class='dropdown'>"+
				"<div class='dropdown-input justify-content-center'>"+
					"<input type='text' id='addCdInput' class='drop3btn form-control text-center' placeholder='선택'"+
						"onkeyup='filterFunction(this)' style='' inputmode='none'>"+
					 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
				"</div>"+
				"<div  class='dropdown-content rounded'>"+
					"<input type='hidden' name='addCd' value=''>"+
					"<c:forEach var='add' items='${adds}' varStatus='status'>"+
						"<a class='addCdBox'>"+
							"<span class='d-none addCd'>${add.code}</span>"+
							"<span class='select-value'>${add.codeName}</span>"+
						"</a>"+
					"</c:forEach>"+
				"</div>"+
			"</div>"+

		'</td>'+
		'<td width="10">'+
		'<input type="text" class="form-control p-0 px-1 text-center" name= "addPoQty" value="1">'+
		'</td>'+
		'<td width="30">'+
		'<input type="text" class="form-control p-0 px-1 text-end addTotAmt1" name= "addTotAmt1"  value="0">'+
	'</td>'+
	'</tr>';

	$('#addList').append(list);

});



$('#addDedBtn').click(function(){
	var count = $('#dedList >tr').length;
	count++;
	var list =
	'<tr>'+
	'<td class="d-none"><input type="hidden" class="dedStatus" name="dedStatus" value="I"></td>'+
		'<td width="5"> '+ count +'</td>'+
		'<td width="">'+
	/* 		'<select class="form-select form-select-sm" name="dedCd"  aria-label=".form-select-sm example">'+
				'<option value="">선택</option>'+
		 		'<c:forEach var="ded" items="${deds}" varStatus="status">'+
			        '<option value="${ded.code}">${ded.codeName}</option>'+
			    '</c:forEach>'+
			'</select>'+ */
			"<div class='dropdown'>"+
				"<div class='dropdown-input justify-content-center'>"+
					"<input type='text' id='dedCdInput' class='drop3btn form-control text-center' placeholder='선택'"+
						"onkeyup='filterFunction(this)' style='' inputmode='none'>"+
					 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
				"</div>"+
				"<div  class='dropdown-content rounded'>"+
					"<input type='hidden' name='dedCd' value=''>"+
					"<c:forEach var='ded' items='${deds}' varStatus='status'>"+
						"<a class='dedCdBox'>"+
							"<span class='d-none dedCd'>${ded.code}</span>"+
							"<span class='select-value'>${ded.codeName}</span>"+
						"</a>"+
					"</c:forEach>"+
				"</div>"+
			"</div>"+
		'</td>'+
		'<td width="10">'+
		'<input type="text" class="form-control p-0 px-1 text-center" name= "dedPoQty" value="1">'+
		'</td>'+
		'<td width="30">'+
		'<input type="text" class="form-control p-0 px-1 text-end  dedTotAmt1" name="dedTotAmt1" value="0">'+
	'</td>'+
	'</tr>';

	$('#dedList').append(list);

});

/* ***************************************************************  */
/* 리스트 다중 선택  */
$('#addDebRegContent').on('click', '#addList tr', function(){

	 if($(this).hasClass('backcolor')){
			$(this).removeClass("backcolor");

		}else if($(this).hasClass('statusD')){
			$(this).removeClass("statusD");
			$(this).find('.addStatus').val("U");

		}else{
			$(this).addClass("backcolor");
		}
});


$('#delAddBtn').click(function(){
	$('#addList tr').each(function (index, item) {
		if($(this).hasClass('backcolor')){
			if($(this).find('.addStatus').val() == 'I'){
				$(this).remove();
			}
			$(this).removeClass("backcolor");
			$(this).addClass("statusD");
			$(this).find('.addStatus').val("D");

		}
	});
});

/* 리스트 다중 선택  */
$('#addDebRegContent').on('click', '#dedList tr', function(){

	 if($(this).hasClass('backcolor')){
			$(this).removeClass("backcolor");

		}else if($(this).hasClass('statusD')){
			$(this).removeClass("statusD");
			$(this).find('.dedStatus').val("U");

		}else{
			$(this).addClass("backcolor");
		}
});


/* delDedBtn 클릭시 STATUS D로 변경  */
$('#delDedBtn').click(function(){
	$('#dedList tr').each(function (index, item) {
		if($(this).hasClass('backcolor')){
			if($(this).find('.dedStatus').val() == 'I'){
				$(this).remove();
			}
			$(this).removeClass("backcolor");
			$(this).addClass("statusD");
			$(this).find('.dedStatus').val("D");

		}
	});
});
/* ***************************************************************  */


$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = 'ad';
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
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
       });

});

$('.nextBtn').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = './customSignSearchContent';
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
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
       });

});


var saveAd = function (){

	$.ajax({
        type : "post",
        url : "ad",
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
};


var refreshPage = function (){

	var url = 'ad/1';
    $.ajax({
        type        :    "post",
        url : url,
        dataType    :    'html',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);
        }
    	, beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
   });
};

var sumAddPrice = function (){
	var sumAdd = 0;
	$('.addTotAmt1').each(function (index, item) {
		sumAdd += Number($(this).val().replace(/,/g, ''));
	});


	$('#addInput').val(sumAdd.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

}

var sumDedPrice = function (){
	var sumDed = 0;
	$('.dedTotAmt1').each(function (index, item) {
		sumDed += Number($(this).val().replace(/,/g, ''));
	});

	$('#dedInput').val(sumDed.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}



</script>
