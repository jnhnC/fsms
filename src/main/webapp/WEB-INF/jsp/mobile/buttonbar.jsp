<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/mobile/buttonbar.css" rel="stylesheet">
<link href="/css/mobile/selectSearch.css" rel="stylesheet">
<script src="/js/selectSearch.js"></script>

<div id="mobile-buttonbar" >
	<div class="item" >
		<i class="bi bi-chevron-left"></i>
	</div>

	<div class="item">
		<div class="dropdown">
			<input type="text" class="drop3btn form-control " placeholder="경기본부"
				onclick="" onkeyup="filterFunction(this)">
			<i class="down-icon bi bi-caret-down-fill"></i>
			<div id="" class="dropdown-content">
				<a href="#about">본인상</a>
				<a href="#base">부친상</a>
				<a href="#blog">모친상</a>
			</div>
		</div>
	</div>


	<div class="item">
		<button class="btn btn-secondary shadow-sm  pt-1" style="font-size: calc(0.26vw + 7.6pt);">
					 <i class="bi bi-search" style="font-size: calc(0.26vw + 6.6pt);"></i>
	   	</button>
	   	<button class="btn btn-secondary shadow-sm pt-1">
			<!-- <i class="far fa-save"></i> -->
			<div style="font-size: calc(0.26vw + 7.6pt);">저장</div>
	   	</button>


	</div>

</div>

<script>
$('.item:nth-child(1)').click(function(){

	/* var url = window.history.back(); */
	var url = '/mobile/teamSearchContent';
    $.ajax({
        type        :    "get",
        url : url,
        dataType    :    'html',
        success        :    function(data){
            $("#content").children().remove();
            $("#content").html(data);

            // 접속 URL만 페이지 변환없이 변경
            // IE 10 이상이서만 지원...
          /*   history.pushState({"html":data},'',currentMenuUrl) */
        }
        , beforeSend: function() {

        },
        complete:function(){
        }
       });
});

</script>
