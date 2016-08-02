package com.cafe24.seoje1004.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.delivery.model.Delivery;
import com.cafe24.seoje1004.delivery.model.DeliverySearch;
import com.cafe24.seoje1004.delivery.service.DeliveryService;

@Controller
public class DeliveryController {
	/**
	 * 2016-08-02 오성현
	 * Delevery컨트롤러
	 */
	
	@Autowired
	DeliveryService deliveryService;
	
	
	//가맹이 해당점의 배송 리스트를 조회
	@RequestMapping(value="/subViewDeliveryList")
	public String subViewDeliveryList(Model model, String subCode, DeliverySearch deliverySearch){
		System.out.println("DeliveryController subViewDeliveryList 실행");
		
		List<Delivery> deliveryList = deliveryService.subViewDeliveryList(subCode,deliverySearch);
		System.out.println("deliveryList : "+deliveryList);
		
		model.addAttribute("subCode", subCode);
		model.addAttribute("deliverySearch", deliverySearch);
		model.addAttribute("deliveryList", deliveryList);
		
		return "/shared/delivery/subViewDeliveryList";
	}
	
	//본사가 전체 배송리스트를 조회
	@RequestMapping(value="/headViewDeliveryList")
	public String  headViewDeliveryList(Model model, DeliverySearch deliverySearch){
		System.out.println("DeliveryController headViewDeliveryList 실행");
		
		List<Delivery> deliveryList	= deliveryService.headViewDeliveryList(deliverySearch);
		System.out.println("deliveryList : "+deliveryList);
		
		model.addAttribute("deliverySearch", deliverySearch);
		model.addAttribute("deliveryList", deliveryList);
		
		return "/shared/delivery/headViewDeliveryList";
	}

} 
