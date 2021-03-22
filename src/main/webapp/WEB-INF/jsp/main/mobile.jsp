<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/contents/mobile.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >


<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

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

<div id="mobile-content">
	<div id="mobile-header">
		<div class="item">
			<i class="bi bi-list"></i>
		</div>
		<div class="item">
			팀장배정/등록
		</div>
		<div class="item">
			홍길동
		</div>
	</div>


	<div id="mobile-buttonbar">
		<div class="item">
			<i class="bi bi-chevron-compact-left"></i>
		</div>

		<div class="item">
			경기본부
		</div>

		<div class="item">

			<button type="button" class="btn btn-primary">검색</button>
			<button type="button" class="btn btn-primary">저장</button>

		</div>

	</div>


	<div id="mobile-search">
		<div>
			검색조건
		</div>
		<div class="itemWrap">
			<div class="item">
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control">
				<div class="input-group-addon">
					<span class="glyphicon glyphicon-th"></span>
				</div>
			</div>

		</div>

			<div class="item">
				<div class="input-group date" data-provide="datepicker">
					<input type="text" class="form-control">
					<div class="input-group-addon">
						<span class="glyphicon glyphicon-th"></span>
					</div>
				</div>

			</div>
		</div>


		<div class="itemWrap">
			<div class="item">
			<div class="input-group date" data-provide="datepicker">
				<input type="text" />
			</div>

		</div>

			<div class="item">
				<div class="input-group date" data-provide="datepicker">
					<input type="text" />
				</div>

			</div>
		</div>


	</div>


	<div id="mobile-result">
		<div>
			검색결과
		</div>

			<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>


	</div>
</div>

<script type="text/javascript">
$(function() {
	  $('#datetimepicker1').datetimepicker();
	   $('#datetimepicker3').datetimepicker({
           format: 'LT'
       });

});

      </script>

