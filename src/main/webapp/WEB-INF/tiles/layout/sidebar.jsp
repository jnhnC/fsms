<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="" style="font-size:6pt">
	<ul>
		<li ><a href="#" onClick="switchContent('/1');">테스트1</a></li>
		<li ><a href="#" onClick="switchContent('/2');">테스트2</a></li>
		<li ><a href="#" onClick="switchContent('/3');">테스트3</a></li>
		<li ><a href="#" onClick="switchContent('/4');">테스트4</a></li>
		<li ><a href="#" onClick="switchContent('/5');">테스트5</a></li>
	</ul>
</div>
<div>
</div>

<script>
	function switchContent(bodyName){
	    $('#content').children().remove();
	    $('#content').load(bodyName);
	}
</script>
