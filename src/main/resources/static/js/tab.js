/**
 *
 */
$(function(){
	$('.nav-item').click(function() {
		var tabNth = "tab" + Number($(this).index() + 1);
		var navLinkNth = $(this).index();
		$(".nav-link").removeClass("active");
		$(".nav-tabs").find("li").eq(navLinkNth).find("a").addClass("active");
		$("#" + tabNth).toggleClass("show").siblings().removeClass("show");
	});

});
