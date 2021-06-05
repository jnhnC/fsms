<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./css/component/tableList.css" rel="stylesheet">
<link href="./css/component/selectSearch.css" rel="stylesheet">
<link href="./css/component/buttonbar.css" rel="stylesheet">
<link href="./css/component/nextpage.css" rel="stylesheet">
<link href="./css/component/tableRow.css" rel="stylesheet">

<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="./js/selectSearch.js"></script>

<link href="./css/tm/tm002.css" rel="stylesheet">

<div id="teamRegContent">
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
					<div id="" class="dropdown-input">
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


			<div class="item" style="width:50%;">
			<!-- 	<button class="btn btn-secondary shadow-sm  p-0" >
					 <i class="bi bi-search" style="font-size: calc(0.26vw + 11.6pt); padding:0 14px;"></i>
		  		</button> -->
	  		  	 <button type="button" id="cnclBtn" class=" btn btn-secondary shadow-sm p-0">
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">삭제</div>
			   	</button>

			   	 <button type="button" id="saveBtn" class=" btn btn-primary shadow-sm p-0" >
					<div style="font-size: calc(0.26vw + 8.6pt); padding:4px 14px">저장</div>
			   	</button>
			</div>

		</div>
	</div>

	<div class="item"><!--3  -->
		<div class="dropdown">
			<div class="dropdown-input">
				<input type="text" id="empNmInput" class="drop3btn form-control " placeholder="의전팀장을 선택해주세요"
					onkeyup="filterFunction(this)"	value="${so.bossNm}">
				 <i class="down-icon bi bi-caret-down-fill" style="color:white;"></i>
			</div>
			<div  class="dropdown-content  rounded" style="height:200px;overflow-y:scroll" >
				<c:forEach var="teamLeader" items="${teamLeaders}" varStatus="status">
					<a class="empNm">
						<span class="badge bg-danger">${teamLeader.empNo}</span>
						<span class="select-value">${teamLeader.empNm}</span>
						<span>${teamLeader.roleNm}</span>
						<span>[${teamLeader.subNm}]</span>

						<span class="d-none empNo">${teamLeader.empNo}</span>
						<span class="d-none bpCd">${teamLeader.bpCd}</span>
						<span class="d-none updtUserId">${teamLeader.updtUserId}</span>
					</a>

				</c:forEach>

			</div>
		</div>
		<!-- <div>
			<button type="button" class="btn btn-primary"><i class="down-icon bi bi-search"></i></button>
		</div> -->
	</div>

	<div class="item"><!--4  -->
		<table class="table table-row" style="font-size: calc(0.26vw + 10.08pt);">
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
		      <td class="value">${so.hsNm}</td>
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
		      <td></td>
		    </tr>

		  </tbody>
		</table>
	</div>

	<div class="item"><!--5  -->
		<div class="mobile-result">
			<div class="tablebox">
				<table class="table">
				  	<thead>
						<tr id="header">
							<td></td>
							<td>품목명</td>
							<td>수량</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ex" items="${exs}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td class="text-start ps-5">${ex.itemNm}</td>
							<td>${ex.soQty}</td>
						</tr>
						</c:forEach>
				  </tbody>
				</table>
			</div>
		</div>
	</div>


<!-- 	<div class="item">
		<div id="nextPage">
			<button class="btn btn-primary">
				출고처리페이지로 이동 <i class="bi bi-chevron-right"></i>
			</button>

		</div>
	</div> -->
</div>

<input type="hidden" name="soNo" value='${so.soNo}' >
<input type="hidden" name="empNo" value='${so.empNo}' >
<input type="hidden" name="bpCd" value='${so.bpCd}' >
<input type="hidden" name="updtUserId" value='${so.updtUserId}' >

<script>
$('#menu-nav').html("팀장배정/등록");


$('.empNm').click(function(){

	 $('input[name="empNo"]').val($(this).find('.empNo').html());
	 $('input[name=bpCd]').val($(this).find('.bpCd').html());
	 $('input[name=updtUserId]').val($(this).find('.updtUserId').html());

});


$('#cnclBtn').click(function(){

 	$('#empNmInput').val('');
 	$('input[name="empNo"]').val('');
 	saveDelete();
});

$('#saveBtn').click(function(){

/* 	if(!$('#empNmInput').val()){
		 $('input[name="empNo"]').val('');
		 $('input[name=bpCd]').val('');
		 $('input[name=updtUserId]').val('');

	} */

	var url = './tm';

	 $.ajax({
        type : "post",
        url : url,
        dataType : 'json',
        contentTypee : 'application/json',
        data: $("#form").serialize(), //보낼데이터
        success        :    function(data){
        	alertBox(data.msgText,'primary');

        },
	 	error : function(xhr, textStatus, errorThrown){
	 		alertBox('저장 처리가 늦어지고 있습니다\n다시 시도 부탁드립니다','danger');
        }
        , beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
     });

});





$('#prevPage').click(function(){
	/* alert($(this).children('td:first').html()); */

	var url = './tm';
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



function sendAjax(url, type, dataType){

    $.ajax({
        type        :   type,
        url : url,
        dataType    :    dataType,
        contentType : "application/json; charset=utf-8",
        success        :    function(data){
            alert(data);
        }
	    , beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
       });

}

var saveDelete = function(){
	var url = './tm';

	 $.ajax({
       type : "post",
       url : url,
       dataType : 'json',
       contentTypee : 'application/json',
       data: $("#form").serialize(), //보낼데이터
       success        :    function(data){
       	alertBox(data.msgText,'primary');

       },
	 	error : function(xhr, textStatus, errorThrown){
	 		alertBox('저장 처리가 늦어지고 있습니다\n다시 시도 부탁드립니다','danger');
       },
       	beforeSend: function() {
			$('.loadingbar').css("display","block");
	    },
	    complete:function(){
	     	$('.loadingbar').css("display","none");
	    }
    });

}

</script>



