<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<nav class="nav-side" >
		<div>
			<div class="sidebar-brand">
		      <div class="align-middle">
		      	<img src="/images/icon_logo.png"  width="60" height="50"></span>
		      </div>
		    </div>
		    
		    
		    <div class="sidebar-menu">
			<ul>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-layout-text-sidebar"></i> 그룹메뉴1</span>
	            		<span><i class="bi bi-caret-up-fill"></i></span>
	            	</a>
	            	<ul id="" class="sidebar-dropdown" style="">
						<li class="sub-item"><a class="sidebar-link" onclick="acyncMovePage('/1')">세부메뉴1</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴2</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴3</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴4</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴5</a></li>
					</ul>
	            	
				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-truck"></i>그룹메뉴2</span>
		              	<span><i class="bi bi-caret-up-fill"></i></span>
	            	</a>
	            	<ul id="" class="sidebar-dropdown" style="">
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴1</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴2</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴3</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴4</a></li>
						<li class="sub-item"><a class="sidebar-link" href="#">세부메뉴5</a></li>
					</ul>
	            	
				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-calendar2-fill"></i> 그룹메뉴3</span>
	            	</a>
				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-sliders"></i> 그룹메뉴4</span>
	            	</a>
				</li>
				<li class="sidebar-item">
					<a href="#" class="sidebar-link">
		              	<span class="align-middle"><i class="bi bi-pencil-square"></i> 그룹메뉴5</span>
	            	</a>
				</li>
				
			</ul>
			</div>
		</div>
	</nav>

<script>
function acyncMovePage(url){
    // ajax option
    var ajaxOption = {
            url : url,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        // Contents 영역 삭제
        $('#content').children().remove();
        // Contents 영역 교체
        $('#content').html(data);
    });
}

$('.sidebar-link').click(function(){
	$(this).next('.sidebar-dropdown').toggleClass("hide");
	$(this).children('span:eq(1)').toggleClass("rotate");
});

$('.sidebar-item').click(function(){
 	 $(this).addClass("active").siblings().removeClass("active");  
	
});
 
$('.sub-item').click(function(){
	$('.sub-item').siblings().removeClass("active");
 	$(this).addClass("active");
});




</script>
