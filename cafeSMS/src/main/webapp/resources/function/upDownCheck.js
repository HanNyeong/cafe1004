/**
 * 
 */
	var dateChecked = function(regitDateStart,regitDateEnd,span){
		var startDateArr = regitDateStart.split('-');
        var endDateArr = regitDateEnd.split('-');
                 
        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
         
        if(startDateCompare.getTime() > endDateCompare.getTime()) {
        	span.css('color','red')
			span.text("날짜를 확인해주세요.")
            return false;
        }
        return true;
	}
	var list = function(upDown,criteria,form){
		$('#upDown').attr('value',upDown);
		$('#criteria').attr('value',criteria);
		var dateCheck = true;
		var dateBooleans = dateChecked($('#regitDateStart').val(),$('#regitDateEnd').val(),$('#valChekMsg'));
		console.log(dateBooleans);
		if(!dateBooleans){
			dateCheck = dateBooleans;
		}
		
		if(dateCheck){ 
			form.submit();
		}
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