package com.cafe24.seoje1004.sub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cafe24.seoje1004.sub.model.Sub;
import com.cafe24.seoje1004.sub.service.SubService;

@Controller
@SessionAttributes("headStaff")
public class SubController {
	
	@Autowired
	private SubService subService;

	
	/**
	 * 가맹 수정하는 화면으로 보내주는 컨트롤러 입니다.
	 * 매개변수로 subCode를 받아서 해당 가맹 정보를 꺼내와서
	 * modifySub.jsp로 보내줍니다.
	 * @param model
	 * @param sub
	 * @return
	 */
	@RequestMapping(value="/modifySub",method=RequestMethod.GET)
	public String modifySub(Model model,Sub sub){
		System.out.println("SubController modifySub.GET 실행");
		System.out.println(sub);
		model.addAttribute("reSub", subService.selectSubService(sub));
		return "/shared/sub/modifySub";
	}
	
	/**
	 * 가맹정보를 수정하는 컨트롤러입니다.
	 * 가맹정보(Sub sub)를  가맹 서비스로직으로 넘겨줍니다.
	 * 결과를 int로받아서 화면 분기를 줍니다.
	 * @param sub
	 * @return
	 */
	@RequestMapping(value="/modifySub",method=RequestMethod.POST)
	public String modifySub(Sub sub){
		System.out.println("SubController modifySub.POST 실행");
		System.out.println(sub);
		int result = subService.modifySubService(sub);
		return "redirect:/viewSubList";
	}
	
	


}
