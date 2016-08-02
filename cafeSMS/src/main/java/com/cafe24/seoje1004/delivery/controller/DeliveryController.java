package com.cafe24.seoje1004.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeliveryController {
	/**
	 * 2016-08-02 오성현
	 * Delevery컨트롤러
	 */
	
	@RequestMapping(value="/subViewDeliveryList")
	public String subViewDeliveryList(Model model){
		System.out.println("DeliveryController subViewDeliveryList 실행");
		
		return "/shared/delivery/subViewDeliveryList";
	}
}
