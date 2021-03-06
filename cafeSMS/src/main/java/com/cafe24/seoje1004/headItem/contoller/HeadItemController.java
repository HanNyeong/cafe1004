package com.cafe24.seoje1004.headItem.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.headItem.service.HeadItemService;
import com.cafe24.seoje1004.util.Search;


@Controller
public class HeadItemController {
	@Autowired
	private HeadItemService headItemService;
	
	//상품리스트 조회
	@RequestMapping(value="/viewHeadItemList")
	public String viewHeadItemList(Model model,Search headItemSearch){
		System.out.println("HeadItemController viewHeadItemList");
		model.addAttribute("headItemList",headItemService.viewHeadItemListService(headItemSearch));
		model.addAttribute("headItemSearch",headItemSearch);
		return "/shared/headItem/viewHeadItemList";
	}
}
