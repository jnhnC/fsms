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

<link href="./css/mg/mg002.css" rel="stylesheet">


<div id="mgRegContent" >

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
						<input type="text" class="` form-control " placeholder="경기본부"
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
		   		  	<!--  <button type="button" id="searchBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">조회</div>
			   	</button> -->
			  	 <button type="button" id="saveBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>


			</div>

		</div>

	</div>

	<div class="item"><!--3  -->
		<table class="table table-row tTable" style="font-size: calc(0.26vw + 10.08pt);">
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

		<table class="table table-row mtable mt-3" style="font-size: calc(0.26vw + 10.08pt);display:none;">
			<tbody>
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
					<td class="value">${so.bpNm} </td>
				</tr>
				<tr>
					<td class="title">대상자</td>
					<td class="value">${so.ownNm}</td>
				</tr>
				<tr>
					<td class="title">장례식장</td>
					<td class="value">${so.dlvyNm}</td>
				</tr>
				<tr>
					<td class="title">경조사유</td>
					<td class="value">${so.hsNm}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="item"><!--4  -->
	 	<table class="table table-row tTable" style="font-size: calc(0.26vw + 10.08pt);">
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
		<table class="table table-row mtable" style="font-size: calc(0.26vw + 10.08pt);display:none">
		  <tbody>
   		    <tr>
				<td class="title">상품금액</td>
				<td class="value listPrice" ><fmt:formatNumber value="${amt.listPrice}" pattern="#,###" /></td>
		    </tr>
	       	<tr>
			   	<td class="title">고객부담금</td>
				<td class="value total"><fmt:formatNumber value="${amt.listPrice - amt.discountAmt}" pattern="#,###" /></td>
		    </tr>
		     <tr>
				<td class="title">행사차감액</td>
				<td class="value discountAmt"><fmt:formatNumber value="${amt.discountAmt}" pattern="#,###" /></td>
		    </tr>
		  </tbody>
		</table>
	</div>

	<div class="item"><!--5  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs ps-3 ">
				<li class="nav-item"><a class="nav-link active">근무현황등록</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
					<div class="d-flex justify-content-between py-2" style="border-bottom: 1px solid #dee2e6">
						<div class="text-start ms-2">
							<div class="btnBox">
								<div id="basic" class="me-2 activeBtn">
									<div class="navBtn">기본</div>
								</div>

								<div id="dtIn"  class="me-2">
									<div class="navBtn">출근</div>
								</div>
								<div id="dtOut">
									<div class="navBtn">퇴근</div>
								</div>

							</div>
						</div>
						<div class="text-end">
							<span id="addRowBtn"><i class="h2 bi bi-plus-square text-primary mx-1"></i></span>
							<span id="delRowBtn"><i class="h2 bi bi-dash-square text-danger mx-1"></i></span>
						</div>
					</div>
					<div class="mobile-result">
						<div class="tablebox">
							<table class="table text-center">
								<thead>
									<tr id="header">
										<td class="d-none"></td>
										<td class="d-none"></td>
										<td class=""  	   style="width:20px;"></td>
										<td class=""  	   style="width:80px;">관리사명</td>
										<td class="basic"  style="width:80px;">구분</td>
										<td class="in" 	   style="width:80px;">출근일</td>
										<td class="in" 	   style="width:80px;">출근(시)</td>
										<td class="in" 	   style="width:80px;">출근(분)</td>
										<td class="out"    style="width:80px;">퇴근일</td>
										<td class="out"    style="width:80px;">퇴근(시)</td>
										<td class="out"    style="width:80px;">퇴근(분)</td>
										<td class="basic"  style="width:80px;">근무시간</td>
									</tr>
								</thead>
								<tbody id="workList">
									 <c:forEach var="ws" items="${wss}" varStatus="status">
										<tr>
											<td class="d-none"><input type='hidden' class='status' name='status' value='U'> </td>
											<td class="d-none"><input type='hidden' class='actSeq' name='actSeq' value='${ws.actSeq}'> </td>

											<td class="">${status.count }</td>
											<td class="">
												<%-- <div class="dropdown">
													<div class="dropdown-input">
														<input type="text" id=""  class="drop3btn form-control w-75" placeholder=""
																value="${ws.actNm}">
														 <i class="down-icon bi bi-caret-down-fill"></i>
														 <input type="hidden" name="actCd" value="${ws.actCd}">
													</div>
													<div  class="dropdown-content" >
														<c:forEach var="mg" items="${mgs}" varStatus="status">
															<a class="empNm">
																<span class="badge bg-danger actCd">${mg.empNo}</span>
																<span class="select-value">${mg.empNm}</span>
															</a>
														</c:forEach>
													</div>
												</div> --%>
												<div style="text-align:center;min-width:70px;">
													 <input type="hidden" name="actCd" value="${ws.actCd}">
													${ws.actNm}
												</div>

											</td>
											<td class="basic" >
												<div class='dropdown text-center'>
													<div class='dropdown-input justify-content-center'>
														<input type='text' id='actType' class='drop3btn form-control' placeholder='선택'
															style='width:70px;' inputmode='none' value="${ws.actTypeNm }">
														  <i class='down-icon bi bi-chevron-down'></i>
													</div>
													<div  class='dropdown-content rounded'>
														<input type='hidden' name='actType' value='${ws.actType}'>
														<c:forEach var='at' items='${ats}' varStatus='status'>
															<a class='actTypeBox'>
																<span class='d-none actType'>${at.code}</span>
																<span class='select-value'>${at.codeName}</span>
															</a>
														</c:forEach>
													</div>
												</div>
											</td>
											<td class="in" >
												<div class='datebox'>
													<div class='datePickerbox d-flex justify-content-center'>
														<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'
														name='actDtIn'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' value="${ws.actDtIn}" style='width:100px;' >
													</div>
												</div>
											</td>
											<td class="in" >
												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtInHour" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtInHour}"
															>
														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded" style="height:200px;overflow:scroll" >
														<input type='hidden' name='actDtInHour' value='${ws.actDtInHour}'>
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
											<td class="in" >
												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtInMinute" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtInMinute }"
															>
														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded" style="height:200px;overflow:scroll" >
														<input type='hidden' name='actDtInMinute' value='${ws.actDtInMinute}'>
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
											<td  class="out">

												<div class='datebox'>
													<div class='datePickerbox d-flex justify-content-center'>
														<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'
														name='actDtOut'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' value="${ws.actDtOut}" style='width:100px;'>
													</div>
												</div>
											</td>
											<td  class="out">

												<div class="dropdown-input justify-content-center">
													<input type="text" id="actDtOutHour" class="drop3btn form-control" placeholder="선택"
														 style="width:70px;" inputmode='none'
														value="${ws.actDtOutHour}"	>
													 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
												</div>
												<div  class="dropdown-content rounded" style="width:70px;height:200px;overflow:scroll" >
													<input type='hidden' name='actDtOutHour' value='${ws.actDtOutHour}'>
													<c:forEach var="i"  begin="0" end="23">
										 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
														<a class="actDtOutHourBox">
															<span class="d-none actDtOutHour">${hh}</span>
															<span class="select-value">${hh}</span>
														</a>
													  </c:forEach>
												</div>

											</td>
											<td  class="out">

												<div class="dropdown">
													<div class="dropdown-input justify-content-center">
														<input type="text" id="actDtOutMinute" class="drop3btn form-control" placeholder="선택"
															 style="width:70px;" inputmode='none'
															value="${ws.actDtOutMinute }"
															>

														 <i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
													</div>
													<div  class="dropdown-content rounded" style="height:200px;overflow:scroll" >
														<input type='hidden' name='actDtOutMinute' value='${ws.actDtOutMinute}'>
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
											<td class="basic">
												 <input type="hidden" class="form-control p-0 px-1 actRemark"  name="actRemark" value="${ws.actRemark}">
												${ws.workTime}
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

<div>
	<input type="hidden" name="soNo" value="${so.soNo}">
	<input type="hidden" name="trCount" id="trCount" value="">
	<input type="hidden" name="soldToParty"  value="${so.soldToParty}">
	<input type="hidden" name="adPackItem"  value="${so.adPackItem}">
	<input type="hidden" name="hsType"  value="${so.hsType}">


	<!-- 공통금액을 가져오기위한 값  -->
	<input type="hidden" name="itemCd" value="">


</div>




<script>
$('#menu-nav').html("관리사일지/등록")



$('#mgRegContent').on("click", ".actCdBox", function() {
	$(this).parent().find('input[name="actCd"]').val($(this).find('.actCd').html());
});

$('#mgRegContent').on("click", ".actTypeBox", function() {
	$(this).parent().find('input[name="actType"]').val($(this).find('.actType').html());
});


$('#mgRegContent').on("click", ".actDtInHourBox", function() {
	$(this).parent().find('input[name="actDtInHour"]').val($(this).find('.actDtInHour').html());
});

$('#mgRegContent').on("click", ".actDtInMinuteBox", function() {
	$(this).parent().find('input[name="actDtInMinute"]').val($(this).find('.actDtInMinute').html());
});

$('#mgRegContent').on("click", ".actDtOutHourBox", function() {
	$(this).parent().find('input[name="actDtOutHour"]').val($(this).find('.actDtOutHour').html());
});

$('#mgRegContent').on("click", ".actDtOutMinuteBox", function() {
	$(this).parent().find('input[name="actDtOutMinute"]').val($(this).find('.actDtOutMinute').html());
});


$('#addRowBtn').click(function(){
	$('#basic').trigger("click");


	var count = $('#workList >tr').length;


/* 	var actType = "";
	<c:forEach var='at' items='${ats}' varStatus='status'>
		actType +=  "<option value='"+${at.code}+"'>"+${at.codeName}+"</option>";
	</c:forEach> */

	var hh = "";
	for(var i=0; i<24; i++){
		var value="";
		if(i>9){
			value= i;
			hh += "<option value='"+value+"'>"+value+"</option>";
		}else{
			value= "0"+i;
			hh += "<option value='"+value+"'>"+value+"</option>";
		}
	}

	var mm = "";
	for(var i=0; i<60; i+=10){
		var value="";
		if(i>9){
			value= i;
			mm += "<option value='"+value+"'>"+value+"</option>";
		}else{
			value= "0"+i;
			mm += "<option value='"+value+"'>"+value+"</option>";
		}
	}


	var list = "<tr>"+
	"<td class='d-none'><input type='hidden' class='status' name='status' value='I'></td>"+
	"<td class='d-none'><input type='hidden' class='actSeq' name='actSeq' value=''></td>"+
	"<td>"+ (++count) +"</td>"+
	"<td>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input'>"+
				"<input type='text' class='drop3btn form-control actInput' name='actCdInput' style='ime-mode:active;width:75px;'>"+
				"<i class='down-icon bi bi-chevron-down'></i>"+
			/* 	 "<input type='hidden'   style='' value=''>"+ */
			"</div>"+
			"<div  class='dropdown-content rounded' >"+
				"<input type='hidden' name='actCd' value=''>"+
				"<c:forEach var='mg' items='${mgs}' varStatus='status'>"+
					"<a class='actCdBox'>"+
						"<span class='badge bg-danger actCd'>${mg.empNo}</span><br>"+
						"<span class='select-value'>${mg.empNm}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td style='' class='basic'>"+
		/* "<select class='form-select py-0' name='actType' class='p-0 px-1' aria-label='.form-select-sm example'>"+
			"<option value=''>선택</option>"+
			"<c:forEach var='at' items='${ats}' varStatus='status'>"+
	        "<option value='${at.code}'>${at.codeName}</option>"+
	    "</c:forEach>"+
		"</select>"+ */
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actType' class='drop3btn form-control' placeholder='선택'"+
					"style='width:80px;' inputmode='none'>"+
				 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded' >"+
				"<input type='hidden' name='actType' value=''>"+
				"<c:forEach var='at' items='${ats}' varStatus='status'>"+
					"<a class='actTypeBox'>"+
						"<span class='d-none actType'>${at.code}</span>"+
						"<span class='select-value'>${at.codeName}</span>"+
					"</a>"+
				"</c:forEach>"+
			"</div>"+
		"</div>"+

	"</td>"+
	"<td class='in'>"+
		"<div class='datebox'>"+
			"<div class='datePickerbox d-flex justify-content-center'>"+
				"<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'"+
				"name='actDtIn'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' style='width:95px;' >"+
			"</div>"+
		"</div>"+
	"</td>"+
	"<td class='text-ceter in'>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtInHour' class='drop3btn form-control' placeholder='선택'"+
					"style='width:65px;' inputmode='none'>"+
				 " <i style='font-size:5pt;' class='down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded' >"+
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
	"<td class='text-ceter in'>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtInMinute' class='drop3btn form-control' placeholder='선택'"+
					"style='width:65px;' inputmode='none'>"+
				 "<i style='font-size:5pt;' class='ms-1 down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded' >"+
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
	"<td class='out'>"+
	"<div class='datebox'>"+
		"<div class='datePickerbox d-flex justify-content-center'>"+
			"<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'"+
			"name='actDtOut'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' style='width:95px;' >"+
		"</div>"+
	"</div>"+
	"</td>"+
	"<td class='text-ceter out'>"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtOutHour' class='drop3btn form-control' placeholder='선택'"+
					"style='width:65px;' inputmode='none'>"+
				 " <i class='down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded' >"+
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
	"<td class='text-ceter out' >"+
		"<div class='dropdown'>"+
			"<div class='dropdown-input justify-content-center'>"+
				"<input type='text' id='actDtOutMinute' class='drop3btn form-control' placeholder='선택'"+
					"style='width:65px;' inputmode='none'>"+
				 "<i class='ms-1 down-icon bi bi-chevron-down'></i>"+
			"</div>"+
			"<div  class='dropdown-content rounded' >"+
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
	"<td class='text-ceter basic'>"+
		"<input class=' d-none form-control py-0 px-1' name='actRemark' type='text'>"+
	"</td>"+
	"</tr>";

	$('#workList').append(list);

});




 $('#mgRegContent').on('keyup', '.actInput', function(e){
		 filterFunctionJs(this);
});

 $('#mgRegContent').on('click', '.empNm', function(e){
		$(this).parent().siblings('.dropdown-input').find("input[name='actCd']").val($(this).find('.actCd').text());
});



 $('#mgRegContent').on('click', '#workList tr', function(){

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

 /*** 모바일 환경일때만 적용되게  ***/

 $('#basic').click(function(){
	if( $('#mgRegContent').width() < 768){
		$('.out').hide();
		$('.in').hide();
		$('.basic').show();
		$(this).siblings('div').removeClass('activeBtn');
		$(this).addClass('activeBtn');
	}

});
 $('#dtIn').click(function(){
	 if( $('#mgRegContent').width() < 768){
		$('.basic').hide();
		$('.out').hide();
		$('.in').show();
		$(this).siblings('div').removeClass('activeBtn');
		$(this).addClass('activeBtn');
	 }

});

 $('#dtOut').click(function(){
	 if( $('#mgRegContent').width() < 768){
		$('.basic').hide();
		$('.in').hide();
		$('.out').show();
		$(this).siblings('div').removeClass('activeBtn');
		$(this).addClass('activeBtn');
	 }

 });


 /**************************/

 $('#searchBtn').click(function(){
	refreshPage();

});


$('#saveBtn').click(function(){
	$('#trCount').val($('#workList tr').length);

	if(mgValidate()){
		saveFd();
	}

});


$('#ypPicBtn').click(function() {
 	if (window.ReactNativeWebView) {
		// 모바일이라면 모바일의 카메라 권한을 물어보는 액션을 전달합니다.
		window.ReactNativeWebView.postMessage(JSON.stringify({
			gubun:"camera",
			type : "REQ_CAMERA_PERMISSION"

		}));
	} else {
		// 모바일이 아니라면 모바일 아님을 alert로 띄웁니다.
		alert({
			message : ERROR_TYPES.notMobile
		});
	}

});




$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = './mg';
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
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
    });
});



var saveFd = function (){

	$.ajax({
        type : "post",
        url : "./mg",
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

	var url = 'mg/1';
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
        url : "./api/amt",
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
