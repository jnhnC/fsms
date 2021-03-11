<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="../main/index.jsp";
%>

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

@font-face {
    font-family: 'BMEuljiro10yearslater';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/BMEuljiro10yearslater.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>

</head>


<body>
<div id="wrapper" >
	<label for="menuicon">
		<div id="sidebar">
		  <jsp:include page="sidebar.jsp" />
		</div>
	</label>
	<div id="main">
		<header id="header" >
	       <jsp:include page="header.jsp" />
		</header>
	
		<div id="content" >
			 <jsp:include page="<%=contentPage%>" />
			</div>
		</div>
	
	<%-- 	<div style="background-color: blue; width:100%">
		    <tiles:insertAttribute name="footer"/>
		</div> --%>
	</div>
</div>
	
</body>
</html>