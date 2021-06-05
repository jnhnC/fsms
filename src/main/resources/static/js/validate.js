/**
 *
 */

var cpValidate = function() {
	var flag = true;

	if($('#dieDate').val() == '' || $('#dt1H').val() == ''|| $('#dt1M').val() == ''){

		if($('#dieDate').val() == '' && $('#dt1H').val() == ''&& $('#dt1M').val() == ''){
			flag == true;
		}else{
			flag = false;
			alertBox("별세일시를 등록해주세요","warning");
		}
	}else if($('#immiDate').val() == '' || $('#dt2H').val() == ''|| $('#dt2M').val() == ''){

		if($('#immiDate').val() == '' && $('#dt2H').val() == ''&& $('#dt2M').val() == ''){
			flag = true;

		}else{
			flag = false;
			alertBox("입관일시를 등록해주세요","warning");
		}

	}else if($('#imprDate').val() == '' || $('#dt3H').val() == ''|| $('#dt3M').val() == ''){

		if($('#imprDate').val() == '' && $('#dt3H').val() == '' && $('#dt3M').val() == ''){
			flag = true;
		}else{
			flag = false;
			alertBox("발인일시를 등록해주세요","warning");
		}

	}else if($('#murDate').val() == '' || $('#adBsDtH').val() == ''|| $('#adBsDtM').val() == ''){

		if($('#murDate').val() == '' && $('#adBsDtH').val() == ''&& $('#adBsDtM').val() == ''){
			flag = true;
		}else{
			flag = false;
			alertBox("빈소도착일를 등록해주세요","warning");
		}

	}else if($('#adYpDt').val() == '' || $('#adYpDtH').val() == ''|| $('#adYpDtM').val() == ''){
		if($('#adYpDt').val() == '' && $('#adYpDtH').val() == '' && $('#adYpDtM').val() == ''){
			flag = true;
		}else{
			flag = false;
			alertBox("용품도착일을 등록해주세요","warning");

		}
	}else if($('#adGjDt').val() == '' || $('#adGjDtH').val() == ''|| $('#adGjDtM').val() == ''){

		if($('#adYpDt').val() == '' && $('#adYpDtH').val() == '' && $('#adYpDtM').val() == ''){
			flag = true;

		}else{
			flag = false;
			alertBox("근조기설치일을 등록해주세요","warning");

		}
	}

	return flag;
};

var adValidate = function() {
	var flag = true;

	var addCdArray = '';
	$('input[name=addCd]').each(function (index, item) {

		if($(this).val() == ''){
			flag = false;
			alertBox('추가품목을 선택해주세요','warning');
		}
		else if(addCdArray.indexOf($(this).val()) > -1){
			flag = false;
			alertBox('추가품목이 같은 건이 있습니다','warning');
		}
		addCdArray +=  $(this).val()+'/';
	});

	if(flag){

		var dedCdArray = '';
		$('input[name=dedCd]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('공제품목을 선택해주세요','warning');
			}
			else if(dedCdArray.indexOf($(this).val()) > -1){
				flag = false;
				alertBox('공제품목이 같은 건이 있습니다','warning');
			}
			dedCdArray +=  $(this).val()+'/';
	});

	}


	return flag;
};

var mgValidate = function() {
	var flag = true;

	$('input[name=actCd]').each(function (index, item) {
		if($(this).val() == ''){
			flag = false;
			alertBox('관리자명을 입력해주세요','warning');
		}
	});

	if(flag){
		$('input[name=actType]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('구분을 선택해주세요','warning');
			}
		});
	}
	if(flag){
		$('input[name=actDtIn]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('출근일을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtInHour]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('출근(시)을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtInMinute]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('출근(분)을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOut]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근일을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOutHour]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근(시)을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOutMinute]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근(분)을 선택해주세요','warning');
			}
		});
	}

	return flag;
};

var fdValidate = function() {
		var flag = true;

	$('input[name=actDt]').each(function (index, item) {
		if($(this).val() == ''){
			flag = false;
			alertBox('시작일 입력해주세요','warning');
		}
	});

	if(flag){
		$('input[name=actDtInHour]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('출근(시)을 선택해주세요','warning');
			}
		});
	}
	if(flag){
		$('input[name=actDtInMinute]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('출근(분)을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOutHour]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근(시)을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOutMinute]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근(분)을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOut]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근일을 선택해주세요','warning');
			}
		});
	}

	if(flag){
		$('input[name=actDtOutHour]').each(function (index, item) {
			if($(this).val() == ''){
				flag = false;
				alertBox('퇴근(시)을 선택해주세요','warning');
			}
		});
	}

	return flag;
};













