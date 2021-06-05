/**
 *
 */

$(function(){

	$('#wrapper').on('click', '.drop3btn', function(){
	/*$('.drop3btn').click(function(){*/
		$('.dropdown-content').removeClass('show');
	 	$(this).parent().siblings('.dropdown-content').addClass('show');
	});

	$('#wrapper').on('click', '.down-icon', function(){
	/*$('.down-icon').click(function(){*/
		$('.dropdown-content').removeClass('show');
	 	$(this).parent().siblings('.dropdown-content').addClass('show');
	});

	$('#wrapper').click(function(e){
		if (!$(e.target).hasClass("drop3btn") && !$(e.target).hasClass("down-icon")) {
			if($('.dropdown-content').hasClass("show")){
				 $('.dropdown-content').removeClass("show");
			}
	   	}

	});

	$('#wrapper').on('click', '.dropdown-content a', function(){
	/*$('.dropdown-content a').click(function(){*/
		var check  = $(this).find('.select-value').html();
		if(typeof check == "undefined" || check == "" || check == null){
			$(this).closest('.dropdown-content').siblings('.dropdown-input').children('.drop3btn').val($(this).html());

		}else{
			$(this).closest('.dropdown-content').siblings('.dropdown-input').children('.drop3btn').val($(this).find('.select-value').html());

		}
		/*alert($(this).closest('.dropdown-content').siblings('.dropdown-input').html());*/
	});


});


function filterFunction(e) {
	var input, filter, ul, li, a, i;
	input = e;
	filter = input.value;
	div =input.parentNode.nextSibling.nextSibling;
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

function filterFunctionJs(e) {
	var input, filter, ul, li, a, i;
	input = e;
	filter = input.value;
	div =input.parentNode.nextSibling;
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
