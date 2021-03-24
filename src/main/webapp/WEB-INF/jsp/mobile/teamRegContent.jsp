<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/mobile/selectSearch.css" rel="stylesheet">


<link href="/css/mobile/teamRegContent.css" rel="stylesheet">

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="/js/selectSearch.js"></script>

<div id="teamRegSearch">
	<div class="item"> <!--1  -->
		<jsp:include page="header.jsp" flush="false" />
	</div>

	<div class="item"><!--2  -->
		<jsp:include page="buttonbar.jsp" flush="false" />
	</div>

	<div class="item"><!--3  -->
		<div class="dropdown">
			<input type="text" class="drop3btn form-control " placeholder="의전팀장"
				onclick="" onkeyup="filterFunction(this)"	>

			 <i class="down-icon bi bi-caret-down-fill"></i>
			<div  class="dropdown-content">
				<a href="#about">본인상</a>
				<a href="#base">부친상</a>
				<a href="#blog">모친상</a>
			</div>
		</div>
		<!-- <div>
			<button type="button" class="btn btn-primary"><i class="down-icon bi bi-search"></i></button>
		</div> -->
	</div>

	<div class="item"><!--4  -->
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
		     <tr>
		      <td>경조사유</td>
		      <td></td>
		    </tr>
		     <tr>
		      <td>사전상담<br>번호</td>
		      <td></td>
		    </tr>

		  </tbody>
		</table>
	</div>



</div>



