/**
 * 
 */
	var list = function(upDown,criteria,form){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		form.submit();	
	}
	//삭제 체크 박스 전체 선택/해제
/*	var selectAll = function(source) {
		var checkboxes = document.getElementsByName('checking');
			for(var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = source.checked; // '모두 체크'에 체크가 되면 다 체크하고 아니면 다 해제하고!
		}
	}
	*/

	
	$(document).ready(function(){
		
		$('#viewMoreBtn').click(function(){
		var viewMore = $('#viewMore').val();
			$('#viewMore').val(viewMore*1+25);
			$('#subStaffList').submit();
		});
		$('#selectAll').click(function(){
			
			var choiceCheck = $(this).prop("checked");
			
			if(choiceCheck){
				$('.checking').prop("checked", true);
			}else{
				$('.checking').prop("checked", false);
			}
			//checking
			
		});
		
		
	});