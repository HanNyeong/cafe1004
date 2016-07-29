package com.cafe24.seoje1004.sub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cafe24.seoje1004.sub.model.Sub;
import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.sub.service.SubService;

@Controller
@SessionAttributes("subLogin")
public class SubController {
	
	@Autowired
	private SubService subService;

	/**
	 * 가맹을 등록하는 화면으로 보내주는 컨트롤러 입니다
	 * 가맹직원정보(headStaff)만 이동 가능합니다.
	 * @return
	 */
	@RequestMapping(value="/headAddSub",method=RequestMethod.GET)
	public String addSub(){
		System.out.println("SubController addSub실행");
		return "/shared/sub/headAddSub";
	}
	/**
	 * 가맹을 등록하는 컨트롤러입니다.
	 * 가맹정보(sub)와 가맹직원정보(headStaff)를 받아서 
	 * 가맹을 등록하는 Service에 매개변수로 넘겨줍니다.
	 * 가맹등록 성공 실패유무를 체크하고 성공했다면 가맹 리스트화면으로 이동하고
	 * 실패하면 등록화면으로 이동합니다.
	 * @param model
	 * @param sub
	 * @param headStaff
	 * @return
	 */
	@RequestMapping(value="/headAddSub",method=RequestMethod.POST)
	public String addSub(Model model,Sub sub){
		System.out.println("SubController addSub.POST 실행");
		System.out.println(sub);
		//임시로 생성했습니다.
		// 1.가맹등록하는 서비스로직 에 가맹정보와 본사직원의 정보를 매개변수로 줬습니다.
		// sub에 subCode가 셋팅됫다면 model에담아서 view던져줍니다
		subService.addSubService(sub);
		System.out.println(sub);
		if(sub.getSubCode() != null){
			model.addAttribute("sub", sub);
		}
		return "/shared/sub/headAddSub";
	}
	
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
	
	/**
* 가맹직원 로그인을 체크하는 컨트롤러입니다.
* 매개변수로 
*/
   
	@RequestMapping(value="/subLogin",method=RequestMethod.POST)
	public String loginSub(Model model ,Sub sub){
		System.out.println("SubController loginSub실행");
		String result = "";
		SubLogin subLogin = subService.loginSubService(sub);
		if(subLogin == null){
			result = "/home";
		}else{
			model.addAttribute("subLogin", subLogin);
			result = "redirect:/";
		}
		return result;
	}
	   
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(@ModelAttribute Sub sub,SessionStatus status){
		status.setComplete();
		return "redirect:/";
	}

	


}
