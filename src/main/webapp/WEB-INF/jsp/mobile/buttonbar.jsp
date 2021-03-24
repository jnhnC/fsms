<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/mobile/buttonbar.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>

<div id="mobile-buttonbar" class="">
	<div class="item">
		<i class="bi bi-chevron-left"></i>
	</div>

	<div class="item">
		<div class="dropdown">
			<input type="text" id="" class="drop3btn form-control " placeholder="경기본부"
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
		<button class="btn btn-secondary shadow-sm  pt-1" >
			 <i class="bi bi-search"></i>

	   	</button>
	   	<button class="btn btn-secondary shadow-sm pt-1">
			<!-- <i class="far fa-save"></i> -->
			<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
	   	</button>


	</div>

</div>

