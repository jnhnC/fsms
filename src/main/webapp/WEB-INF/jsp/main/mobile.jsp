<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/contents/mobile.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/icon/bootstrap-icons.css" rel="stylesheet" >
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="/bootstrap/css/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="/bootstrap/js/bootstrap-datepicker.js"></script>


<!--한국어  달력 쓰려면 추가 로드-->
<script src="/bootstrap/js/bootstrap-datepicker.ko.min.js"></script>
<script>
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		div = document.getElementById("myDropdown");
		a = div.getElementsByTagName("a");
		for (i = 0; i < a.length; i++) {
			txtValue = a[i].textContent || a[i].innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
	}


</script>
<style>
@font-face {
	font-family: 'GoyangIlsan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GoyangIlsan.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}


#myInput:focus {
	outline: 3px solid #ddd;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	/* min-width: 230px; */
	width: 100%;
	border: 1px solid #ddd;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.show {
	display: block;
}

</style>
<div id="mobile-wrap">
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


	<div id="mobile-content">

		<div id="mobile-buttonbar" class="">
			<div class="item">
				<i class="bi bi-chevron-left"></i>
			</div>

			<div class="item">
				<div class="dropdown">
					<input type="text" id="myInput" class="drop3btn form-control"
						placeholder="경기본부" onclick="myFunction()"
						onkeyup="filterFunction()"><i class="bi bi-caret-down-fill"></i>
					<div id="myDropdown" class="dropdown-content">
						<a href="#about">본인상</a> <a href="#base">부친상</a>
						<a href="#blog">모친상</a>
					</div>
				</div>
			</div>

			<div class="item">
			<button class="btn btn-secondary shadow-sm">
				 <i class="bi bi-search"></i>

	    	</button>
	    	<button class="btn btn-secondary shadow-sm">
				<!-- <i class="far fa-save"></i> -->
				<div style="font-size: calc(0.26vw + 7.08pt);">저장</div>
	    	</button>


			</div>

		</div>



		<div id="mobile-search" class="">
			<div class="title">
				<div>검색조건</div>
			</div>
			<div class="table-box">
				<table>
					<tbody>
						<tr>
							<td style="border-left: 0px;">
								<div class="datebox">
									<span>주문일자(From)</span>
									<input type="text" class="datePicker" id="startDate" class="form-control" value="">
									<i class="bi bi-calendar-check"></i>
								</div>
							</td>
							<td style="border-right: 0px;">
								<div class="datebox">
									<span>주문일자(To)</span>
									<input type="text" class="datePicker" id="lastDate"	class="form-control" value="">
									<i class="bi bi-calendar-check"></i>
								</div>
							</td>
						</tr>

						<tr>
							<td style="border-left: 0px;">
								<div class="dropdown">
									<input type="text" id="myInput" onclick="myFunction()"class="drop3btn form-control" placeholder="진행상태"
										onkeyup="filterFunction()"><i class="bi bi-caret-down-fill"></i>
									<div id="myDropdown" class="dropdown-content">
										<a href="#about">본인상</a> <a href="#base">부친상</a>
										<a href="#blog">모친상</a>
									</div>
								</div>

							</td>
							<td style="border-right: 0px;"><input type="text"
								class="form-control input-bottom-border" placeholder="대상자" /></td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>


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

<script>
$('.datePicker').datepicker({
    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
   /*  startDate: '-10d', */	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
  /*   endDate: '+10d', */	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
   /*  datesDisabled : ['2019-06-24','2019-06-26'], *///선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
    daysOfWeekHighlighted : [0], //강조 되어야 하는 요일 설정
    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
    templates : {
        leftArrow: '&laquo;',
        rightArrow: '&raquo;'
    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
    title: "",	//캘린더 상단에 보여주는 타이틀
    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false
    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

});//datepicker end

$('#startDate').val(new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString().slice(0, 10))
$('#lastDate').val(new Date().toISOString().slice(0, 10));


</script>