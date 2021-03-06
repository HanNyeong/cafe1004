package com.cafe24.seoje1004.subStaff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.subStaff.service.SubStaffService;
import com.cafe24.seoje1004.util.Search;

@Controller
public class SubStaffController {
	
	@Autowired
	private SubStaffService subStaffService;
	
	/**
	 * 가맹직원등록 화면으로 이동하는 컨트롤러입니다.
	 * @return
	 */
	@RequestMapping(value="/subAddSubStaff",method=RequestMethod.GET)
	public String addSubStaff(){
		return "/sub/subStaff/subAddSubStaff";
	}
	
	/**
	 * 가맹직원등록을 처리하는 컨트롤러 입니다.
	 * 매개변수로 가맹직원정보를 받아서 서비스로직으로 보내줍니다.
	 * 실행 성공했다면 아이디를 받아와서 리턴합니다.
	 * @param model
	 * @param subStaff
	 * @return
	 */
	@RequestMapping(value="/subAddSubStaff",method=RequestMethod.POST)
	public String addSubStaff(Model model, SubStaff subStaff){
		System.out.println("SubStaffController addSubStaff.POST 실행");
		System.out.println(subStaff);
		// 1.서비스 메서드 호출하고 가맹직원 아이디를 리턴받습니다.
		subStaffService.addSubStaffService(subStaff);
		System.out.println(subStaff);
		// 2.subStaff에 subStaffId가 셋팅됫다면 model에담아서 view던져줍니다
		if(subStaff.getSubStaffCode() != null){
			// 2-1 아이디를 화면에 보여줄거임
			model.addAttribute("subStaff",subStaff);
		}
		return "redirect:/viewSubStaffList?subCode="+subStaff.getSubCode();
	}
	/**
	 * 가맹직원조회하는 컨트로러입니다.
	 * @param model
	 * @param subStaffSearch
	 * @return
	 */
	@RequestMapping(value="/viewSubStaffList")
	public String viewSubStaffList(
			Model model,
			Search subStaffSearch,
			SubStaff subStaff,
			SubLogin subLogin,
			@RequestParam(value="division", required = false)String division){
		System.out.println("SubStaffController viewSubStaffList실행");
		System.out.println(subStaffSearch);
		model.addAttribute("subStaffList",subStaffService.viewSubStaffListService(subStaffSearch,subLogin,division));
		model.addAttribute("subStaffSearch",subStaffSearch);
		model.addAttribute("division", division);
		model.addAttribute("subStaff", subStaff);
		return "/sub/subStaff/viewSubStaffList";
	}
	
	/**
	    * (가맹입장)가맹 직원 수정하는 컨트롤러 입니다.
	    * 매개변수로 subStaffId를 받아서 해당 가맹 정보를 꺼내와서
	    * subModifySubStaff.jsp로 보내줍니다.
	    * @param model
	    * @param subStaff
	    * @return
	    */
	   
	   @RequestMapping(value="/subModifySubStaff",method=RequestMethod.GET)
	   public String subModifySubStaff(Model model,SubStaff subStaff){
	      System.out.println("SubStaffController subModifySubStaff.GET 실행");
	      System.out.println(subStaff);
	      model.addAttribute("reSubStaff",subStaffService.selectSubStaffService(subStaff));
	      model.addAttribute("subStaff", subStaff);
	      return "/sub/subStaff/subModifySubStaff";
	   }
	   /**
	    * 가맹직원 정보를 가맹쪽에서 수정하는 컨트롤러 입니다.
	    * 매개변수로 가맹직원정보(subStaff)를 받아서 서비스 메서드의 매개변수로 줍니다.
	    * 결과를 int로 받아서 수정 성공 유무 별로 화면 분기를 줍니다.
	    * @param subStaff
	    * @return
	    */
	   @RequestMapping(value="/subModifySubStaff",method=RequestMethod.POST)
	   public String subModifySubStaffPost(Model model,SubStaff subStaff,RedirectAttributes redirectAttr){
	      System.out.println("SubStaffController subModifySubStaff.POST 실행");
	      System.out.println(subStaff);
	      String result = "";
	      // 1. 서비스 메서드 실행 결과에 따른 분기점입니다. 
	      // 2. 성공하면 가맹직원 리스트로 이동하고 실패하면 다시 수정하는 곳으로 이동합니다.
	      if(subStaffService.subModifySubStaffService(subStaff) == 0){
	    	  model.addAttribute("subStaff",subStaff);
	    	  result = "/sub/subStaff/subModifySubStaff";
	      }else{
	    	  redirectAttr.addFlashAttribute("subStaff", subStaff);
	    	  result = "redirect:/viewSubStaffList?subCode="+subStaff.getSubCode();
	      }
	      return result;
	   }  
	   /**
	    * 본사직원이 가맹직원등록을 승인하는 컨틀로러입니다.
	    * 매개변수로 본사직원,가맹직원정보를받아서 서비스 매서드로 넘겨줍니다.
	    * 결과를 int로 받아서 성공유무를 판단하여 
	    * 화면 분기르 줍니다.
	    * @param model
	    * @param subStaff
	    * @return
	    */
	   @RequestMapping(value="/headModifySubStaffByPermit", method=RequestMethod.GET)
	   public String headModifySubStaffByPermit(Model model,SubStaff subStaff){
		   System.out.println("SubStaffController headModifySubStaffByPermit실행");
		   subStaffService.headModifySubStaffByPermitService(subStaff);
		   return "redirect:/viewSubStaffList";
	   }
	   
	   /**
	    * 가맹직원이 직원 퇴사시 처리하는 컨트롤러입니다.
	    * 매개변수로 가맹직원정보를 받아서 서비스 매서드로 넘겨줍니다.
	    * 결과를 int로 받아서 성공유무를 판단하여 
	    * 화면 분기르 줍니다. 
	    * @param model
	    * @param subStaff
	    * @return
	    */
	   @RequestMapping(value="/subModifySubStaffByRegsign", method=RequestMethod.GET)
	   public String subModifySubStaffByRegsign(Model model,SubStaff subStaff,RedirectAttributes redirectAttr){
		   System.out.println("SubStaffController subModifySubStaffByRegsign실행");
		   subStaffService.subModifySubStaffByResignService(subStaff);
		   redirectAttr.addFlashAttribute("subStaff", subStaff);
		   return "redirect:/viewSubStaffList?subCode="+subStaff.getSubCode();
	   }
	   
	   /**
	    * 직원 급여관리를 하는 컨트롤러 입니다.
	    * 매개변수로 가맹직원 id와 급여 금액을 받아서 서비스 메서드로 
	    * 넘겨줍니다.
	    * int로 리턴받습니다.
	    * @param subStaff
	    * @return
	    */
	   @RequestMapping(value="/subStaffSalary",method=RequestMethod.GET)
	   public String subStaffSalary(Model model,SubStaff subStaff,RedirectAttributes redirectAttr){
		   System.out.println("SubStaffController subModifySubStaff.GET 실행");
		   System.out.println(subStaff);
		   subStaffService.subStaffSalaryService(subStaff);
		   redirectAttr.addFlashAttribute("subStaff", subStaff);
		   System.out.println("여기요");
		   return "redirect:/viewSubStaffList?subCode="+subStaff.getSubCode();
	   }
	   /**
	    * 직원리스트 조회를 하는데 권한을 체크하는 컨트롤러입니다.
	    * 매개변수로 직원정보를받아서 점주 유무를 판단해서 직원정보를 리턴합니다.
	    * @param redirectAttr
	    * @param subStaff
	    * @return
	    */
	   
	   @RequestMapping(value="/subStaffKeeperCheck")
	   public String subStaffKeeperCheck(RedirectAttributes redirectAttr, SubStaff subStaff) {
			System.out.println("SubAccountController subAccountKeeperCheck.POST실행");
			System.out.println(subStaff);
			SubStaff reStaff = subStaffService.subStaffKeeperCheckService(subStaff);
			System.out.println(reStaff);
			if(reStaff != null){
				reStaff.setSubStaffLevel("점주");
				reStaff.setSubStaffPw("");
				redirectAttr.addFlashAttribute("subStaff", reStaff);
			}

		   return "redirect:/viewSubStaffList?subCode="+subStaff.getSubCode();
	   }
	
}
