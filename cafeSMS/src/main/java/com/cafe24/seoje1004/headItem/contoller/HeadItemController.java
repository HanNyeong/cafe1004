package com.cafe24.seoje1004.headItem.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.headItem.model.HeadSearch;
import com.cafe24.seoje1004.headItem.service.HeadItemService;

@Controller
public class HeadItemController {
	@Autowired
	private HeadItemService headItemService;
	
	@RequestMapping(value="/viewHeadItemList")
	public String viewHeadItemList(Model model,HeadSearch headSearch){
		System.out.println("HeadItemController viewHeadItemList");
		model.addAttribute("subList",headItemService.viewHeadItemListService(headSearch));
		model.addAttribute("headSearch",headSearch);
		return "/shared/headItem/viewHeadItemList";
	}
	
}
