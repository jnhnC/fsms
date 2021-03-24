<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="../mobileIndex.jsp";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/mobile/main.css" rel="stylesheet">
<link href="/css/mobile/sidebar.css" rel="stylesheet" >
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />



<style>
@font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

</style>

</head>
<body>

<div id="mobile-wrapper">
		<div id="mobile-sidebar" >
		안녕
		<%-- 	<jsp:include page="sidebar.jsp" /> --%>
		</div>

	<%-- <div id="mobile-main">
		<header id="header">
			<jsp:include page="header.jsp" />
		</header>

		<div id="mobile-content">
			<jsp:include page="<%=contentPage%>" />
		</div>
	</div> --%>
</div>
</body>

</html>

