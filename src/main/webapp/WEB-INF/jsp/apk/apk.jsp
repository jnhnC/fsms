<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="../br/br001.jsp";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>FSMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1  user-scalable=no" />
<link rel="stylesheet" href="./css/component/swiper-bundle.min.css" />
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css">
<link href="./bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="./css/layout/main.css" rel="stylesheet" >
<link href="./css/layout/main.css" rel="stylesheet" >
<link href="./css/normalize.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="./js/priceComma.js"></script>
<script src="./js/validate.js"></script>

<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="./js/swiper-bundle.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href=images/favicon.ico />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- CSS only -->
<link rel="stylesheet" href="./css/component/loadingbar.css" />

<style>

@font-face {
   font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
    font-weight: normal;
    font-style: normal;
}


</style>


</head>


<body>
	<form id="form" name="form">
		<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
				<a class="btn " href="apk/app-debug.apk" download style="font-size:70pt">FSMS 다운로드</a>
		</div>

	</form>
</body>
<script>


</script>
</html>

