<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/tab.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/nextpage.css" rel="stylesheet">
<link href="./css/component/tableRow.css" rel="stylesheet">

<script src="./js/selectSearch.js"></script>
<script src="./js/tab.js"></script>
<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>



<link href="./css/tc/tc002.css" rel="stylesheet">


<div id="tcRegContent">
	<div class="item">
		<!--1  -->
		<%-- 	<jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item">
		<!--2  -->
		<div id="mobile-buttonbar">
			<div id="prevPage" class="item">
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control "
							placeholder="경기본부" onclick="" onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>

					<div class="dropdown-content">
						<a href="#about">본인상</a> <a href="#base">부친상</a> <a href="#blog">모친상</a>
					</div>
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

	<div class="item">
		<!--3  -->
		<table class="table table-row"
			style="font-size: calc(0.26vw + 10.08pt);">
			<tbody>
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
					<td class="value">${so.ownNm}</td>
				</tr>
				<tr>
					<td class="title">경조사유</td>
					<td class="value">${so.hsNm}</td>
				</tr>
				</tr>

			</tbody>

		</table>
	</div>

	<div class="item">
		<!--4  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs" style="font-size: calc(0.26vw + 9.08pt)">
				<li class="nav-item"><a class="nav-link active">사전상담내용</a></li>
				<li class="nav-item"><a class="nav-link">고객사지원내용</a></li>
				<li class="nav-item"><a class="nav-link">상품지원내용</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1"
					style="font-size: calc(0.26vw + 10.08pt)">
					<div class="mx-3 my-2">
						<div class="d-flex py-2">
							<div style="width: 30%">사전상담번호</div>
							<div style="width: 70%" class="text-center border-bottom">010-9497-6266</div>
						</div>
						<div>
							<div class="mb-3">주요상담내용</div>
							<div class="w-100"
								style="background-color: #ebeff1; height: auto; min-height: 200px;">

							</div>
						</div>

					</div>

				</div>
				<div class="content" id="tab2"
					style="font-size: calc(0.26vw + 9.08pt)">
					<div class="table-content mx-2">
						<div class="mobile-result">
							<div class="title">기본지원</div>
							<div class="tablebox">
								<table class="table">
									<thead>
										<tr id="header"  style="font-size: calc(0.26vw + 9.08pt)">
											<td style="width:10px;"></td>
											<td style="width:100px;">지원품목</td>
											<td style="width:;">지원내용</td>
										</tr>
									</thead>
									<tbody  style="font-size: calc(0.26vw + 9.08pt)">
										<c:forEach var="comSupport" items="${comSupports}"
											varStatus="status">
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
							<div class="title">선택지원</div>
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

									<c:choose>
					         		<c:when test = "${not empty atResponses }">
					         			<c:forEach var="comSupport" items="${atResponses}"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${atResponses.minorNm}</td>
												<td class="text-start">${atResponses.colDesc}</td>
											</tr>
										</c:forEach>
					         		</c:when>
					         		<c:otherwise>
					         			<tr>
												<td colspan="3">등록된 정보가 없습니다</td>
											</tr>
					         		</c:otherwise>
					      		</c:choose>


									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<div class="content" id="tab3">
					<div >

						<div class="d-flex align-items-center justify-content-around">
							<div class="my-3">
								<select id="item1"	class="form-select py-0 " aria-label="Default select example" style="font-size: calc(0.26vw + 10.08pt)">
									<option value="">선택</option>
									<c:forEach var="item" items="${items}" varStatus="status">
										<option value="${item.itemCd}">${item.itemNm}</option>
									</c:forEach>
								</select>
							</div>
							<div>
								 <button type="button" id="alimTalkBtn" class=" btn btn-secondary shadow-sm p-0">
									<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">문자보내기</div>
							   	</button>
							   	   	<!-- <button type="button" class="btn btn-warning p-0 px-2 " style="background-color:rgba(255,238,51,0.99);font-size: calc(0.26vw + 8.6pt);">알림톡 <i class="bi bi-chat-fill"></i></button> -->
							</div>

						</div>

						<table class="table table-row" style="font-size: calc(0.26vw + 9.08pt);border-top: 1px solid rgba(0,0,0,.125)">
						  <tbody>
						    <tr>
						      <td style="width:90px;background-color: #ebeff1;" class="text-end pe-2">상품금액</td>
						      <td style="width:100px;" class="text-end  pe-2 listPrice"></td>
					          <td style="width:90px;background-color: #ebeff1;" class="text-end pe-2 ">고객부담금</td>
						      <td class="text-end total  pe-2"></td>
						    </tr>
						     <tr>
						      <td class="text-end pe-2 " style="background-color: #ebeff1;">행사차감액</td>
						      <td class="text-end discountAmt  pe-2"></td>
						      <td class="text-end pe-2" style="background-color: #ebeff1;"></td>
						      <td class="text-end  pe-2"></td>
						    </tr>

						  </tbody>
						</table>
					</div>


					<div class="table-content">
						<div class="mobile-result">
							<div class="tablebox">
								<table class="table">
									<thead>
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
					</div>
				</div>
			</div>
		</div>
	</div>


</div>
<input type="hidden" class="soNo" name="soNo" value="${so.soNo}">
<input type="hidden" name="soldToParty" value="${so.soldToParty}">
<input type="hidden" name="hsType" value="${so.hsType}">
<input type="hidden" name="pakage" value="${so.adPackItem}">
<input type="hidden" name="subs" value="${so.adChItem}">
<input type="hidden" name="itemCd" value="">
<input type="hidden" name="prgmId" value="tc002">
<input type="hidden" name="hp" value="01094976266">
<input type="hidden" name="sndNum" value="16000113">




<script>
	$('#menu-nav').html("유선상담/등록");

	$('#allCheck').click(function() {
		var checked = $(this).is(":checked");

		if (checked) {
			$(this).parents("table").find('input').prop("checked", true);
		} else {
			$(this).parents("table").find('input').prop("checked", false);
		}
	});

	$('#alimTalkBtn').click(function() {

		var soNo = $('.soNo').val();
		var url = "http://182.162.91.75:8080/fsms/tc/"+soNo;

		//window.open(url, 'tc003', 'scrollbars=yes');
		sendMms();




		/* var popup = window.open('http://www.naver.com', '네이버팝업', 'width=700px,height=800px,scrollbars=yes'); */

	});

	$('.checkbox').change(function() {
		if (bacodeCheck() == 0) {
			$("input:checkbox[name='expo']").prop("checked", false);
			return;
		}

	});

	$("#item1").on( "change", function() {
		 $('input[name="itemCd"]').val($(this).val());
		/* $('input[name="subs"]').val($(this).val()); */
		 getSelSupports("item1");
		 getAmts();

	});

	$('#prevPage').click(function() {
		/* alert($(this).children('td:first').html()); */

		var url = './tc';
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

		var url = './';
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

	var refreshPage = function() {

		var url = 'tc/1';
		$.ajax({
			type : "post",
			url : url,
			dataType : 'html',
			data : $("#form").serialize(), //보낼데이터
			success : function(data) {
				$("#content").children().remove();
				$("#contet").html(data);

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


	var getSelSupports = function (item){

		var itemId = "#"+item+"List";
		$.ajax({
	        type : "post",
	        url : "api/ps/selSupports",
	        dataType : 'json',
	        data: $("#form").serialize(), //보낼데이터
	        success        :    function(data){
		        console.log(data);
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
				$('.loadingbar').css("display","block");
		    },
		    complete:function(){
		     	$('.loadingbar').css("display","none");
		    }
		});
	};


	var sendMms = function (item){

		$.ajax({
	        type : "post",
	        url : "mms",
	        dataType : 'json',
	        data: $("#form").serialize(), //보낼데이터
	        success        :    function(data){
				var phone = phoneForm(data.msgText);

				var msg = phone+"<br>고객에게 문자가<br>전달되었습니다.";

				alertBox(msg,'warning');

	        }
			, beforeSend: function() {
				$('.loadingbar').css("display","block");
		    },
		    complete:function(){
		     	$('.loadingbar').css("display","none");
		    }
		});
	};


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




</script>


