package com.cafe24.seoje1004.subject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.subject.model.SubjectSearch;
import com.cafe24.seoje1004.subject.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	private SubjectService subjectService;
	
	//계정과목 리스트 controller 0801 박효민
	@RequestMapping(value="/viewSubjectList")
	public String viewSubjectList(Model model, SubjectSearch subjectSearch) {
		System.out.println("SubjectController//viewSubjectList");
		System.out.println(subjectSearch);
		model.addAttribute(subjectService.viewSubjectListService(subjectSearch));
		model.addAttribute("subjectSearch",subjectSearch);
		
		return "/shared/subject/viewSubjectList";
	}
	
}
