<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="/css/normalize.css" rel="stylesheet">
<link href="/css/layout/main.css" rel="stylesheet" >
<link href="/css/layout/header.css" rel="stylesheet" >
<link href="/css/layout/sidebar.css" rel="stylesheet" >

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

<style>
@font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GoyangIlsan', sans-serif;
}

</style>

</head>


<body>
<div id="wrapper" >
	<label for="menuicon">
		<div id="sidebar">
		  <tiles:insertAttribute name="sidebar"/>
		</div>
	</label>
	<div id="main">
		<header style="background-color: black; width:100%">
		    <tiles:insertAttribute name="header"/>
		</header>
	
		<div id="content" >
		 	<tiles:insertAttribute name="body"/>
		</div>
	
	<%-- 	<div style="background-color: blue; width:100%">
		    <tiles:insertAttribute name="footer"/>
		</div> --%>
	</div>
</div>
	
</body>
</html>