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

<link href="./css/ps/ps002.css" rel="stylesheet">


<div id="productSelectRegContent" >

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
						<i class="bi bi-chevron-down down-icon"></i>
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

	<div class="item"><!--4  -->
		<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
				<tr>
		      		<td class="title">상품결과</td>
		      		<td class="value">
					<div class="dropdown">
						<div class="dropdown-input justify-content-start">
							<input type="text" id="product" class="drop3btn form-control w-75" placeholder="선택" inputmode="none"
								<c:choose>
					         		<c:when test = "${so.adType eq '1'}">
					            		value="고객사지원내역"
					         		</c:when>
					         		<c:when test = "${so.adType eq '2'}">
					            		value="상품지원내역"
					         		</c:when>
				      			</c:choose>
							>
						 	<i class="bi bi-chevron-down down-icon"></i>
						</div>
						<div  class="dropdown-content w-75 rounded " >
								<a class="adTypeBox">
									<span class="d-none adType">1</span>
									<span class="select-value">고객사지원내역</span>
								</a>
								<a class="adTypeBox">
									<span class="d-none adType">2</span>
									<span class="select-value">상품지원내역</span>
								</a>
						</div>
					</div>
		      </td>
	          <td class="title">선택지원</td>
		      <td class="value">
					<div class="dropdown">
						<div class="dropdown-input justify-content-start">
							<input type="text"   id="adChItem"  class="drop3btn form-control w-75" placeholder="선택" inputmode="none"
								<c:if test="${so.adType eq '' || so.adType eq '2'}">disabled</c:if>
			      				<c:forEach var="alterSupport" items="${alterSupports}" varStatus="status">
			      					<c:if test="${alterSupport.seqNo eq so.adChItem }">value="${alterSupport.colDesc}</c:if>
							 	</c:forEach>
							>
						 	<i class="bi bi-chevron-down down-icon"></i>
						</div>
						<div  class="dropdown-content w-75 rounded" >
							<c:forEach var="alterSupport" items="${alterSupports}" varStatus="status">
									<a class="adChItemBox">
										<span class="d-none adChItem">${alterSupport.seqNo}</span>
										<span class="select-value">${alterSupport.colDesc}</span>
									</a>
							 </c:forEach>
						</div>
					</div>
		      </td>
		    </tr>
		    <tr>
		    	<td class="title">패키지명</td>
		      	<td class="value">
					<div class="dropdown">
						<div class="dropdown-input justify-content-start">
							<input type="text" id="adPackItem" class="drop3btn form-control w-75" placeholder="선택" inputmode="none"
							 <c:if test="${so.adType eq '' || so.adType eq '1'}">disabled</c:if>
			      			<c:forEach var="item" items="${items}" varStatus="status">
			      					<c:choose>
					         		<c:when test = "${item.itemCd eq so.adPackItem}">
					            		value="${item.itemNm}"
					         		</c:when>
					      			<c:otherwise>
					         		</c:otherwise>
				      			</c:choose>
							 </c:forEach>
							>
						 	<i class="bi bi-chevron-down down-icon"></i>
						</div>
						<div  class="dropdown-content w-75 rounded scroll" >
							<c:forEach var="item" items="${items}" varStatus="status">
									<a class="adPackItemBox" >
										<span class="d-none adPackItem">${item.itemCd}</span>
										<span class="select-value">${item.itemNm}</span>
									</a>
							 </c:forEach>
						</div>
					</div>
		      	</td>
		      	<td class="title">지원내역</td>
		      	<td class="value">
					<input type="text" class="form-control py-0 w-75 bMinors" id="bMinors" name="bMinors" placeholder="선택" value="${adSupCds.item_acct}" inputmode="none">
					<ul class="list-group d-none bMinorXs018" id="bMinorXs018" style=" position: absolute;z-index:2;width:351px">
					<c:forEach var="bMinor" items="${bMinors}" varStatus="status">
					 	<c:choose>
			         		<c:when test = "${fn:contains(adSupCds.item_acct, bMinor.minerName)}">
			            		<li class="list-group-item py-1 w-75 bMinorName border active">${bMinor.minerName}</li>
			         		</c:when>
			         		<c:otherwise>
		            		 	<li class="list-group-item py-1 w-75 bMinorName bg-light border">${bMinor.minerName}</li>
			         		</c:otherwise>
			      		</c:choose>

					</c:forEach>
					</ul>
		      	</td>
		    </tr>
		  </tbody>
		</table>
	</div>


	<div class="item"><!--5  -->
		<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
		  <tbody>
		    <tr>
		      <td class="title">상품금액</td>
		      <td class="value text-end listPrice" style="padding-right:280px"></td>
	          <td class="title">고객부담금</td>
		      <td class="value text-end total" style="padding-right:280px"></td>
		    </tr>
		     <tr>
		      <td class="title">행사차감액</td>
		      <td class="value text-end discountAmt" style="padding-right:280px"></td>
		       <td class="title"></td>
		       <td class="value text-end" style="padding-right:280px"></td>
		    </tr>

		  </tbody>
		</table>
	</div>

	<div class="item"><!--6  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs ps-3">
				<li class="nav-item"><a class="nav-link active">고객사지원내역</a></li>
				<li class="nav-item"><a class="nav-link">상품지원내역</a></li>
				<li class="nav-item"><a class="nav-link">고객확인</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="table-content">
						<div class="mobile-result">
							<div class="title">
								기본지원
							</div>
							<div class="tablebox">
								<table class="table">
									<thead>
										<tr id="header">
											<td></td>
											<td style="width:120px;">지원품목</td>
											<td>지원내용</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="comSupport" items="${comSupports}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${comSupport.minorNm}</td>
											<td class="text-start">${comSupport.colDesc}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<div class="mobile-result">
							<div class="title">
								선택지원
							</div>
							<div class="tablebox">
								<table class="table">
									<thead>
										<tr id="header">
											<td></td>
											<td>지원품목</td>
											<td>지원내용</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="alterSupport" items="${alterSupports}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${alterSupport.minorNm}</td>
											<td class="text-start">${alterSupport.colDesc}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
					<div class="table-content mt-2">
						<div class="mobile-result">
							<div class="tablebox">
								<table class="table" >
									<thead>
										<tr>
											<td colspan="3">
												<div class="dropdown">
													<div class="dropdown-input justify-content-start">
														<input type="text" id="item1" class="drop3btn form-control" placeholder="선택" inputmode="none"
														>
													 	<i class="bi bi-chevron-down down-icon"></i>
													</div>
													<div  class="dropdown-content rounded scroll" >
														<c:forEach var="item" items="${items}" varStatus="status">
																<a class="item1Box" >
																	<span class="d-none item1">${item.itemCd}</span>
																	<span class="select-value">${item.itemNm}</span>
																</a>
														 </c:forEach>
													</div>
												</div>
											</td>
										<tr id="header">
											<td></td>
											<td>지원품목</td>
											<td>지원내용</td>
										</tr>
									</thead>
									<tbody id="item1List">
										<tr>
											<td colspan="3">상품을 선택해주세요</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<div class="mobile-result">
							<div class="tablebox">
								<table class="table">
									<thead>
										<tr>
											<td colspan="3">
												<div class="dropdown">
													<div class="dropdown-input justify-content-start">
														<input type="text" id="item2" class="drop3btn form-control" placeholder="선택" inputmode="none"
														>
													 	<i class="bi bi-chevron-down down-icon"></i>
													</div>
													<div  class="dropdown-content rounded scroll" >
														<c:forEach var="item" items="${items}" varStatus="status">
																<a class="item2Box" >
																	<span class="d-none item2">${item.itemCd}</span>
																	<span class="select-value">${item.itemNm}</span>
																</a>
														 </c:forEach>
													</div>
												</div>
											</td>
										</tr>

										<tr id="header">
											<td></td>
											<td>지원품목</td>
											<td>지원내용</td>
										</tr>
									</thead>
									<tbody id="item2List">
										<tr>
											<td colspan="3">상품을 선택해주세요</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="content" id="tab3">
					<div class="ms-4 mt-2">
						<div class="form-check">
					  		<input class="form-check-input" name="adType" type="checkbox" value="1" id="adType1" <c:if test="${so.adType eq '1'}">checked</c:if>>
						  	<label class="form-check-label" for="adType1">
						    	 회사 지원품목만 선택하겠습니다.<br><br>
						  	</label>
						</div>
						<div class="form-check">
						 	<input class="form-check-input"  name="adType" type="checkbox" value="2" id="adType2" <c:if test="${so.adType eq '2'}">checked</c:if>>
						 	<label class="form-check-label" for="adType2">
						    	상담한 장례 패키지 상품 진행에 동의합니다.(고객 부담금 확인)<br><br>
						  	</label>
						</div>
						<div class="custom-control custom-checkbox">
						 	<input class="form-check-input" name="infoAgreeYn" type="checkbox" value="Y" id="infoAgreeYn" <c:if test="${so.infoAgreeYn eq 'Y'}">checked</c:if>>
						 	<label class="form-check-label" for="flexCheckChecked">
						    	개인정보 수집 및 활용 동의문<br>
						    	현진시닝은 기일안내, 문자일림서비스(만족도조사, 그레이프 치유센터)<br>
						    	제공을 위하여 아래와 같이 개인정보를 수집, 이용하고자 합니다.<br>
						    	<br>
						    	● 개인정보 수집 및 이용내역(패키지진행시 필수사항)<br>
						    	- 항목:성명, 연락처, 이메일, 기일..등<br>
						    	- 수집목적 : 부고, 답례, 기일안내 및 상품정보 등 장례관련 안내<br>
						    	- 보유기간 : 2년<br><br>
						    	※ 위의 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있습니다.<br>
						    	그러나 동의를 거부할 경우 원할한 서비스 제공에 일부 제한을 받을 수 있습니다.<br>
						    	<br><br><br><br>
						  	</label>
						</div>
					</div>

					<div class="d-flex justify-content-center" >
						<div id="nextPage" style="position: absolute;bottom: 15px;">
							<button type="button" class="btn btn-primary nextBtn">
								상담결과등록으로 이동 <i class="bi bi-chevron-right"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<div id="hidden">
	<input type="hidden" name="soNo" value="${so.soNo}">
	<input type="hidden" name="soldToParty" value="${so.soldToParty}">
	<input type="hidden" name="hsType" value="${so.hsType}">
	<input type="hidden" name="adPackItem" value="${so.adPackItem}">
	<input type="hidden" name="adChItem" value="${so.adChItem}">

	<!-- 공통금액을 가져오기위한 값  -->
	<input type="hidden" name="itemCd" value="">
</div>


<script>
$('#menu-nav').html("상품선택/등록")

$(".item1Box").on("click", function() {
	 $('input[name="itemCd"]').val($(this).find('.item1').html());
	 getSelSupports("item1");

});

$(".item2Box").on( "click", function() {
	 $('input[name="itemCd"]').val($(this).find('.item2').html());
 	getSelSupports("item2");

});

/* 상품결과 클릭시  */
$(".adTypeBox").on( "click", function() {
	 $("#adPackItem").attr("disabled","disabled");
	 $("#adChItem").attr("disabled","disabled");
	 $("#adPackItem").val('');
	 $("#adChItem").val('');

	/* 회사지원 */
	if($(this).find('.adType').html() == '1'){
		 $("#adChItem").removeAttr("disabled");
		 $("#adType2").prop("checked", false);
		 $("#adType1").prop("checked", true);

		$('input[name="adPackItem"]').val('');
		$('input[name="itemCd"]').val('');

		getAmts();

	/* 패키지  */
	}else if($(this).find('.adType').html() == '2'){
		$("#adPackItem").removeAttr("disabled");
		$("#adType1").prop("checked", false);
		$("#adType2").prop("checked", true);
		$('input[name="adChItem"]').val('');

	}else{

	}
});

/* 선택지원 리스트 클릭시  */
$(".adChItemBox").on( "click", function() {
 	$('input[name="adChItem"]').val($(this).find('.adChItem').html());
	getAmts();
});

/* 패키지 리스트 클릭시 */
$(".adPackItemBox").on( "click", function() {
	adPackItemAmt($(this).find('.adPackItem').html());
});


/* 지원내역 창 클릭시  visible  */
$("#bMinors").on("click", function() {
	if($("#bMinorXs018").hasClass("d-none")){
		$("#bMinorXs018").removeClass("d-none").show();
	}else{
		$("#bMinorXs018").addClass("d-none");
	}

});

/* 지원내역 리스트 클릭스 값 세팅 */
$("#bMinorXs018 li").on("click", function() {

	var bMinorsVal = $('#bMinors').val();

	if($(this).hasClass("active")){

		var item = $(this).text();
		bMinorsVal = bMinorsVal.replace(item,'');

		if(bMinorsVal.charAt(0) == ','){
			bMinorsVal = bMinorsVal.replace(',','');
		}

		$(this).removeClass("active");
		$(this).addClass("bg-light");

	}else{

		if(bMinorsVal == ''){
			bMinorsVal = $(this).text();
		}else{
			bMinorsVal = bMinorsVal+","+$(this).text();
		}

		$(this).addClass("active");
		$(this).removeClass("bg-light");
	}

	bMinorsVal = bMinorsVal.replace(',,',',');
	$('#bMinors').val(bMinorsVal);

});

/* 외부클릭시 창없애지게 */
$('#productSelectRegContent').on("click", function(e) {
	if(!$("#bMinorXs018").hasClass("d-none")){
		if(	!$(e.target).hasClass("bMinors") && !$(e.target).hasClass("bMinorName")
		){
			$("#bMinorXs018").addClass("d-none");
		}

	}

});

$('#saveBtn').click(function(){
	if(!$('#infoAgreeYn').is(':checked')){
		alertBox("개인정보 수집 및 활용 동의문을 선택해주세요","danger");
		tabChange(3);

	}else{
		saveProduct();
	}

});

$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = 'ps';
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

$('.nextBtn').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = 'cr/1';
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

        },
        complete:function(){
        }
       });

});

var getSelSupports = function (item){

	var itemId = "#"+item+"List";
	$.ajax({
        type : "post",
        url : "./api/ps/selSupports",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
         	$(itemId).empty();
           	var list;
           	if(data.length > 0 ){

				$(data).each(function(i, e) {
					list += "<tr>"+
					"<td style='width:10px;'>"+ (++i) +"</td>"+
					"<td style='width:140px;'>"+e.minorNm+"</td>"+
					"<td class='text-start'>"+e.colDesc+"</td>"+
					"</tr>";
			 	});

			}else{

				list = '<td colspan="5">등록된 데이터가 없습니다</td>';
			}
           	$(itemId).html(list);
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
	});


};


var getAmts = function (){

	$.ajax({
        type : "post",
        url : "./api/amt",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){


			$('.listPrice').html(numberWithCommas(data.listPrice));
			$('.discountAmt').html(numberWithCommas(data.discountAmt));
			$('.total').html(numberWithCommas(data.listPrice-data.discountAmt));

        }
        , beforeSend: function() {

        },
        complete:function(){
        }
	});
};


var saveProduct = function (){

	$.ajax({
        type : "post",
        url : "ps",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
            if(data.msgCd == '1'){
				alertBox("저장이 완료 되었습니다.","primary");
	            refreshPage();
             }
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

	var url = 'ps/1';
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


var adPackItemAmt = function(itemCode){
	$('input[name="adPackItem"]').val(itemCode);
	$('input[name="itemCd"]').val(itemCode);
	getAmts();
}

/* 화면시작시 세팅값  */
$(document).ready(function(){
	var itemCode = '${so.adPackItem}';

	if(itemCode){
		adPackItemAmt(itemCode);
	}else{
		$('input[name="itemCd"]').val('');
		getAmts();
	}

});


</script>
