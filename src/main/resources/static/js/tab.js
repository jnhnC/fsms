/**
 *
 */
$(function(){
	$('.nav-item').click(function() {

		var tabNth = "tab" + Number($(this).index() + 1);
		if($('#'+tabNth).hasClass("show") === false) {
			var navLinkNth = $(this).index();

			$("#" + tabNth).siblings().removeClass("show");
			$("#" + tabNth).toggleClass("show");
			$(".nav-link").removeClass("active");

			$(".nav-tabs").find("li").eq(navLinkNth).find("a").addClass("active");
		}


	});


});

var tabChange = function(tab){
		var tabNth = "tab" + tab;
		if($('#'+tabNth).hasClass("show") === false) {
			var navLinkNth = $(this).index();

			$("#" + tabNth).siblings().removeClass("show");
			$("#" + tabNth).toggleClass("show");
			$(".nav-link").removeClass("active");

			$(".nav-tabs").find("li").eq(navLinkNth).find("a").addClass("active");
		}
	}
