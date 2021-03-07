<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="navbar navbar-expand navbar-light navbar-bg">
		<div class="header-wrap">
			<div id="menuicon" onClick="activeMenu();">
				<i class="bi bi-list h2"></i>
			</div>
			<div>
					2				
			</div>
			<div style="text-align:right;">
				3
			</div>
		</div>
		
	</nav>
	
	
<script>
	activemenu = 0;
	function activeMenu(){
		if(activemenu == 0){
			$("#sidebar>nav>div").css("display","none");
			$("#sidebar").css("width","0");
			activemenu = 1;
		}else{
			$("#sidebar>nav>div").css("display","");
			$("#sidebar").css("width","200px");
			activemenu = 0;
		}
	
	}
</script>	
	
	