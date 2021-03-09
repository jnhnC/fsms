<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>

<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<link href="/css/normalize.css" rel="stylesheet">
<link href="/css/contents/login.css" rel="stylesheet">


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


</style>

</head>


<body>
<div class="container">

    <div class="row justify-content-center align-items-center" style="height:100vh">
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 mb-5">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <div class="panel-title"></div>
                </div>
                <div class="panel-body">
                   <input id="login-id" type="text" class="form-control" name="id" placeholder="Username" >
                   <input id="login-pass" type="password" class="form-control" name="pass" placeholder="Password" >
                   <button type="submit" class="form-control btn btn-primary" id="login-btn">로그인</button>
                </div>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>