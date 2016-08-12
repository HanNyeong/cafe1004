package com.cafe24.seoje1004.subDump.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.seoje1004.subDump.model.SubDump;
import com.cafe24.seoje1004.subDump.service.SubDumpService;
import com.cafe24.seoje1004.util.Search;

@Controller
public class SubDumpController {

		@Autowired
		private SubDumpService subDumpService;
		
		/**
		 * 폐기 등록 화면으로 이동하는 컨트롤러입니다.
		 * @param model
		 * @param subDump
		 * @return
		 */
		@RequestMapping(value="/subAddSubDump",method=RequestMethod.GET)
		public String addSubDump(Model model, SubDump subDump){
			System.out.println("SubDumpController addSubDump.GET 실행");
		    System.out.println(subDump);
		    model.addAttribute("reSubDump", subDumpService.selectSubDumpService(subDump));
			return "/sub/subDump/subAddSubDump";
		}
		
		/**
		 * 폐기 등록을 처리하는 컨트롤러 입니다.
		 * 매개변수로 subDump를 받아 서비스 로직으로 보내줍니다.
		 * @param model
		 * @param subDump
		 * @return
		 */
		@RequestMapping(value="/subAddSubDump",method=RequestMethod.POST)
		public String addSubDumpPost(Model model, SubDump subDump){
			System.out.println("SubDumpController addSubDump.POST 실행");
			System.out.println(subDump);
			String result="";
			//1. 서비스 메서드 실행 결과에 따른 결과값입니다.
		    //2. 성공하면 폐기관리 리스트로 이동하고 실패하면 원래 등록페이지를 유지합니다.
		    if(subDumpService.addSubDumpService(subDump) == 0){
		    	model.addAttribute("reSubDump",subDump);
		    	result = "/sub/subDump/subAddSubDump";
		    }else{
		    	result="redirect:/subViewSubDumpList?subCode="+subDump.getSubCode();
		    }
			return result;
		}
		
		/**
		 * 폐기 관리 리스트 컨트롤러 입니다.
		 * @param model
		 * @param subDumpSearch
		 * @param subDump
		 * @return
		 */
		@RequestMapping(value="/subViewSubDumpList")
		public String subViewSubDumpList(Model model, Search subDumpSearch, SubDump subDump){
			System.out.println("SubDumpController subViewSubDumpList실행");
			System.out.println(subDumpSearch);
			model.addAttribute("subDumpList", subDumpService.viewSubDumpListService(subDumpSearch,subDump));
			model.addAttribute("subDumpSearch", subDumpSearch);
			return "/sub/subDump/subViewSubDumpList";			
		}
}
