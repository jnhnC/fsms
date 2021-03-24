<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<link href="/css/mobile/tableList.css" rel="stylesheet">

<link href="/css/mobile/exRegContent.css" rel="stylesheet">

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="/js/selectSearch.js"></script>

<div id="exRegContent">
	<div class="item"> <!--1  -->
		<jsp:include page="header.jsp" flush="false" />
	</div>

	<div class="item"><!--2  -->
		<jsp:include page="buttonbar.jsp" flush="false" />
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

				<button class="btn btn-secondary shadow-sm pt-1">
				<div style="background-color:">
					<i class="fas fa-qrcode"></i>
				</div>
		  		</button>

			</div>

			<div id="mobile-result" class="">
				<div class="tablebox">
					<table class="table">
						<thead>
							<tr id="header">
								<td></td>
								<td><input class="form-check-input me-1" type="checkbox"></td>
								<td>품목명</td>
								<td>수량</td>
								<td>QR코드</td>
								<td>출고일자</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td><input class="form-check-input me-1" type="checkbox"></td>
								<td>인력지원</td>
								<td>1</td>
								<td>A0108670-A1228016</td>
								<td>2021-03-24</td>
							</tr>
							<tr>
								<td></td>
								<td><input class="form-check-input me-1" type="checkbox"></td>
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
						<div style="font-size: calc(0.26vw + 7.6pt);">출고취소</div>
	   				</button>

				</div>

				<div>
				<button class="btn btn-primary shadow-sm pt-1">
					<div style="font-size: calc(0.26vw + 7.6pt);">출고등록</div>
   				</button>

				</div>

			</div>

	</div>
</div>





