<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/nextpage.css" rel="stylesheet">
<link href="./css/component/tableRow.css" rel="stylesheet">

<script src="./js/selectSearch.js"></script>

<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>



<link href="./css/ex/ex002.css" rel="stylesheet">


<div id="exRegContent">
	<div class="item"> <!--1  -->
	<%-- 	<jsp:include page="header.jsp" flush="false" /> --%>
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

				<!-- 	<div  class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div> -->
				</div>
			</div>


			<div class="item">
		<!-- 		<button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>
			   	<button class="btn btn-secondary shadow-sm pt-1">
					<i class="far fa-save"></i>
					<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
			   	</button> -->


			</div>

		</div>

	</div>

	<div class="item" ><!--3  -->
		<table class="table table-row" id="mtable"  style="font-size: calc(0.26vw + 10.08pt);display:none;">
 		  	<tbody  >
		    <tr>
		      <td class="title">주문번호</td>
		      <td class="value">${so.soNo}</td>
		    </tr>
		    <tr>
		      <td class="title">주문일시</td>
		      <td class="value">${so.orderDt}</td>
		    </tr>
		     <tr>
		      <td class="title">고객사</td>
		      <td class="value">${so.bpNm}</td>
		    </tr>
		     <tr>
		      <td class="title">장례식장</td>
		      <td class="value">${so.dlvyNm}</td>
		    </tr>
		     <tr>
		      <td class="title">대상자</td>
		      <td  class="value">${so.ownNm}</td>
		    </tr>
		     <tr>
		      <td class="title">경조사유</td>
		      <td  class="value">${so.hsNm}</td>
		    </tr>
		     <tr>
		      <td  class="title">사전상담<br>번호</td>
		      <td class="value">${so.addCd1}</td>
		    </tr>

		  </tbody>
		</table>

 		<table class="table table-row"  id="tTable" style="font-size: calc(0.26vw + 10.08pt);width:100%;">
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
				<tr>
		     		<td  class="title">사전상담<br>번호</td>
		      		<td class="value">${so.addCd1}</td>
		      		<td class="title"></td>
					<td class="value"></td>
		    	</tr>
			</tbody>

		</table>
	</div>



	<div class="item"><!--4  -->
			<div class="buttonGroup1">
		<!-- 		<button class="btn btn-secondary shadow-sm pt-1">
					<div style="font-size: calc(0.26vw + 7.6pt);">전체선택</div>
   				</button> -->

			<!-- 	<button class="btn btn-secondary shadow-sm" style="padding: 0 0.3rem; background-color:black">
				<div>
					<i class="bi bi-upc"   style="font-size: calc(0.26vw + 15.6pt);"></i>
				</div>
		  		</button> -->

				<div id="qr" style="background-color:black;width:45px;height:30px;text-align:center;border-radius: 4px;padding-top:2px; margin:5px 0;">
			  		<i class="fas fa-barcode"  style="color:white;font-weight:bold;font-size: calc(0.26vw + 18.6pt);"></i>

				</div>

			</div>

			<div class="mobile-result">
				<div class="tablebox" style="overflow-x:auto;">
					<table class="table" style=" white-space: nowrap; width:100%;">
						<thead>
							<tr id="header">
								<!-- <td><input id="allCheck" name="checkbox" class="checkbox form-check-input me-1" type="checkbox"></td> -->
								<td></td>
								<td>품목명</td>
								<td>수량</td>
								<td>QR코드</td>
								<td>출고일자</td>
							</tr>
						</thead>
						<tbody id="exList">
							<c:forEach var="expo" items="${expos}" varStatus="status">

							<tr>
								<td class="d-none cnt">${status.count}</td>
								<%-- <td><input name="expo" value="${expo}" class="checkbox form-check-input me-1" type="checkbox"></td> --%>
								<td class="">
									<div>
										<button type="button" class="btn btn-primary btn-sm shadow-sm pt-1 exEnBtn">
											<div>출고</div>
						   				</button>
					   				</div>

								</td>
								<td class="text-start">
									${expo.itemNm}
									<%-- <c:choose>
									    <c:when test="${expo.dnNo ne 'null'}"></c:when>
									    <c:otherwise><span class="badge badge bg-danger">출고</span></c:otherwise>
									</c:choose> --%>
								</td>
								<td>${expo.soQty}</td>
								<td>
								<c:choose>
									    <c:when test="${expo.itemClass == 'B'}">
											<input type="text" value="${expo.fmBarcode}"  class="form-control p-1 fmBarcode" style="font-size: calc(0.26vw + 9.08pt); width:140px;">
									    </c:when>
									    <c:otherwise></c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
									    <c:when test="${expo.fdDt == 'null'}">-</c:when>
									    <c:otherwise>${expo.fdDt}</c:otherwise>
									</c:choose>
								</td>
								<td class="d-none itemClass">${expo.itemClass}</td>
								<td class="d-none plantCd">${expo.plantCd}</td>
								<td class="d-none movType">${expo.movType}</td>
								<td class="d-none soSeq">${expo.soSeq}</td>
								<td class="d-none itemCd">${expo.itemCd}</td>
								<td class="d-none giQty">${expo.giQty}</td>
								<td class="d-none slCd">${expo.slCd}</td>
								<td class="d-none dnSeq">${expo.dnSeq}</td>
								<td class="d-none saItemFlag">${expo.saItemFlag}</td>
								<td class="d-none soType">${expo.soType}</td>
								<td class="d-none dnNo">${expo.dnNo}</td>
								<td class="d-none poStatus">${expo.poStatus}</td>
							</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

<!-- 			<div class="buttonGroup2">
				<div>
			 		<button type="button" id="exCnBtn" class="btn btn-secondary shadow-sm pt-1 me-3">
						<div>출고취소</div>
	   				</button>

				</div>

				<div>
				<button type="button" id="exEnBtn" class="btn btn-primary shadow-sm pt-1">
					<div>출고등록</div>
   				</button>

				</div>

			</div> -->


	</div>

	<!-- <div class="item">5
		<div id="nextPage">
			<button class="btn btn-primary">
				상품페이지로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div> -->
</div>
<input type="hidden" name="soNo" class="soNo" value="${so.soNo}">
<input type="hidden" name="no" class="no" value="1">
<div id="checkVal">


</div>




<script>
	$('#menu-nav').html("출고처리/등록");

	$('#allCheck').click(function(){
		var checked = $(this).is(":checked");

		if(checked){
			$(this).parents("table").find('input').prop("checked", true);
		} else {
			$(this).parents("table").find('input').prop("checked", false);
		}
	});


	 $('.checkbox').change(function() {
		if(bacodeCheck() == 0){
			 $("input:checkbox[name='expo']").prop("checked", false);
			return;
		}

   	 });


	$('.exEnBtn').click(function(event){

		/* 리스트별 버튼 로 사용시  */
		var flag = true;


		if($(this).closest('tr').find(".soSeq").html() =='1'){
			if($(this).closest('tr').find(".fmBarcode").val() == ''){
				alert("QR코드를 입력해주세요");
				$(this).closest('tr').find(".fmBarcode").focus();
				flag= false;
			}
		 }

		if(flag){
 			 if($(this).closest('tr').find(".itemClass").html() == ''){
					$('#checkVal').append("<input type='hidden' name='itemClass' value='null'>");
				}else{
					$('#checkVal').append("<input type='hidden' name='itemClass' value='"+$(this).closest('tr').find(".itemClass").html()+"'>");
				}
				/*
				if($(this).closest('tr').find(".fmBarcode").val() == ''){
					$('#checkVal').append("<input type='hidden' name='fmBarcode' value='null'>");
				}else{
					$('#checkVal').append("<input type='hidden' name='fmBarcode' value='"+$(this).closest('tr').find(".fmBarcode").val()+"'>");
				}

				if($(this).closest('tr').find(".dnSeq").html() == ''){
					$('#checkVal').append("<input type='hidden' name='dnSeq' value='null'>");
				}else{
					$('#checkVal').append("<input type='hidden' name='dnSeq' value='"+$(this).closest('tr').find(".dnSeq").html()+"'>");
				} */

				$('#checkVal').append("<input type='hidden' name='plantCd'  	value='"+$(this).closest('tr').find(".plantCd").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='movType'  	value='"+$(this).closest('tr').find(".movType").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='soSeq'  		value='"+$(this).closest('tr').find(".soSeq").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='itemCd'  		value='"+$(this).closest('tr').find(".itemCd").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='giQty'  		value='"+$(this).closest('tr').find(".giQty").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='slCd'  		value='"+$(this).closest('tr').find(".slCd").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='fmBarcode'  	value='"+$(this).closest('tr').find(".fmBarcode").val()+"'>");
				$('#checkVal').append("<input type='hidden' name='dnSeq'  		value='"+$(this).closest('tr').find(".dnSeq").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='saItemFlag'  	value='"+$(this).closest('tr').find(".saItemFlag").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='soType'  		value='"+$(this).closest('tr').find(".soType").html()+"'>");

				$('#checkVal').append("<input type='hidden' name='checkCount'>");
			 	$('input[name="checkCount"]').val(1);


				 if(flag){
					var result = confirm("출고처리를 진행하시겠습니까?");
					if(result){
						$.ajax({
							type : "post",
							url : "ex",
							dataType : 'json',
						 	data: $("#form").serialize(), //보낼데이터
							success : function(data) {
								if(data.msgCd == '1'){
									alertBox("츨고처리가 완료 되었습니다","primary");
								}
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
				}else{
					alertBox("이미 출고처리된 품목이 존재합니다","danger");
				}
			}

		 	$('#checkVal').empty();

		/* 버튼 한개로 사용시  */
	/* 	if($(".checkbox").is(":checked")){

			var flag = true;

			if( bacodeCheck() == 0){
			    flag = false;
			}

			var count = 0;
			$('#checkVal').append("<input type='hidden' name='checkCount'>");
			$("input[name=expo]:checked").each(function() {

				//if($(this).parent().siblings(".dnNo").html() != "null"){
				if($(this).parent().siblings(".poStatus").html() != "3"){

					flag =  false;
				}
				count++;

				if($(this).parent().siblings(".itemClass").html() == ''){
					$('#checkVal').append("<input type='hidden' name='itemClass' value='null'>");
				}else{
					$('#checkVal').append("<input type='hidden' name='itemClass' value='"+$(this).parent().siblings(".itemClass").html()+"'>");
				}

				if($(this).parent().parent().find(".fmBarcode").val() == ''){
					$('#checkVal').append("<input type='hidden' name='fmBarcode' value='null'>");
				}else{
					$('#checkVal').append("<input type='hidden' name='fmBarcode' value='"+$(this).parent().parent().find(".fmBarcode").val()+"'>");
				}

				if($(this).parent().siblings(".dnSeq").html() == ''){
					$('#checkVal').append("<input type='hidden' name='dnSeq' value='null'>");
				}else{
					$('#checkVal').append("<input type='hidden' name='dnSeq' value='"+$(this).parent().siblings(".dnSeq").html()+"'>");
				}

				$('#checkVal').append("<input type='hidden' name='plantCd'  	value='"+$(this).parent().siblings(".plantCd").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='movType'  	value='"+$(this).parent().siblings(".movType").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='soSeq'  		value='"+$(this).parent().siblings(".soSeq").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='itemCd'  		value='"+$(this).parent().siblings(".itemCd").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='giQty'  		value='"+$(this).parent().siblings(".giQty").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='slCd'  		value='"+$(this).parent().siblings(".slCd").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='fmBarcode'  	value='"+$(this).parent().parent().find(".fmBarcode").val()+"'>");
				$('#checkVal').append("<input type='hidden' name='dnSeq'  		value='"+$(this).parent().siblings(".dnSeq").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='saItemFlag'  	value='"+$(this).parent().siblings(".saItemFlag").html()+"'>");
				$('#checkVal').append("<input type='hidden' name='soType'  		value='"+$(this).parent().siblings(".soType").html()+"'>");

				$('input[name="checkCount"]').val(count);
			});

			if(flag){
				var result = confirm("출고처리를 진행하시겠습니까?");
				if(result){
					$.ajax({
						type : "post",
						url : "ex",
						dataType : 'json',
					 	data: $("#form").serialize(), //보낼데이터
						success : function(data) {
							if(data.msgCd == '1'){
								alertBox("츨고처리가 완료 되었습니다","primary");
							}
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
			}else{
				alertBox("이미 출고처리된 품목이 존재합니다","danger");
			}
			$('#checkVal').empty();

		}else{
			alertBox("출고 될 상품을 선택해주세요","danger");
		}
 */
	});


	$('#prevPage').click(function() {
		/* alert($(this).children('td:first').html()); */

		var url = './ex';
		$.ajax({
			type : "get",
			url : url,
			dataType : 'html',
			success : function(data) {
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

	$('#nextPage').click(function() {
		/* alert($(this).children('td:first').html()); */

		var url = './mobile/productSearchContent';
		$.ajax({
			type : "get",
			url : url,
			dataType : 'html',
			success : function(data) {
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



	var bacodeCheck = function (){
		var flag = 1;
		$("input[name=expo]:checked").each(function() {
			if($(this).parent().siblings(".soSeq").html() =='1'){
				if($(this).parent().parent().find(".fmBarcode").val() == ''){
					alert("QR코드를 입력해주세요");
					$(this).parent().parent().find(".fmBarcode").focus();
					flag= 0;
				}
			}

		});
		return flag;
	};

	var refreshPage = function (){

		var url = './ex/1';
	    $.ajax({
	        type        :    "post",
	        url : url,
	        dataType    :    'html',
	        data: $("#form").serialize(), //보낼데이터
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
	};


	$('#qr').click(function() {
		var index = $('.no').val();
		if (window.ReactNativeWebView) {
 			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			window.ReactNativeWebView.postMessage(JSON.stringify({
				gubun : "qr",
				index : index,
				type : "REQ_CAMERA_PERMISSION"
			}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}

	});

	document.addEventListener("message", function(data) {
		var str=data.data.split('/');
		var barcode= str[0];
		var index= Number(str[1])-1;
		$('.fmBarcode').eq(index).val(barcode);

	})


	$('#exRegContent').on('click', '#exList tr', function(){
		$('.no').val($(this).find('.cnt').text());
	 	$('#exList tr').removeClass("backcolor");
		$(this).addClass("backcolor");


	});



/* 	$(window).on("message", function(e) {
		alert(data.result);
	 	$('.fmBarcode').val(data.barcode);
	}) */


</script>


