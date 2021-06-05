<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link href="./css/cp/cp002.css" rel="stylesheet">


<div id="customPayRegContent" >

	<div class="item"> <!--1  -->
		<%-- <jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div class="item" id="prevPage">
				<i class="bi bi-chevron-left"></i>
			</div>


			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control " placeholder="경기본부"
							onclick="" onkeyup="filterFunction(this)" style="width:300px;">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<%-- <div class="dropdown-content">
						<c:forEach var="pt" items="${pts}" varStatus="status">
							<a class="bpNm">
								<span class="d-none bpCd">${pt.bpCd}</span>
								<span class="select-value">${pt.bpNm}</span>
							</a>
						</c:forEach>
					</div> --%>
				</div>
			</div>


			<div class="item">
				<!-- <button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>


				 <button type="button" id="saveBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>

			   	 -->
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

	<div class="item"><!--4  -->
		<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
		  <tbody>
		    <tr>
		      <td class="title">상품금액</td>
		      <td class="value"><fmt:formatNumber value="${amt.listPrice}" pattern="#,###" /></td>
	          <td class="title">고객부담금</td>
		      <td class="value"><fmt:formatNumber value="${amt.listPrice - amt.discountAmt}" pattern="#,###" /></td>
		    </tr>
		     <tr>
		      <td class="title">행사차감액</td>
		      <td class="value"><fmt:formatNumber value="${amt.discountAmt}" pattern="#,###" /></td>
		       <td class="title"></td>
		      <td class="value"></td>
		    </tr>

		  </tbody>
		</table>
	</div>

	<div class="item"><!--5  -->
		<!--5  -->
		<div class="tab-wrapper  ">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs ps-3 ">
				<li class="nav-item"><a class="nav-link active">선택상품</a></li>
				<li class="nav-item"><a class="nav-link">장지/장례일정</a></li>
				<li class="nav-item"><a class="nav-link">동의/서명</a></li>
				<li class="nav-item"><a class="nav-link">결제</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content mt-2">
				<div class="content show" id="tab1">
					<div class="table-content">
						<div class="mobile-result">
							<div class="tablebox">
								<table class="table">
									<thead>
										<tr id="header">
											<td></td>
											<td style="width:130px;">지원품목</td>
											<td>지원내용</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pd" items="${pds}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${pd.minorNm}</td>
											<td class="text-start">${pd.colDesc}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="content" id="tab2">
					<div class="item-content  mt-1">

						<div class="item">
							<table class="table"  style="font-size: calc(0.26vw + 10.08pt);">
								<tbody>
									<tr>
										<td class="title">고인명</td>
										<td class="value">
											<input type="text" onclick="fnMove('mName')" id="mName" name="mName" class="drop3btn form-control p-0 px-2 w-75" value="${cr.name}">
										</td>
									</tr>
									<tr>
										<td class="title">상주명</td>
										<td class="value">
											<input type="text" name="mMourner" class="drop3btn form-control p-0 px-2 w-75" value="${cr.mourner}">
										</td>
									</tr>
									<tr>
										<td class="title">빈소유무</td>
										<td class="value d-flex justify-content-start">
											<div class="form-check pe-3">
											 	<input class="form-check-input"  name="mRoomYn" type="checkbox" value="Y" id="mRoomY" <c:if test="${cr.roomYn eq 'Y'}">checked</c:if>>
											 	<label class="form-check-label" for="mRoomY">
											    	사용
											  	</label>
											</div>

											<div class="form-check">
											 	<input class="form-check-input"  name="mRoomYn" type="checkbox" value="N" id="mRoomN" <c:if test="${cr.roomYn eq 'N'}">checked</c:if>>
											 	<label class="form-check-label" for="mRoomN">
											    	무빈소
											  	</label>
											</div>
										</td>
									</tr>
									<tr>
										<td class="title">호실</td>
										<td class="value">
											<input type="text" name="mRoomNo" class="drop3btn form-control p-0 px-2 w-75" value="${cr.room}">
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div class="item">
							<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
								<tbody>

									<tr>
										<td class="title">장묘형태</td>
										<td class="value">
											<%-- <select name="mType1" class="form-control form-select p-0 px-2 w-75">
											    <option value="">선택</option>
											    <option <c:if test="${cr.type eq 1}">selected</c:if> value="1">화장</option>
											    <option <c:if test="${cr.type eq 2}">selected</c:if> value="2">장지</option>
											</select> --%>
											<div class="dropdown">
												<div class="dropdown-input justify-content-start">
													<input type="text" id="mType1Input" class="drop3btn form-control w-75" placeholder="선택"
														onkeyup="filterFunction(this)"
														<c:choose>
											         		<c:when test = "${cr.type eq '1'}">
											            		value="화장"
											         		</c:when>
											         		<c:when test = "${cr.type eq '2'}">
											            		value="장지"
											         		</c:when>
											         		<c:otherwise>
											         		</c:otherwise>
										      			</c:choose>
														>
													<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
												</div>
												<div  class="dropdown-content w-75 rounded" >
														<a class="mType1Nm">
															<span class="d-none mType1">1</span>
															<span class="select-value">화장</span>
														</a>
															<a class="mType1Nm">
															<span class="d-none mType1">2</span>
															<span class="select-value">장지</span>
														</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="title">화장장</td>
										<td class="value"><input type="text" name="mLoc1" class="drop3btn form-control p-0 px-2 w-75" value="${cr.loc1}"></td>
									</tr>
									<tr>
										<td class="title">장지</td>
										<td class="value">
											<input type="text"  name="mLoc2" class="drop3btn form-control p-0 px-2 w-75" value="${cr.loc2}">
										</td>
									</tr>
									<tr>
										<td class="title">관리사팀장</td>
										<td class="value">
											<div class="dropdown">
												<div class="dropdown-input justify-content-start">
													<input type="text" id="empNmInput" class="drop3btn form-control w-75" placeholder="의전팀장을 선택해주세요"
														onkeyup="filterFunction(this)"	value="${cr.managerNm}">
													<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
												</div>
												<div  class="dropdown-content rounded w-75" >
													<c:forEach var="tl" items="${tls}" varStatus="status">
														<a class="empNm">
															<span class="badge bg-danger mManagerCd">${tl.empNo}</span>
															<span class="select-value">${tl.empNm}</span>
															<span class="">[${tl.roleNm}]</span>
														</a>

													</c:forEach>

												</div>
											</div>

										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="item-content d-flex mt-2">
						<div class="item">
								<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
									<tbody>
										<tr>
											<td class="title">별세일시</td>
											<td class="value">
												<div class="datebox d-flex">
													<div class="datePickerbox d-flex align-items-center mx-1">
														<input type="text" name="dt1" class="datePicker form-control py-0 mx-1 text-right"
															autocomplete="off" id="dieDate"	onfocus="this.blur()" inputmode="none"
															style="width:120px"
															value="${cr.dt1}"
															>
														<i class="bi bi-calendar-check calendar-icon"></i>
													</div>


													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt1HInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.dt1H}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="23">
													 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="dt1HBox">
																		<span class="d-none dt1H">${hh}</span>
																		<span class="select-value">${hh}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt1MInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.dt1M}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="60" step="10">
													 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="dt1MBox">
																		<span class="d-none dt1M">${mm}</span>
																		<span class="select-value">${mm}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td class="title">입관일시</td>
											<td class="value">
												<div class="datebox d-flex">
													<div class="datePickerbox d-flex align-items-center mx-1">
														<input type="text" name="dt2" class="datePicker form-control py-0 mx-1 text-right"
															id="immiDate" autocomplete="off" onfocus="this.blur()" inputmode="none"
															style="width:120px"
															value="${cr.dt2}"
															>
														<i class="bi bi-calendar-check calendar-icon"></i>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt2HInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.dt2H}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="23">
													 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="dt2HBox">
																		<span class="d-none dt2H">${hh}</span>
																		<span class="select-value">${hh}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt2MInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.dt2M}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="60" step="10">
													 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="dt2MBox">
																		<span class="d-none dt2M">${mm}</span>
																		<span class="select-value">${mm}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>

												</div>

											</td>
										</tr>
										<tr>
											<td class="title">발인일시</td>
											<td class="value">
												<div class="datebox d-flex">
													<div class="datePickerbox d-flex align-items-center mx-1">
														<input type="text"  name="dt3" class="datePicker form-control py-0 mx-1 text-right"
															style="width:120px"
															id="imprDate" autocomplete="off" onfocus="this.blur()" inputmode="none"
															value="${cr.dt3}"
															>
														<i class="bi bi-calendar-check calendar-icon"></i>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt3HInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.dt3H}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="23">
													 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="dt3HBox">
																		<span class="d-none dt3H">${hh}</span>
																		<span class="select-value">${hh}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
										<%-- 			<div class="mx-1">
														<select class="form-select py-0" name="dt3M" aria-label="Default select example">
															<option value='' selected>분</option>
														    <c:forEach var="i"  begin="0" end="60" step="10">
														    	<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
														          <option <c:if test="${cr.dt3M eq mm}">selected</c:if> value="${mm}">
														        	${mm}</option>
														    </c:forEach>
														</select>
													</div> --%>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt3MInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.dt3M}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="60" step="10">
													 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="dt3MBox">
																		<span class="d-none dt3M">${mm}</span>
																		<span class="select-value">${mm}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
												</div>

											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="item">
								<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
									<tbody>
										<tr>
											<td class="title">빈소도착</td>
											<td class="value">
												<div class="datebox d-flex">
													<div class="datePickerbox d-flex align-items-center mx-1">
														<input type="text" name="adBsDt" class="datePicker form-control py-0 mx-1 text-right"
															style="width:120px"
															id="murDate"autocomplete="off" onfocus="this.blur()" inputmode="none"
															value="${cr.adBsDt}"
															>
														<i class="bi bi-calendar-check calendar-icon"></i>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adBsDtHInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.adBsDtH}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="23">
													 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="adBsDtHBox">
																		<span class="d-none adBsDtH">${hh}</span>
																		<span class="select-value">${hh}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adBsDtMInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.adBsDtM}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="60" step="10">
													 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="adBsDtMBox">
																		<span class="d-none adBsDtM">${mm}</span>
																		<span class="select-value">${mm}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td class="title">용품도착</td>
											<td class="value">
												<div class="datebox d-flex">
													<div class="datePickerbox d-flex align-items-center mx-1">
														<input type="text" class="datePicker form-control py-0 mx-1 text-right"
																style="width:120px"
															name="adYpDt" 	id="suplDate" autocomplete="off" onfocus="this.blur()" inputmode="none"
														 	value="${cr.adYpDt}"
														 	>
														 <i class="bi bi-calendar-check calendar-icon"></i>
													</div>
									<%-- 				<div class="mx-1">
														<select class="form-select py-0 " name="adYpDtH" aria-label="Default select example">
															<option value='' selected>시</option>
														 	<c:forEach var="i"  begin="0" end="23">
														 		<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
														        <option <c:if test="${cr.adYpDtH eq hh}">selected</c:if> value="${hh}">
													        	${hh}
													        </option>
														    </c:forEach>
														</select>
													</div> --%>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adYpDtHInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.adYpDtH}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="23">
													 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="adYpDtHBox">
																		<span class="d-none adYpDtH">${hh}</span>
																		<span class="select-value">${hh}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adYpDtMInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.adYpDtM}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="60" step="10">
													 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="adYpDtMBox">
																		<span class="d-none adYpDtM">${mm}</span>
																		<span class="select-value">${mm}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
												</div>

											</td>
										</tr>
										<tr>
											<td class="title">근조기설치</td>
											<td class="value">
												<div class="datebox d-flex ">
													<div class="datePickerbox d-flex align-items-center mx-1">
														<input type="text" name="adGjDt" class="datePicker form-control py-0 mx-1 text-right"
															style="width:120px"
															id="flagDate"autocomplete="off"	onfocus="this.blur()" inputmode="none"
															value="${cr.adGjDt}"
															>
														<i	class="bi bi-calendar-check calendar-icon"></i>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adGjDtHInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.adGjDtH}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="23">
													 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="adGjDtHBox">
																		<span class="d-none adGjDtH">${hh}</span>
																		<span class="select-value">${hh}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
													<div class="mx-1">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adGjDtMInput" class="drop3btn form-control" placeholder="선택"
																	onkeyup="filterFunction(this)" style="width:60px;"
																	value="${cr.adGjDtM}"
																	>
																<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
															</div>
															<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
																<c:forEach var="i"  begin="0" end="60" step="10">
													 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
																	<a class="adGjDtMBox">
																		<span class="d-none adGjDtM">${mm}</span>
																		<span class="select-value">${mm}</span>
																	</a>
																  </c:forEach>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-2" >
							<div class="d-flex justify-content-center" >
								<div class="text-center" style="width:80%;">
									<span>패키지 미진행사유</span>
								</div>

								<div style="width:60%;">
									<div class="dropdown">
										<div class="dropdown-input justify-content-start">
											<input type="text" id="noPkgCdInput" class="drop3btn form-control" placeholder="선택"
												onkeyup="filterFunction(this)" style="width:300px"
												value="${cr.noPkgNm}"
												>
											<i style="font-size:5pt;" class="down-icon bi bi-chevron-down"></i>
										</div>
										<div  class="dropdown-content rounded"  >
											<c:forEach var="np" items="${nps}" varStatus="status">
												<a class="noPkgCdBox">
													<span class="d-none noPkgCd">${np.code}</span>
													<span class="select-value">${np.codeName}</span>
												</a>
											  </c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="d-flex justify-content-center" >
						<div id="nextPage" style="position: absolute;bottom: 15px;">
							<button type="button" class="btn btn-primary nextBtn">
								수정페이지로 이동 <i class="bi bi-chevron-right"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="content" id="tab3">
						<div class="item-content">
						<div class="item ps-3">
							<div class="form-check">
							 	<input class="form-check-input"  name=infoAgreeFinal type="checkbox" value="Y" id="infoAgreeFinal" <c:if test="${cr.roomYn eq 'Y'}">checked</c:if>>
							 	<label class="form-check-label" for="infoAgreeFinal">
							    	위에 내용을 확인하였으며 동의합니다.
							  	</label>
							</div>
						</div>
						<div class="item">

							<div id="convasContent">

							    	<canvas id="canvas" style="border: 1px solid lightgray"></canvas>
									<div style="text-align:right;margin-top:10px;">
										<button type="button" id="backBtn" class="btn btn-secondary me-3">초기화</button>
										<button type="button" id="signBtn" class="btn btn-secondary">서명저장</button>
									</div>
							</div>


							<div id="ImgBox">
						    	<img id="img" style="width:500px; hegiht:300px; border: 1px solid lightgray;"/>
						    	<div style="text-align:right;margin-top:10px;">
						    		<button type="button" id="signUptBtn" class="btn btn-secondary">수정</button>
						    	</div>
							</div>

						</div>
					</div>
				</div>
				<div class="content" id="tab4">

					<div class="d-flex justify-content-around mt-3">
						<div style="width:40%; " class="me-2 pb-4">

							<div class="" style="border-bottom: solid 1px;height: 30px; background-color:#f5f5f5">
								<div class="ps-4">결제창</div>
							</div>
							<div>
								<div class="d-flex flex-column align-items-center mt-3" >


									<div class="align-items-center">
										<div>총금액</div>
										<div><input type="text" name="amount" id="amount" value="10" class="form-control h-25 p-1 text-end" style="width:220px"></div>
									</div>
									<div class="align-items-center mt-3">
										<div>카드번호</div>
										<div class="d-flex">
											<input type="text" name="cardNo1" value="5361" class="form-control h-25 p-1" style="width:50px">
											-<input type="text" name="cardNo2" value="4890" class="form-control h-25 p-1" style="width:50px">
											-<input type="text" name="cardNo3" value="1013" class="form-control h-25 p-1" style="width:50px">
											-<input type="text" name="cardNo4" value="6965" class="form-control h-25 p-1" style="width:50px">

										</div>
									</div>
									<div class="d-flex mt-3">
										<div>
											<div>카드 유효년도 </div>
											<div class="d-flex">
												<input type="text" name="cardMM" value="07" class="form-control h-25  p-1" style="width:50px" placeholder="월">
												/<input type="text" name="cardYY" value="25" class="form-control h-25  p-1" style="width:50px" placeholder="년">
											</div>

										</div>
										<div style="margin-left:52px;">
											<div>할부개월 </div>
											<div><input type="text" name="installment" value="0" class="form-control h-25  p-1" style="width:50px"></div>
										</div>
									</div>

									<div class="mt-3">
										 <button type="button" id="payAtBtn" class=" btn btn-secondary shadow-sm p-0 " style="width:220px;">
											<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">결제하기</div>
									   	</button>

									</div>
								</div>
								<div>

								</div>
								<div>

								</div>
							</div>
						</div>

						<div style="widht:60%;">
							<div class="mobile-result">
								<div class="tablebox">
									<table class="table">
										<thead>
											<tr id="header">
												<td class="d-none"></td>
												<td class="d-none"></td>
												<td class="d-none"></td>
												<td></td>
												<td style='width:85px;'>상태</td>
												<td style='width:150px;'>금액</td>
												<td style='width:150px;'>결제일</td>
												<td style='width:145px;'>취소</td>
												<td style='width:110px;'>영수증</td>
											</tr>
										</thead>
										<tbody id="payAtList">
											<c:forEach var="pa" items="${pas}" varStatus="status">
												<tr>
													<td class="d-none"><input type='hidden' class='seq'  value='${pa.seq}'> </td>
													<td class="d-none"><input type='hidden' class='orderNo' value='${pa.orderNo}'> </td>
													<td class="d-none"><input type='hidden' class='uuid' value='${pa.uuid}'> </td>
													<td>${status.count }</td>
													<td>
													<c:choose>
														<c:when test="${pa.payStatus eq '1'}">
												           결제
												        </c:when>
														<c:otherwise>
												           취소
												         </c:otherwise>
													</c:choose>
													</td>
													<td><fmt:formatNumber value="${pa.billAmt}" pattern="#,###" /></td>
													<td>${pa.insrtDt}</td>
													<td>

														<c:choose>
															<c:when test="${pa.payStatus eq '1'}">
																 <button type="button"  class="payAtCancBtn btn btn-secondary shadow-sm p-0 " style="width:100px;background-color:#FFE3EE;color:black">
																	<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">결제취소</div>
															   	</button>
													        </c:when>
															<c:otherwise>
													           취소완료
													         </c:otherwise>
														</c:choose>


													</td>
													<td>
														 <button type="button"  class="payAtRcpt btn btn-secondary shadow-sm p-0 " style="width:80px;background-color:#ACF3FF;color:black">
															<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">영수증</div>
													   	</button>

													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- <iframe seamless src="https://www.payat.co.kr/CBNBq" style="width:100%;height:100%;"></iframe> -->

				</div>
			</div>
		</div>
	</div>
	<!-- <div class="item">
		<div id="nextPage">
			<button class="btn btn-primary nextBtn">
				상담결과등록으로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div> -->

</div>

<div>
	<input type="hidden" name="soNo" value="${so.soNo}">
	<input type="hidden" name="mManagerCd" value="${cr.managerCd}">
	<input type="hidden" name="seq" value="0">
	<input type="hidden" name="orderNo" value="0">
	<input type="hidden" name="adType" value="${so.adType}">
	<input type="hidden" name="itemCd" value="${so.itemCd}">

</div>
<script>
$('#menu-nav').html("고객결제 /등록")

$('#convasContent').css('width',$('#tab3 .item:nth-child(2)').width()/2);
$('#convasContent').css('height',$('#tab3 .item:nth-child(2)').width()/4);


$("#amount").keyup(function() {
    inputNumberFormat(this);
});


$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('#signBtn').click(function(){
	var canvas = $("#canvas");
    var imgDataUrl = canvas[0].toDataURL('image/png');

    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
    var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }

    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
    formdata.append("file", file);	// file data 추가 */
    formdata.append("infoAgreeFinal", "Y");	// file data 추가
    formdata.append("soNo", $('input[name=soNo]').val());	// file data 추가


    if(cpValidate()){
    	if($("#infoAgreeFinal").is(":checked") == true) {
			saveSign(formdata);
   		}else{
			alertBox("위 내용에 대한 확인 여부를<br>체크해주세요","danger");
   	   	}
     }




});

$('#payAtBtn').click(function(){
	payAt();

});

$('#customPayRegContent').on("click", "#signUptBtn", function() {
	$('#ImgBox').addClass('d-none');
	$('#convasContent').removeClass('d-none');
	/* $('#canvas').css("width",($('#convasContent').width()));
	$('#canvas').css("height",($('#convasContent').height())); */

});

$('#customPayRegContent').on("click", ".payAtCancBtn", function() {
	var seq = $(this).parent().parent().find('.seq').val();
	var orderNo =$(this).parent().parent().find('.orderNo').val();

	$('input[name=seq]').val(seq);
	$('input[name=orderNo]').val(orderNo);

	 payAtCancle();

});

$('#customPayRegContent').on("click", ".payAtRcpt", function() {
	var url = 'https://www.payat.co.kr/';
	var uuid = $(this).parent().parent().find('.uuid').val();
	window.open(url+uuid, "PopupWin", "width=500,height=600");

});

$('#customPayRegContent').on("click", "#backBtn", function() {
	clearSign("canvas");


})


$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = 'cp';
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

	var url = 'cr/1';
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

});


var saveSign = function (formdata){

	var request = $.ajax({
		url : './cp/sign',
		type : 'POST',
		dataType : 'json',
		data: formdata, //보낼데이터
		 processData: false,
		 contentType: false,
		success : function(data) {
			alertBox("서명이 저장되었습니다","primary");
		}
		, beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
		});
	};

	var payAt = function (){

  		 $.ajax({
	        type : "post",
	        url : "cp/payAt",
	        dataType : 'json',
	        data: $("#form").serialize(), //보낼데이터
	        success        :    function(data){
	        	if(data.message){
	        		alertBox("결제를 다시 한번 시도해주세요!","danger");
	        	}else{
	        		alertBox("결제가 정상처리되었습니다.","primary");
			    }

	        }
	        , beforeSend: function() {

	        },
	        complete:function(){
	        	payReflesh();
	        }
		});
	};

	var payAtCancle = function (){


 	 	$.ajax({
	        type : "post",
	        url : "cp/payAtCancle",
	        dataType : 'json',
	        data: $("#form").serialize(), //보낼데이터
	        success        :    function(data){
	        	if(data.message){
	        		alertBox("결제취소를 다시 한번 시도해주세요!","danger");
			     }else{
			    	alertBox('결제취소가 정상처리되었습니다.',"primary");
				}
	        }
	        , beforeSend: function() {

	        },
	        complete:function(){
	        	payReflesh();
	        }
		});
	};

	var payReflesh = function (){
	    $.ajax({
	        type:    "post",
	        url : './cp/payList',
	        dataType    :    'json',
	        data: $("#form").serialize(), //보낼데이터
	        success        :    function(data){
	        	$('#payAtList').empty();
	        	var count = $('#payAtList>tr').length;
	        	count++;
	        	var list ='';
	        	console.log(data);

				var num= 0;
	        	if(data.length > 0 ){
	        		for(var i=0; i<data.length; i++){
						var payStatus = data[i].payStatus;
						var buttonVal = "";

						if(data[i].payStatus == "1"){
							payStatus='결제';
							buttonVal =
									'<button type="button"  class="payAtCancBtn btn btn-secondary shadow-sm p-0 " style="width:100px;background-color:#FFE3EE;color:black">'+
									'<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">결제취소</div>'+
									'</button>';
						}else{
							payStatus='취소';
							buttonVal = '취소완료';
						}


						var billAmt = numberWithCommas(data[i].billAmt);

	        			list =
							'<tr>'+
							'	<td class="d-none"><input type="hidden" class="seq"  value="'+data[i].seq+'"> </td>'+
							'	<td class="d-none"><input type="hidden" class="orderNo" value="'+data[i].orderNo+'"> </td>'+
							'	<td class="d-none"><input type="hidden" class="uuid" value="'+data[i].uuid+'"> </td>'+
							'	<td>'+ (++num) +'</td>'+
							'	<td>'+payStatus+'</td>'+
							'	<td>'+billAmt+'</td>'+
							'	<td>'+data[i].insrtDt+'</td>'+
							'	<td>'+buttonVal+'</td>'+
							'	<td>'+
							'		 <button type="button"  class="payAtRcpt btn btn-secondary shadow-sm p-0 " style="width:80px;background-color:#ACF3FF;color:black">'+
							'			<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">영수증</div>'+
							'	   	</button>'+
							'	</td>'+
							'</tr>';

		        		$('#payAtList').append(list);
            		}
	        	}
	        }
	   });
	};

	var signImage = function (sign){
		var data = sign;

		var bytes = new Uint8Array(data.length / 2);':'

		for (var i = 0; i < data.length; i += 2) {
		 bytes[i / 2] = parseInt(data.substring(i, i + 2), /* base = */ 16);
		}

		var blob = new Blob([bytes], {type: 'image/bmp'});

		var image = new Image();
		image.src = URL.createObjectURL(blob);
		/* document.body.appendChild(image); */
		$("#img").attr("src", image.src);

	};

	$(document).ready(function(){
		var sign = '${sign.sign}';
		if(sign){
			 $('#convasContent').addClass('d-none');
			signImage(sign);

		}else{
			$('#ImgBox').addClass('d-none');
		}
	});


	var numberWithCommas = function(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}




</script>
<script src="./js/sign.js"></script>
