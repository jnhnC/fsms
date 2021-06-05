<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
<script src="./js/validation.js"></script>

<link href="./css/cr/cr002.css" rel="stylesheet">


<div id="consultResultRegContent" >

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
		<div class="tab-wrapper ms-2">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">장지 등록</a></li>
				<li class="nav-item"><a class="nav-link">장례일정 등록</a></li>
				<!-- <li class="nav-item"><a class="nav-link">알림톡 전송</a></li> -->

			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">

					<div class="item-content  mt-5">

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
													<input type="text" id="mType1" class="drop3btn form-control w-75" placeholder="선택" inputmode="none"

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
													 <i class="bi bi-chevron-down down-icon"></i>
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
													<input type="text" id="mManagerCd" class="drop3btn form-control w-75" placeholder="의전팀장을 선택해주세요"
														onkeyup="filterFunction(this)"	value="${cr.managerNm}">
													 <i class="bi bi-chevron-down down-icon"></i>
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


					</div>
				</div>

				<div class="content" id="tab2">
					<div class="item-content d-flex mt-5">
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


													<div class="ms-3">
														<div class="dropdown justify-content-center">
															<div class="dropdown-input justify-content-center">
																<input type="text" id="dt1H" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.dt1H}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded" >
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
													<div>
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt1M" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.dt1M}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div class="ms-3">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt2H" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.dt2H}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div>
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt2M" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.dt2M}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div class="ms-3">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt3H" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.dt3H}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div>
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="dt3M" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.dt3M}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div class="ms-3">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adBsDtH" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.adBsDtH}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div>
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adBsDtM" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	 style="width:70px;"
																	value="${cr.adBsDtM}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
															name="adYpDt" 	id="suplDate" autocomplete="off" onfocus="this.blur()" inputmode="none" inputmode="none"
														 	value="${cr.adYpDt}"
														 	>
														 <i class="bi bi-calendar-check calendar-icon"></i>
													</div>
													<div class="ms-3">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adYpDtH" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	style="width:70px;"
																	value="${cr.adYpDtH}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div>
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adYpDtM" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	style="width:70px;"
																	value="${cr.adYpDtM}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div class="ms-3">
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adGjDtH" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	style="width:70px;"
																	value="${cr.adGjDtH}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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
													<div>
														<div class="dropdown">
															<div class="dropdown-input justify-content-start">
																<input type="text" id="adGjDtM" class="drop3btn form-control" placeholder="선택" inputmode="none"
																	style="width:70px;"
																	value="${cr.adGjDtM}"
																	>
																 <i class="bi bi-chevron-down down-icon"></i>
															</div>
															<div  class="dropdown-content rounded"  >
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

						<div class="d-flex justify-content-center" >
							<div class="d-flex justify-content-center w-75" >
								<div class="text-center" style="width:40%;">
									<span>패키지 미진행사유</span>
								</div>

								<div style="width:60%;">
									<div class="dropdown">
										<div class="dropdown-input justify-content-start">
											<input type="text" id="noPkgCd" class="drop3btn form-control w-75" placeholder="선택" inputmode="none"
												value="${cr.noPkgNm}"
												>
											 <i class="bi bi-chevron-down down-icon"></i>
										</div>
										<div  class="dropdown-content rounded  w-75" >
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



				<!-- 		<div class="item d-flex justify-content-center">
							<div id="nextPage"  style="position: absolute;bottom: 15px;">
								<button type="button"  class="btn btn-primary nextBtn">
									고객서명페이지로 이동 <i class="bi bi-chevron-right"></i>
								</button>

							</div>
						</div> -->

						<div class="item d-flex justify-content-end">
							<div class="text-end p-3"  style="position: absolute;bottom: 0px;">
								<button type="button" id="reset" class="btn btn-secondary p-1">데이터 초기화</button>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>

</div>

<div>
	<input type="hidden" name="soNo" value="${so.soNo}">
	<input type="hidden" name="mManagerCd" value="${cr.managerCd}">
	<input type="hidden" name="mType1" value="${cr.type}">

	<input type="hidden" name="dt1H" value="${cr.dt1H}">
	<input type="hidden" name="dt2H" value="${cr.dt2H}">
	<input type="hidden" name="dt3H" value="${cr.dt3H}">

	<input type="hidden" name="dt1M" value="${cr.dt1M}">
	<input type="hidden" name="dt2M" value="${cr.dt2M}">
	<input type="hidden" name="dt3M" value="${cr.dt3M}">

	<input type="hidden" name="adBsDtH" value="${cr.adBsDtH}">
	<input type="hidden" name="adYpDtH" value="${cr.adYpDtH}">
	<input type="hidden" name="adGjDtH" value="${cr.adGjDtH}">

	<input type="hidden" name="adBsDtM" value="${cr.adBsDtM}">
	<input type="hidden" name="adYpDtM" value="${cr.adYpDtM}">
	<input type="hidden" name="adGjDtM" value="${cr.adGjDtM}">

	<input type="hidden" name="noPkgCd" value="${cr.noPkgCd}">

	<input type="hidden" name="adType" value="${so.adType}">
	<input type="hidden" name="soldToParty" value="${so.soldToParty}">
	<input type="hidden" name="itemCd" value="${so.itemCd}">


</div>


<script>
$('#menu-nav').html("상담결과등록/등록")

$('input[name=mRoomYn]').click(function(){
	$('input[name=mRoomYn]').prop("checked", false);
	$(this).prop("checked", true);
});


$('.empNm').click(function(){
	$('input[name="mManagerCd"]').val($(this).find('.mManagerCd').html());
});

$('.mType1Nm').click(function(){
	$('input[name="mType1"]').val($(this).find('.mType1').html());
});


$('.dt1HBox').click(function(){
	$('input[name="dt1H"]').val($(this).find('.dt1H').html());
});
$('.dt2HBox').click(function(){
	$('input[name="dt2H"]').val($(this).find('.dt2H').html());
});
$('.dt3HBox').click(function(){
	$('input[name="dt3H"]').val($(this).find('.dt3H').html());
});
$('.adBsDtHBox').click(function(){
	$('input[name="adBsDtH"]').val($(this).find('.adBsDtH').html());
});
$('.adYpDtHBox').click(function(){
	$('input[name="adYpDtH"]').val($(this).find('.adYpDtH').html());
});
$('.adGjDtHBox').click(function(){
	$('input[name="adGjDtH"]').val($(this).find('.adGjDtH').html());
});



$('.dt1MBox').click(function(){
	$('input[name="dt1M"]').val($(this).find('.dt1M').html());
});
$('.dt2MBox').click(function(){
	$('input[name="dt2M"]').val($(this).find('.dt2M').html());
});
$('.dt3MBox').click(function(){
	$('input[name="dt3M"]').val($(this).find('.dt3M').html());
});
$('.adBsDtMBox').click(function(){
	$('input[name="adBsDtM"]').val($(this).find('.adBsDtM').html());
});
$('.adYpDtMBox').click(function(){
	$('input[name="adYpDtM"]').val($(this).find('.adYpDtM').html());
});
$('.adGjDtMBox').click(function(){
	$('input[name="adGjDtM"]').val($(this).find('.adGjDtM').html());
});

$('.noPkgCdBox').click(function(){
	$('input[name="noPkgCd"]').val($(this).find('.noPkgCd').html());
});


$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});

$('.today').val(new Date().toISOString().slice(0, 10));

$('#reset').click(function(){

	var result = confirm('데이터를 초기화 하시겠습니까?');
		if (result) {
			$('input').val('');
			$('option').removeAttr('selected');
			$('select').find('option:first').attr('selected', 'selected');
		}
	alertBox("초기화 되었습니다.<br>저장을 누르시면 초기화 상태로 저장됩니다.","warning");
});

$('#searchBtn').click(function() {
	refreshPage();

});

$('#saveBtn').click(function() {

	if(cpValidate()){
		saveCustomResult();
	}

});


$('#prevPage').click(function() {

	var url = './cr';
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

	$('.nextBtn').click(function() {

		var url = 'cp';
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


	var saveCustomResult = function() {

		$.ajax({
			type : "post",
			url : "./cr/",
			dataType : 'json',
			data : $("#form").serialize(), //보낼데이터
			success : function(data) {
				/* 	refreshPage(); */
				alertBox('저장되었습니다.','primary');
			}
			, beforeSend: function() {
				$('.loadingbar').css("display","block");
		    },
		    complete:function(){
		     	$('.loadingbar').css("display","none");
		    }
		});
	};


	var refreshPage = function() {

		var url = 'cr/1';
		$.ajax({
			type : "post",
			url : url,
			dataType : 'html',
			data : $("#form").serialize(), //보낼데이터
			success : function(data) {
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



	var fnMove = function(name) {
		var idName = '#' + name;
		var offset = $(idName).offset();
		$('#consultResultRegContent').animate({
			scrollTop : offset.top + 200
		}, 400);
	}
</script>