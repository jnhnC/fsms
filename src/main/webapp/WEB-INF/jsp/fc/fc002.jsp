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

<link href="./css/fc/fc002.css" rel="stylesheet">


<div id="finalCheckRegContent" >

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

			</div>

		</div>

	</div>

	<div class="item"><!--3  -->

	</div>

	<div class="item"><!--4  -->

	</div>

	<div class="item mt-3"><!--5  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs ps-3">
				<li class="nav-item"><a class="nav-link active">주문/상품현황</a></li>
				<li class="nav-item"><a class="nav-link">장지/장례일정</a></li>
				<li class="nav-item"><a class="nav-link">관리사현황</a></li>
				<li class="nav-item"><a class="nav-link">사진정보</a></li>
				<li class="nav-item"><a class="nav-link">본부장확인</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content mt-2">
				<div class="content show" id="tab1">
					<div class="item mt-3">
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
					<div class="item">
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
					<div class="table-content mx-2">
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
													  <i class='down-icon bi bi-chevron-down'></i>
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
													  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
																  <i class='down-icon bi bi-chevron-down'></i>
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
											  <i class='down-icon bi bi-chevron-down'></i>
										</div>
										<div  class="dropdown-content rounded" style="width:300px;height:300px;overflow:scroll" >
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
				</div>
				<div class="content" id="tab3">
					<div class="tab-content mt-3 mx-2">
						<div class="mobile-result">
							<div class="tablebox">
								<table class="table">
								<thead>
									<tr id="header">
										<td class="d-none"></td>
										<td class="d-none"></td>
										<td style="width:50px;"></td>
										<td style="width:100px;">관리사명</td>
										<td style="width:80px;">구분</td>
										<td style="width:80px;">출근일</td>
										<td style="width:80px;">출근(시)</td>
										<td style="width:80px;">출근(분)</td>
										<td style="width:80px;">퇴근일</td>
										<td style="width:80px;">퇴근(시)</td>
										<td style="width:80px;">퇴근(분)</td>
										<td style="width:80px;">근무시간</td>
									</tr>
								</thead>
								<tbody id="workSchedule">
									 <c:forEach var="ws" items="${wss}" varStatus="status">
										<tr>
											<td class="d-none"><input type='hidden' class='status' name='status' value='U'> </td>
											<td class="d-none"><input type='hidden' class='actSeq' name='actSeq' value='${ws.actSeq}'> </td>

											<td>${status.count }</td>
											<td>
												 <input type="hidden" name="actCd" value="${ws.actCd}">
												${ws.actNm}
											</td>
											<td>
												<div class='dropdown'>
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
											<td style='width:110px;'>
												<div class='datebox'>
													<div class='datePickerbox d-flex'>
														<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'
														name='actDtIn'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' value="${ws.actDtIn}" style='width:100px;' >
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
											<td>
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
											<td style='width:110px;'>

												<div class='datebox'>
													<div class='datePickerbox d-flex'>
														<input type='text' class='datePicker form-control p-0 px-1 text-center' onclick='javascript:f_datepicker(this);'
														name='actDtOut'  autocomplete='off'  onfocus='this.blur()'  inputmode='none' value="${ws.actDtOut}" style='width:100px;'>
													</div>
												</div>
											</td>
											<td>

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
											<td>

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
											<td style='width:100px;'>
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
				<div class="content" id="tab4">
					<div class="table-content d-flex justify-content-around">
						<div class="mobile-result m-2" style="width:45%">

							<div class="title d-flex">
								<div class="px-2 flex-grow-1 bd-highlight">사진등록</div>
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
													<select class="form-select form-select-sm xs005"  name="xs005"  aria-label=".form-select-sm example">
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
							<div>
								<img id="preview" style="width:100%">

							</div>

						</div>
					</div>
				</div>
				<div class="content" id="tab5">
					<div class="table-content d-flex align-items-center justify-content-center" style="height:200px;">
						<div class="">
							최종점검
						</div>
						<div class="datebox d-flex ">
							<div class="datePickerbox d-flex align-items-center mx-1">
								<input type="text" name="dt" class="datePicker form-control py-0 mx-1 text-right w-75"
									autocomplete="off" id="dt"	onfocus="this.blur()" inputmode="none"
									value="${fc.chDt}"
									>
								<i class="bi bi-calendar-check calendar-icon"></i>
							</div>

							<div class="mx-1">
					<%-- 			<select class="form-select py-0" id="dtH" name="dtH" aria-label="Default select example  w-75">
									<option value='' selected>시</option>
							 		<c:forEach var="i"  begin="0" end="23">
							 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
								        <option <c:if test="${fc.chDtH eq hh}">selected</c:if> value="${hh}">
								        	${hh}
								        </option>
								    </c:forEach>
								</select> --%>
								<div class="dropdown">
									<div class="dropdown-input justify-content-start">
										<input type="text" id="dtHInput" class="drop3btn form-control" placeholder="선택"
											onkeyup="filterFunction(this)" style="width:70px;"
											value="${fc.chDtH}"
											>
										  <i class='down-icon bi bi-chevron-down'></i>
									</div>
									<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
										<input type="hidden" name="dtH" value="${fc.chDtH}">
										<c:forEach var="i"  begin="0" end="23">
							 			<c:set var="hh" value="${i>9?i:'0'}${i>9?'':i}" />
											<a class="dtHBox">
												<span class="d-none dtH">${hh}</span>
												<span class="select-value">${hh}</span>
											</a>
										  </c:forEach>
									</div>
								</div>


							</div>
							<div class="mx-1">
				<%-- 				<select class="form-select py-0" id="dtM" name="dtM" aria-label="Default select example w-75">
									<option value='' selected>분</option>
								    <c:forEach var="i"  begin="0" end="60" step="10">
								    	<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
								        <option <c:if test="${fc.chDtM eq mm}">selected</c:if> value="${mm}">
								        	${mm}
								        </option>
								    </c:forEach>
								</select> --%>
								<div class="dropdown">
									<div class="dropdown-input justify-content-start">
										<input type="text" id="dtMInput" class="drop3btn form-control" placeholder="선택"
											onkeyup="filterFunction(this)" style="width:70px;"
											value="${fc.chDtM}"
											>
										  <i class='down-icon bi bi-chevron-down'></i>
									</div>
									<div  class="dropdown-content rounded" style="height:300px;overflow:scroll" >
										<input type="hidden" name="dtM" value="${fc.chDtM}">
										<c:forEach var="i"  begin="0" end="60" step="10">
							 			<c:set var="mm" value="${i>9?i:'0'}${i>9?'':i}" />
											<a class="dtMBox">
												<span class="d-none dtM">${mm}</span>
												<span class="select-value">${mm}</span>
											</a>
										  </c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="">
							<button type="button" class="btn btn-primary btn-sm" id="comp">확정</button>
							<button type="button" class="btn btn-secondary btn-sm" id="canc">취소</button>
						</div>
					</div>
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
	<input type="hidden" name="soldToParty" value="${so.soldToParty}">
	<input type="hidden" name="hsType" value="${so.hsType}">
	<input type="hidden" name="adType" value="${so.adType}">
	<input type="hidden" name="itemCd" value="${so.itemCd}">

</div>
<script>
$('#menu-nav').html("최종점검/등록")

$('#convasContent').css('width',$('#tab3 .item:nth-child(2)').width()/2);
$('#convasContent').css('height',$('#tab3 .item:nth-child(2)').width()/4);



$('#finalCheckRegContent').on("click", ".dtHBox", function() {
	$(this).parent().find('input[name="dtH"]').val($(this).find('.dtH').html());
});
$('#finalCheckRegContent').on("click", ".dtMBox", function() {
	$(this).parent().find('input[name="dtM"]').val($(this).find('.dtM').html());
});


$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$('#comp').click(function(){
	var dt = $('#dt').val();
	var dtH = $('#dtH').val();
	var dtM = $('#dtM').val();


	if(dt !=''  && dtH !='' && dtM !=''){
		saveFc();
	}else{
		alertBox("최종점검일을 모두 선택 해주세요. ","danger");
	}


});

$('#canc').click(function(){
	saveFc();

});

$('#finalCheckRegContent').on("click", ".picViewBtn", function() {
	var src = 'http://www.ehyunjin.com/web/' + $(this).parent().parent().find('.filePath').val();
	$('#preview').attr("src",src);


});



$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = './fc';
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

var saveFc = function (){

	$.ajax({
        type : "post",
        url : "fc/",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
       /*  	refreshPage(); */
            alertBox("저장이 완료되었습니다.","primary");
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

	var url = 'fc';
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



</script>