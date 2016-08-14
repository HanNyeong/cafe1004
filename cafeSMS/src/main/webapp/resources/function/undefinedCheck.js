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
				form.submit();
			}
		});
	}
