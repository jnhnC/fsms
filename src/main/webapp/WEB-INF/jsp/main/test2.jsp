<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/contents/test3.css" rel="stylesheet" >	    
    
<div class="tab-wrapper">
	<!-- tab 영역이다. -->
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" >회사지원내역</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" >상품지원내역</a>
	  </li>
	    <li class="nav-item">
	    <a class="nav-link">고객확인</a>
	  </li>
	</ul>
	<!-- tab-content 영역이다. -->
	<div class="tab-content">
		<div class="content show" id="tab1">
		<table class="table table-bordered border-secondary">
		<thead>
		    <tr>
				<th scope="col"></th>
				<th scope="col">지원품목</th>
				<th scope="col">지원품목내용</th>
				<th scope="col">비고</th>
		    </tr>
	 	</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>특이사항</td>
					<td>200, 350패키지 상담 가능 / 개인행사대상</td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>특이사항</td>
					<td>200, 350패키지 상담 가능 / 개인행사대상</td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2"></td>
					<td></td>
				</tr>
			</tbody>
		</table>
			
		</div>
		<div class="content" id="tab2">Active2</div>
		<div class="content" id="tab3">Active3</div>
	</div>
</div>
<script>
	
	$('.nav-item').click(function(){
		var tabNth = "tab"+Number($(this).index()+1);
		var navLinkNth = $(this).index();
		$(".nav-link").removeClass("active");
	 	$(".nav-tabs").find("li").eq(navLinkNth).find("a").addClass("active"); 
		$("#"+tabNth).toggleClass("show").siblings().removeClass("show");  
	});
</script>



