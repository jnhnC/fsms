<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">


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

<link href="./css/fd/fd002.css" rel="stylesheet">


<div id="fdRegContent" >

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
							onclick="" >
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
				<!-- <button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button> -->
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
		      <td class="title">상품금액</td>
		      <td class="value listPrice" ><fmt:formatNumber value="${amt.listPrice}" pattern="#,###" /></td>
	          <td class="title">고객부담금</td>
		      <td class="value total"><fmt:formatNumber value="${amt.listPrice - amt.discountAmt}" pattern="#,###" /></td>
		    </tr>
		     <tr>
		      <td class="title">행사차감액</td>
		      <td class="value discountAmt"><fmt:formatNumber value="${amt.discountAmt}" pattern="#,###" /></td>
		       <td class="title"></td>
		      <td class="value"></td>
		    </tr>


		  </tbody>
		</table>
	</div>

	<div class="item"><!--5  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs ps-3">
				<li class="nav-item"><a class="nav-link active">근무현황등록</a></li>
				<li class="nav-item"><a class="nav-link">사진등록</a></li>
				<li class="nav-item"><a class="nav-link">기타 정보입력</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
				${ws.actDtInHour}
					<div class="text-end">
						<span id="addRowBtn"><i class="h2 bi bi-plus-square text-primary mx-1"></i></span>
						<span id="delRowBtn"><i class="h2 bi bi-dash-square text-danger mx-1"></i></span>
					</div>
					<div class="mobile-result">
						<div class="tablebox">
							<table class="table">
								<thead>
									<tr id="header">
										<td class="d-none"></td>
										<td class="d-none"></td>
										<td></td>
										<td>시작일</td>
										<td>출근(시)</td>
										<td>출근(분)</td>
										<td>퇴근(시)</td>
										<td>퇴근(분)</td>
										<td>근무내용</td>
									</tr>
								</thead>
								<tbody id="workList">
									<c:forEach var="ws" items="${wss}" varStatus="status">
										<tr>
											<td class="d-none"><input type='hidden' class='status' name='status' value='U'> </td>
											<td class="d-none"><input type='hidden' class='actSeq' name='actSeq' value='${ws.actSeq}'> </td>
											<td>${status.count }</td>
											<td style='width:180px;'>
												<div class='datebox'>
													<div class='datePickerbox d-flex'>
														<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'
														name='actDt'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' value="${ws.actDt}">
													</div>
												</div>
											</td>
											<td>
												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtInHour" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtInHour}"
															>
														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded"  >
														<input type="hidden" name="actDtInHour" value="${ws.actDtInHour}">
														<c:forEach var="i"  begin="0" end="23">
											 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
															<a class="actDtInHourBox">
																<span class="d-none actDtInHour">${hh}</span>
																<span class="select-value">${hh}</span>
															</a>
														  </c:forEach>
													</div>
												</div>
											</td>
											<td>
												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtInMinute" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtInMinute }"
															>
														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded"  >
														<input type="hidden" name="actDtInMinute" value="${ws.actDtInMinute}">
														<c:forEach var="i"  begin="0" end="60" step="10">
												 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
															<a class="actDtInMinuteBox">
																<span class="d-none actDtInMinute">${mm}</span>
																<span class="select-value">${mm}</span>
															</a>
														</c:forEach>
													</div>
												</div>
											</td>
											<td>
												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtOutHour" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtOutHour}"
															>
														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded"  >
														<input type="hidden" name="actDtOutHour" value="${ws.actDtOutHour}">
														<c:forEach var="i"  begin="0" end="23">
											 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
															<a class="actDtOutHourBox">
																<span class="d-none actDtOutHour">${hh}</span>
																<span class="select-value">${hh}</span>
															</a>
														  </c:forEach>
													</div>
												</div>

											</td>
											<td>
												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtOutMinute" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtOutMinute }"
															>

														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded"  >
														<input type="hidden" name="actDtOutMinute" value="${ws.actDtOutMinute}">
														<c:forEach var="i"  begin="0" end="60" step="10">
												 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
															<a class="actDtOutMinuteBox">
																<span class="d-none actDtOutMinute">${mm}</span>
																<span class="select-value">${mm}</span>
															</a>
														</c:forEach>
													</div>
												</div>
											</td>
											<td>
												<input type="text" class="form-control p-0 px-1 actRemark"  name="actRemark" value="${ws.actRemark}">
											</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
					<div class="table-content d-flex justify-content-around">
						<div class="mobile-result m-2" style="width:45%">

							<div class="title d-flex">
								<div class="px-2 flex-grow-1 bd-highlight">사진등록</div>
								<div class="text-end">
									<span id="addPicBtn"><i class="h2 bi bi-plus-square text-primary mx-1"></i></span>
								</div>
							</div>

							<div class="tablebox">
								<table class="table">
									<thead>
										<tr id="header">
											<td class="d-none"></td>
											<td></td>
											<td width=250>품목</td>
											<td width=190></td>
										</tr>
									</thead>
									<tbody id="addPicList">

											<c:forEach var="img" items="${imgs}" varStatus="status" >
									            <tr>
												<td class="d-none"><input type="hidden" class="status" name="status" value="U"></td>
												<td width="5">${status.count}</td>
												<td>
													<select class="form-select form-select-sm xs005"  name="xs005"  aria-label=".form-select-sm example" disabled>
														<option value="">선택</option>
												 		<c:forEach var="xs005" items="${xs005s}" varStatus="status">
													        <option value="${xs005.minorCd}" <c:if test="${xs005.minorCd eq img.type}">selected</c:if>>${xs005.minorNm}</option>
													    </c:forEach>
													</select>
												</td>
												<td>
													<div class="d-flex justify-content-center">
														<input type="hidden" class="filePath" value="${img.filePath}" >
														<input type="hidden" class="imageId" value="${img.imageId}" >
														<div><button type="button" class="mx-1 btn btn-secondary p-1 picViewBtn" >사진</button></div>
														<div><button type="button" class="mx-1 btn btn-danger p-1 picDelBtn" >삭제</button></div>
													</div>
												</td>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<div class="mobile-result m-2"  style="width:55%">
							<div class="title d-flex">
								<div class="px-2 flex-grow-1 bd-highlight" style="padding-bottom: 12px;">사진등록조회</div>
							</div>
							<div class="text-center">
								<img id="preview" style="height:300px;">

							</div>

						</div>
					</div>
				</div>
				<div class="content" id="tab3">
				</div>
			</div>
		</div>
	</div>

	<div>
	<input type="hidden" name="soNo" value="${so.soNo}">
	<input type="hidden" name="trCount" id="trCount" value="">
	<input type="hidden" name="soldToParty"  value="${so.soldToParty}">
	<input type="hidden" name="adPackItem"  value="${so.adPackItem}">
	<input type="hidden" name="hsType"  value="${so.hsType}">

	<!-- 공통금액을 가져오기위한 값  -->
	<input type="hidden" name="itemCd" value="">


</div>

</div>



<script>

$('#menu-nav').html("FD일지/등록")


$('#fdRegContent').on("click", ".actDtInHourBox", function() {
	$(this).parent().find('input[name="actDtInHour"]').val($(this).find('.actDtInHour').html());
});

$('#fdRegContent').on("click", ".actDtInMinuteBox", function() {
	$(this).parent().find('input[name="actDtInMinute"]').val($(this).find('.actDtInMinute').html());
});

$('#fdRegContent').on("click", ".actDtOutHourBox", function() {
	$(this).parent().find('input[name="actDtOutHour"]').val($(this).find('.actDtOutHour').html());
});

$('#fdRegContent').on("click", ".actDtOutMinuteBox", function() {
	$(this).parent().find('input[name="actDtOutMinute"]').val($(this).find('.actDtOutMinute').html());
});



$('#addRowBtn').click(function(){
	var count = $('#workList >tr').length;


	var list = "<tr>"+
	"<td class='d-none'><input type='hidden' class='status' name='status' value='I'></td>"+
	"<td class='d-none'><input type='hidden' class='actSeq' name='actSeq' value=''></td>"+
	"<td style='width:10px;'>"+ (++count) +"</td>"+
	"<td style='width:180px;'>"+
		"<div class='datebox'>"+
			"<div class='datePickerbox d-flex'>"+
				"<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'"+
				"name='actDt'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' >"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td class=''>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtInHour' class='drop3btn form-control' placeholder='선택'"+
					" style='width:70px;' inputmode='none'>"+
				 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded'>"+
				 "<input type='hidden' name='actDtInHour' value=''>"+
				"<c:forEach var='i'  begin='0' end='23'>"+
					"<c:set var='hh' value='${i>9?i:\'0\'}${i>9?\'\':i}' />"+
					"<a class='actDtInHourBox'>"+
						"<span class='d-none actDtInHour'>${hh}</span>"+
						"<span class='select-value'>${hh}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td class=''>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtInMinute' class='drop3btn form-control' placeholder='선택'"+
					" style='width:70px;' inputmode='none'>"+
				 "<i style='font-size:5pt;' class='ms-1 down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded'>"+
				"<input type='hidden' name='actDtInMinute' value=''>"+
				"<c:forEach var='i'  begin='0' end='60' step='10'>"+
					"<c:set var='mm' value='${i>9?i:\'0\'}${i>9?\'\':i}' />"+
					"<a class='actDtInMinuteBox'>"+
						"<span class='d-none actDtInMinute'>${mm}</span>"+
						"<span class='select-value'>${mm}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td class=''>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtOutHour' class='drop3btn form-control' placeholder='선택'"+
					" style='width:70px;' inputmode='none'>"+
				 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded'>"+
				"<input type='hidden' name='actDtOutHour' value=''>"+
				"<c:forEach var='i'  begin='0' end='23'>"+
					"<c:set var='hh' value='${i>9?i:\'0\'}${i>9?\'\':i}' />"+
					"<a class='actDtOutHourBox'>"+
						"<span class='d-none actDtOutHour'>${hh}</span>"+
						"<span class='select-value'>${hh}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td class=''>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtOutMinute' class='drop3btn form-control' placeholder='선택'"+
					" style='width:70px;' inputmode='none'>"+
				 "<i style='font-size:5pt;' class='ms-1 down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded'>"+
				"<input type='hidden' name='actDtOutMinute' value=''>"+
				"<c:forEach var='i'  begin='0' end='60' step='10'>"+
					"<c:set var='mm' value='${i>9?i:\'0\'}${i>9?\'\':i}' />"+
					"<a class='actDtOutMinuteBox'>"+
						"<span class='d-none actDtOutMinute'>${mm}</span>"+
						"<span class='select-value'>${mm}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td class=''>"+
		"<input class='form-control py-0 px-1' name='actRemark' type='text'>"+
	"</td>"+
	"</tr>";

	$('#workList').append(list);

});


$('#fdRegContent').on("click", ".xs005Box", function() {
	$(this).parent().find('input[name="xs005"]').val($(this).find('.xs005').html());
});



$('#addPicBtn').click(function(){
	var count = $('#addPicList >tr').length;
	count++;

	var list =
 	'<tr>'+
	'	<td class="d-none"><input type="hidden" class="status" name="status" value="I"></td>'+
	'	<td width="5">'+count+'</td>'+
	'	<td>'+
/* 	'		<select class="form-select form-select-sm xs005"  name="xs005"  aria-label=".form-select-sm example">'+
	'			<option value="">선택</option>'+
	'	 		<c:forEach var="xs005" items="${xs005s}" varStatus="status">'+
	'		        <option value="${xs005.minorCd}" <c:if test="${xs005.minorCd eq img.type}">selected</c:if>>${xs005.minorNm}</option>'+
	'		    </c:forEach>'+
	'		</select>'+ */
			"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='xs005' class='drop3btn form-control' placeholder='선택'"+
					" inputmode='none'>"+
				 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded'>"+
				"<input type='hidden' name='xs005' value=''>"+
				"<c:forEach var='xs005' items='${xs005s}' varStatus='status'>"+
					"<a class='xs005Box'>"+
						"<span class='d-none xs005'>${xs005.minorCd}</span>"+
						"<span class='select-value'>${xs005.minorNm}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+

	'	</td>'+
	'	<td>'+
	'		<div class="d-flex justify-content-center">'+
	'			<div><button type="button" class="mx-1 btn btn-secondary p-1 cameraBtn" >카메라</button></div>'+
	'			<div><button type="button" class="mx-1 btn btn-secondary p-1 gallaryBtn" >갤러리</button></div>'+
	'		</div> '+
	'	</td>'+
	'</tr>';

	$('#addPicList').append(list);

});

$('#fdRegContent').on("click", ".picViewBtn", function() {
	var src = 'http://www.ehyunjin.com/web/' + $(this).parent().parent().find('.filePath').val();
	$('#preview').attr("src",src);


});

$('#fdRegContent').on("click", ".picDelBtn", function() {
	 var imageId =  $(this).parent().parent().find('.imageId').val();
	 var result = confirm("해당파일을 삭제하시겠습니까?");
	 if(result){
		 picDel(imageId);
	 }
});





$('#fdRegContent').on("click", ".cameraBtn", function() {
  	var xs005 = $(this).parent().parent().parent().parent().find('input[name="xs005"]').val();

	 if(xs005 != ''){
	 	if (window.ReactNativeWebView) {
			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			var soNoVal = $('input[name=soNo]').val();


			window.ReactNativeWebView.postMessage(JSON.stringify({
				gubun:"camera",
				type : "REQ_CAMERA_PERMISSION",
				soNo : soNoVal,
				xs005 : xs005

		}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}
	}else{
		alertBox('품목을 선택해주세요',"danger");
	}

});

$('#fdRegContent').on("click", ".gallaryBtn", function() {
 	var xs005 =$(this).parent().parent().parent().parent().find('input[name="xs005"]').val();
	if(xs005 != ''){
	 	if (window.ReactNativeWebView) {
			// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
			var soNoVal = $('input[name=soNo]').val();


			window.ReactNativeWebView.postMessage(JSON.stringify({
				gubun:"gallary",
				type : "REQ_CAMERA_PERMISSION",
				soNo : soNoVal,
				xs005 : xs005

		}));
		} else {
			// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
			alert({
				message : ERROR_TYPES.notMobile
			});
		}
	}else{
		alertBox('품목을 선택해주세요',"danger");
	}

});

/* 테이블 리스트 선택시 색변경 */
$('#fdRegContent').on('click', '#workList tr', function(){
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
	$('#workList tr').each(function (index, item) {
		if($(this).hasClass('backcolor')){
			if($(this).find('.status').val() == 'I'){
				$(this).remove();
			}
			$(this).removeClass("backcolor");
			$(this).addClass("statusD");
			$(this).find('.status').val("D");

		}

	});
});

$('#searchBtn').click(function(){
	refreshPage();
});


$('#saveBtn').click(function(){
	$('#trCount').val($('#workList tr').length);

	if(fdValidate()){
		saveFd();
	}

});



document.addEventListener("message", function(data) {
	var result= data.data;

	if(result == 'upload'){
		refreshPic();
	}



})


$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = './fd';
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

	var url = './customSignRegContent';
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


var picDel = function (imageId){
	$.ajax({
        type : "get",
        url : "./picDelete/"+imageId,
        dataType : 'json',
        success        :    function(data){

        }
        , beforeSend: function() {

        },
        complete:function(){
        	refreshPic();
        }
	});
};

var refreshPic = function (){

    $.ajax({
        type:    "post",
        url : './pic',
        dataType    :    'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
			console.log(data.length);
        	$('#addPicList').empty();
        	var count = $('#addPicList >tr').length;
        	count++;
        	var list ='';


			var num= 0;
        	if(data.length > 0 ){
        		for(var i=0; i<data.length; i++){

        			list =
        				' <tr>'+
    					'	<td class="d-none"><input type="hidden" class="status" name="status" value="U"></td>'+
    					'	<td width="5">'+ (++num) +'</td>'+
    					'	<td>'+
    					'		<select class="form-select form-select-sm xs005"  name="xs005"  aria-label=".form-select-sm example" disabled>'+
    					'			<option value="">선택</option>'+
    					'	 		<c:forEach var="xs005" items="${xs005s}" varStatus="status">'+
    					'		       	 	<option value="${xs005.minorCd}" >${xs005.minorNm}</option>'+
    					'		    </c:forEach>'+
    					'		</select>'+
    					'	</td>'+
    					'	<td>'+
    					'		<div class="d-flex justify-content-center">'+
    					'			<input type="hidden" class="filePath" value="'+data[i].filePath+'" >'+
    					'			<input type="hidden" class="imageId" value="'+data[i].imageId+'" >'+
    					'			<div><button type="button" class="mx-1 btn btn-secondary p-1 picViewBtn" >사진</button></div>'+
    					'			<div><button type="button" class="mx-1 btn btn-danger p-1 picDelBtn" >삭제</button></div>'+
    					'		</div>'+
    					'	</td>'+
    					'</tr>';

			        	$('#addPicList').append(list);
    					$(".xs005").eq(i).val(data[i].type).prop("selected", true);
    					$('#previe').attr("src","http://www.ehyunjin.com/web/"+data[0].filePath);

            		}
        	}
        }
   });
};



var saveFd = function (){

	$.ajax({
        type : "post",
        url : "fd",
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

	var url = 'fd/1';
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

var adPackItemAmt = function(itemCode){
	$('input[name="adPackItem"]').val(itemCode);
	$('input[name="itemCd"]').val(itemCode);
	getAmts();
}

var getAmts = function (){

	$.ajax({
        type : "post",
        url : "api/amt",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){

			$('.listPrice').html(numberWithCommas(data.listPrice));
			$('.discountAmt').html(numberWithCommas(data.discountAmt));
			$('.total').html(numberWithCommas(data.listPrice-data.discountAmt));

        }
		, beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
	});
};


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
