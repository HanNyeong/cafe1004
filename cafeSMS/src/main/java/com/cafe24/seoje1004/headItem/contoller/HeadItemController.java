package com.cafe24.seoje1004.headItem.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.seoje1004.headItem.model.HeadItemSearch;
import com.cafe24.seoje1004.headItem.service.HeadItemService;

@Controller
public class HeadItemController {
	@Autowired
	private HeadItemService headItemService;
	
	@RequestMapping(value="/viewHeadItemList")
	public String viewHeadItemList(Model model,HeadItemSearch headItemSearch){
		System.out.println("HeadItemController viewHeadItemList");
		model.addAttribute("headItemList",headItemService.viewHeadItemListService(headItemSearch));
		model.addAttribute("headItemSearch",headItemSearch);
		return "/shared/headItem/viewHeadItemList";
	}
	
}
