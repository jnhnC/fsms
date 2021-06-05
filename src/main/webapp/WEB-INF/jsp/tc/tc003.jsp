<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css">
<link href="../bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="../css/layout/main.css" rel="stylesheet" >
<link href="../css/normalize.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<link href="../css/component/tableList.css" rel="stylesheet">
<link href="../css/component/tab.css" rel="stylesheet">
<link href="../css/component/buttonbar.css" rel="stylesheet">
<link href="../css/component/nextpage.css" rel="stylesheet">
<link href="../css/component/tableRow.css" rel="stylesheet">

<script src="../bootstrap/js/jquery-3.6.0.min.js"></script>
<link href="../css/tc/tc003.css" rel="stylesheet">

</head>
<body>
	<form id="form" name="form">
		<div id="tcRegContent" class="mx-2 mt-3" style="width:95%;height:100%; overflow-y:auto;">
			<div class="item">
				<div>
					<div>
						<div>
							<div class="my-2">
								<select id="item1" class="form-select py-0 "
									aria-label="Default select example">
									<option value="">선택</option>
									<c:forEach var="item" items="${items}" varStatus="status">
										<option value="${item.itemCd}">${item.itemNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
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



		<input type="hidden" name="soNo" value="${so.soNo}">
		<input type="hidden" name="soldToParty" value="${so.soldToParty}">
		<input type="hidden" name="hsType" value="${so.hsType}">
		<input type="hidden" name="pakage" value="${so.adPackItem}">
		<input type="hidden" name="subs" value="${so.adChItem}">
		<input type="hidden" name="itemCd" value="">
	</form>
</body>






<script>


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

	});



	var getSelSupports = function (item){
		var itemId = "#"+item+"List";



		$.ajax({
	        type : "post",
	        url : "../api/ps/selSupports",
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

	        },
	        complete:function(){
	        }
		});
	};
</script>


