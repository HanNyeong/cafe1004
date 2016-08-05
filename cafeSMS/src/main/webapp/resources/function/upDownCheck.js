/**
 * 
 */
	$.list = function(upDown,criteria,form){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		form.submit();	
	}
	//삭제 체크 박스 전체 선택/해제
	function selectAll(source) {
		var checkboxes = document.getElementsByName('checking');
			for(var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}