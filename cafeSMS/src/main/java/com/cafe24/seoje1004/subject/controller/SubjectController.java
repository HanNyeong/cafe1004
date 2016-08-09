package com.cafe24.seoje1004.subject.controller;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.subject.model.SpecificItem;
import com.cafe24.seoje1004.subject.model.SubjectSearch;
import com.cafe24.seoje1004.subject.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubject;
	//계정과목 리스트 controller 0801 박효민
	@RequestMapping(value="/viewSubjectList")
	public String viewSubjectList(Model model, SubjectSearch subjectSearch) {
		System.out.println("SubjectController//viewSubjectList");
		System.out.println(subjectSearch);
		model.addAttribute(subjectService.viewSubjectListService(subjectSearch));
		model.addAttribute("subjectSearch",subjectSearch);
		
		return "/shared/subject/viewSubjectList";
	}
	
	@RequestMapping(value="/add")
	public String add(SpecificItem specificItem){
//		String[] headItem = {"head_item_code1","head_item_code2","head_item_code3","head_item_code4"};
//		for(int j=0; j< headItem.length; j++){
//			String a = headItem[j];
	/*	Map<String,Object> map = new HashMap<String,Object>();
		map.put("a", "a");
			for(int i=0; i< 1000; i++){
				sqlSessionSubject.insert("com.cafe24.seoje1004.subject.repository.SubjectMapper.add",map);
			}
//		}
*/		subjectService.add(specificItem);
		return "redirect:/";
	}
}
