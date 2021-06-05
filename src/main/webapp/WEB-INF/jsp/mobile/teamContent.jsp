<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="/js/selectSearch.js"></script>

<div id="teamContent">
	<div class="item"> <!--1  -->
		<jsp:include page="teamSearchContent.jsp" />
	</div>

	<div class="item"><!--2  -->
		<jsp:include page="teamRegContent.jsp" />
	</div>
</div>



