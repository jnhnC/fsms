<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/search.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/tab.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">

<script src="./js/selectSearch.js"></script>
<script src="./js/tab.js"></script>

<link href="./css/pd/pd001.css" rel="stylesheet">


<div id="productSearchContent" >

	<div class="item"> <!--1  -->
		<%-- <jsp:include page="header.jsp" flush="false" /> --%>
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-buttonbar" >
			<div class="item" >
				<!-- <i class="bi bi-chevron-left"></i> -->
			</div>

			<div class="item">
				<div class="dropdown">
					<div class="dropdown-input">
						<input type="text" class="drop3btn form-control " placeholder="경기본부"
							onclick="" onkeyup="filterFunction(this)">
						<i class="down-icon bi bi-caret-down-fill"></i>
					</div>
					<!-- <div id="" class="dropdown-content">
						<a href="#about">본인상</a>
						<a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div> -->
				</div>
			</div>


			<div class="item">
				<!-- <button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
							 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
			   	</button>
			   	<button class="btn btn-secondary shadow-sm pt-1">
					<i class="far fa-save"></i>
					<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
			   	</button>
 -->

			</div>

		</div>

	</div>

	<div class="item"><!--3  -->
		<div id="mobile-search" class="">
			<div class="title">
				<div>검색조건</div>
				<div class="hideButton"><i class="bi bi-caret-up-fill"></i></div>
			</div>
			<div class="table-box">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="border-left: 0px;">
								<div class="dropbox">
									<div class="table-title">
										<span>고객사</span>
									</div>
									<div class="dropdown">
									<div class="dropdown-input">
										<input type="text" id="" class="drop3btn form-control " placeholder="고객사"
											onclick="" onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div id="" class="dropdown-content">
										<a href="#about">본인상</a>
										<a href="#base">부친상</a>
										<a href="#blog">모친상</a>
									</div>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td style="border-left: 0px;">
							<div class="dropbox">
								<div class="table-title">
									<span>경조사유</span>
								</div>
								<div class="dropdown">
								<div class="dropdown-input">
									<input type="text" id="" class="drop3btn form-control " placeholder="경조사유"
										onclick="" onkeyup="filterFunction(this)">
									<i class="down-icon bi bi-caret-down-fill"></i>
								</div>
								<div id="" class="dropdown-content">
									<a href="#about">본인상</a>
									<a href="#base">부친상</a>
									<a href="#blog">모친상</a>
								</div>
								</div>
							</div>


							</td>
							<td style="border-right: 0px;">
								<div class="dropbox">
									<div class="table-title">
										<span>품목</span>
									</div>
									<div class="dropdown">
									<div class="dropdown-input">
										<input type="text" id="" class="drop3btn form-control " placeholder="품목"
											onclick="" onkeyup="filterFunction(this)">
										<i class="down-icon bi bi-caret-down-fill"></i>
									</div>
									<div id="" class="dropdown-content">
										<a href="#about">본인상</a>
										<a href="#base">부친상</a>
										<a href="#blog">모친상</a>
									</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<div class="item"><!--4  -->

		<table class="table" style="font-size: calc(0.26vw + 10.08pt);">
		  <tbody>
		    <tr>
		      <td class="title">상품금액</td>
		      <td class="value"><fmt:formatNumber value="${prices[0].listPrice}" groupingUsed="true"/></td>
	          <td class="title">행사차감액</td>
		      <td class="value"><fmt:formatNumber value="${prices[1].listPrice}" groupingUsed="true"/></td>
		    </tr>
		     <tr>
		      <td class="title">개인부담금</td>
	      <td colspan="3" class="value"> <fmt:formatNumber value="${prices[2].listPrice}" groupingUsed="true"/></td>

		    </tr>

		  </tbody>
		</table>
	</div>

	<div class="item"><!--5  -->
		<!--5  -->
		<div class="tab-wrapper">
			<!-- tab 영역이다. -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active">고객사지원내역</a></li>
				<li class="nav-item"><a class="nav-link">상품지역내역</a></li>
			</ul>
			<!-- tab-content 영역이다. -->
			<div class="tab-content">
				<div class="content show" id="tab1">
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
								<tbody>

									<c:forEach var="pakage" items="${pakages}" varStatus="status">
									<tr>
										<td style="display:none;"><input type="hidden" class="pakage" value="${pakage}"></td>
										<td width="5" >${status.count}</td>
										<td width="30">${pakage.minorNm}</td>
										<td width="70">${pakage.colDesc}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content" id="tab2">
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
								<tbody>
									<c:forEach var="custSupprt" items="${custSupprts}" varStatus="status">
									<tr>
										<td style="display:none;"><input type="hidden" class="custSupprt" value="${custSupprt}"></td>
										<td width="5" >${status.count}</td>
										<td width="30">${custSupprt.colDesc}</td>
										<td width="70">${custSupprt.colHead}</td>
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
<script>
$('#menu-nav').html("상품조회")

$('#mobile-search>.title').click(function(){
	$(this).next('.table-box').slideToggle(100);
 	$('.hideButton i').toggleClass("rotate");
});


$(document).on('click', '.tablebox tbody tr', function(){
	/* alert($(this).children('td:first').html()); */
	 var soNo = $(this).find(".soNo").val();
	$('input[name="soNo"]').val(soNo);

	var url = '/cp/1';
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

        },
        complete:function(){
        }
       });

});


var soInfos = function (){

	$.ajax({
        type : "get",
        url : "/api/ad",
        dataType : 'json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
           	$('#soInfoList').empty();
           	var list;

           	if(data.length > 0 ){

				$(data).each(function(i, e) {
					list += "<tr class='so-info'>"+
					"<td style='display:none;'><input type='hidden' class='soNo' value='"+e.soNo+"'></td>"+
					"<td>"+ (++i) +"</td>"+
					"<td>"+e.poStatusNm+"</td>"+
					"<td>"+e.orderDt+"</td>"+
					"<td>"+e.hsNm+"</td>"+
					"<td>"+e.ownNm+"</td>"+
					"<td class='text-start px-3'>"+e.adNm+"</td>"+
					"<td class='poBpCd d-none'>"+e.poBpCd+"</td>"+
					"<td class='itemCd d-none'>"+e.itemCd+"</td>"+
					"<td class='hsType d-none'>"+e.hsType+"</td>"+
					"<td class='hsCode d-none'>"+e.hsCode+"</td>"+
					"<td class='orderDt1 d-none'>"+e.orderDt1+"</td>"+
					"</tr>";
			 	});

			}else{

				list = '<td colspan="5">등록된 데이터가 없습니다</td>';
			}
			$('#soInfoList').html(list);
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
	});
};


</script>
