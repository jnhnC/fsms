<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<script src="/js/jquery-3.6.0.min.js">
</script>
</head>
<body>
	<header style="background-color: black; width:100%">
	    <tiles:insertAttribute name="header"/>
	</header>

	<div class="container">
	  <div class="row">
	    <div class="col-4" >
		    <tiles:insertAttribute name="sidebar"/>
	    </div>
	    <div class="col-8" id="content" >
	    	<tiles:insertAttribute name="body"/>
	    </div>
	
	  </div>
	</div>

	<div style="background-color: blue; width:100%">
	    <tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>