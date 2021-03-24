<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<div id="exSearchContent">

	<div class="item"> <!--1  -->
		<jsp:include page="header.jsp" flush="false" />
	</div>

	<div class="item"><!--2  -->
		<jsp:include page="buttonbar.jsp" flush="false" />
	</div>

	<div class="item"><!--2  -->
		<jsp:include page="search.jsp" flush="false" />
	</div>

	<div class="item"><!--2  -->
		<div id="mobile-result" class="">

	<div class="tablebox">
		<table class="table">
		  <thead>
		  	<tr id="header">
		      <td></td>
		      <td>상태<br>탁송</td>
		      <td>주문일시<br>고객사</td>
		      <td>대상자<br>의전팀장</td>
		      <td></td>
          </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th>1</th>
		      <td>배정완료</td>
		      <td>2021-03-03 17:00<br>제일병원</td>
		      <td>테스트<br>한재호</td>
		      <td>부친<br>삼성</td>
		    </tr>
		     <tr>
		      <th>2</th>
		      <td>배정완료</td>
		      <td>2021-03-03 17:00<br>제일병원</td>
		      <td>테스트<br>이수환</td>
		       <td>부친<br>삼성</td>
		    </tr>
		  </tbody>
		</table>

	</div>

</div>
	</div>



</div>