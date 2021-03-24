/**
 *
 */

$(function(){
	$('.drop3btn').click(function(){
		$('.dropdown-content').removeClass('show');
	 	$(this).siblings('.dropdown-content').addClass('show');
	});

	$(document).click(function(e){
		if (!$(e.target).hasClass("drop3btn")) {
			if($('.dropdown-content').hasClass("show")){
				 $('.dropdown-content').removeClass("show");
			}
	   	}

	});

	$('.dropdown-content a').click(function(){
		$(this).closest('.dropdown-content').siblings('.drop3btn').val($(this).html());
	});


});


function filterFunction(e) {
	var input, filter, ul, li, a, i;
	input = e;
	filter = input.value.toUpperCase();
	div = input.nextSibling.nextSibling.nextSibling.nextSibling;
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
