/**
 * 
 */
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
			var submitCheck = true;
			$('[valChek]').each(function(){
				var msg = $(this).attr('valChek');
				
				var val = $(this).val();
				var booleans = undefinedCheck(val,msg,span);
				if(!booleans){
					submitCheck = booleans;
					return booleans;
				}
			});
			
			if(submitCheck){ 
					if ($('#subStaffPw').val() != $('#subStaffPw2').val()){
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
			var submitCheck = true;
			$('[valChek2]').each(function(){
				var msg = $(this).attr('valChek2');
				
				var val = $(this).val();
				var booleans = undefinedCheck(val,msg,span);
				if(!booleans){
					submitCheck = booleans;
					return booleans;
				}
			});
			
			if(submitCheck){ 
					if ($('#subStaffPw').val() != $('#subStaffPw2').val()){
						span.css('color','red')
						span.text("비밀번호가 일치하지 않습니다.")
					}else{
						form.submit();
					}
			}
		});
	}