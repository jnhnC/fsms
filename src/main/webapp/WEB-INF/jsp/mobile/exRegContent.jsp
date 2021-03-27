<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<link href="/css/mobile/tableList.css" rel="stylesheet">
<link href="/css/mobile/buttonbar.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<link href="/css/mobile/nextpage.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>



<link href="/css/mobile/exRegContent.css" rel="stylesheet">


<div id="exRegContent">
	<div class="item"> <!--1  -->
	<%-- 	<jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div class="item" >
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<input type="text" class="drop3btn form-control " placeholder="경기본부"
						onclick="" onkeyup="filterFunction(this)">
					<i class="down-icon bi bi-caret-down-fill"></i>
					<div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
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

	<div class="item"><!--3  -->
		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
		  <tbody>
		    <tr>
		      <td>주문번호</td>
		      <td></td>
		    </tr>
		    <tr>
		      <td>주문일시</td>
		      <td></td>
		    </tr>
		     <tr>
		      <td>고객사</td>
		      <td></td>
		    </tr>
		     <tr>
		      <td>장례식장</td>
		      <td></td>
		    </tr>
		     <tr>
		      <td>대상자</td>
		      <td></td>
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

				<div style="background-color:black;width:45px;height:30px;text-align:center;border-radius: 4px;padding-top:2px;">
			  		<i class="fas fa-barcode"  style="color:white;font-weight:bold;font-size: calc(0.26vw + 18.6pt);"></i>

				</div>

			</div>

			<div class="mobile-result">
				<div class="tablebox">
					<table class="table">
						<thead>
							<tr id="header">
								<td></td>
								<td><input id="allCheck" name="checkbox" class="form-check-input me-1" type="checkbox"></td>
								<td>품목명</td>
								<td>수량</td>
								<td>QR코드</td>
								<td>출고일자</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td><input name="checkbox" class="form-check-input me-1" type="checkbox"></td>
								<td>인력지원</td>
								<td>1</td>
								<td>A0108670-A1228016</td>
								<td>2021-03-24</td>
							</tr>
							<tr>
								<td></td>
								<td><input name="checkbox" class="form-check-input me-1" type="checkbox"></td>
								<td>지원상품</td>
								<td>12</td>
								<td>A0102630-A1257018</td>
								<td>2021-03-24</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="buttonGroup2">
				<div>
			 		<button class="btn btn-secondary shadow-sm pt-1">
						<div>출고취소</div>
	   				</button>

				</div>

				<div>
				<button class="btn btn-primary shadow-sm pt-1">
					<div>출고등록</div>
   				</button>

				</div>

			</div>
	</div>

	<div class="item"><!--5  -->
		<div id="nextPage">
			<button class="btn btn-primary">
				상품페이지로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div>
</div>


<script>
	$('#menu-nav').html("출고처리/등록")

	$('#allCheck').click(function(){
		var checked = $(this).is(":checked");

		if(checked){
			$(this).parents("table").find('input').prop("checked", true);
		} else {
			$(this).parents("table").find('input').prop("checked", false);
		}
	});


	$('#nextPage').click(function(){
		/* alert($(this).children('td:first').html()); */

		var url = '/mobile/productSearchContent';
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



</script>


