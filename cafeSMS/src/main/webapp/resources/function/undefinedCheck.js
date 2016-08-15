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
	var undefinedCheck = function(val,msg,span){
		if(undefined == val || '' == val){
			
			span.css('color','red')
			span.text(msg)
			return false;
		}
		return true;
	}
	var undefinedEvent = function(btn,form,span){
		btn.click(function(){
			var valCheck = true;
			var dateCheck = true;
			$('[valChek]').each(function(){
				var msg = $(this).attr('valChek');
				
				var val = $(this).val();
				var valBooleans = undefinedCheck(val,msg,span);
				if(!valBooleans){
					valCheck = valBooleans;
					return valBooleans;
				}
			});
			var dateBooleans = dateChecked($('#regitDateStart').val(),$('#regitDateEnd').val(),span);
			console.log(dateBooleans);
			if(!dateBooleans){
				dateCheck = dateBooleans;
			}
			
			if(valCheck && dateCheck){ 
					if ($('#Pw').val() != $('#Pw2').val()){
						span.css('color','red')
						span.text("비밀번호가 일치하지 않습니다.")
					}else{
						form.submit();
					}
			}
		});
	}
	var undefinedEvent2 = function(btn,form,span){
		btn.click(function(){
			var valCheck = true;
			$('[valChek2]').each(function(){
				var msg = $(this).attr('valChek2');
				
				var val = $(this).val();
				var booleans = undefinedCheck(val,msg,span);
				if(!booleans){
					valCheck = booleans;
					return booleans;
				}
			});
			
			if(valCheck){ 
					if ($('#Pw').val() != $('#Pw2').val()){
						span.css('color','red')
						span.text("비밀번호가 일치하지 않습니다.")
					}else{
						form.submit();
					}
			}
		});
	}
	
