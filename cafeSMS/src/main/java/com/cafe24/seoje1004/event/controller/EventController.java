package com.cafe24.seoje1004.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.event.model.EventSearch;
import com.cafe24.seoje1004.event.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/viewEventList")
	public String viewEventList(Model model,EventSearch eventSearch) {
		System.out.println("EventController//viewEventList 실행");
		model.addAttribute(eventService.viewEventService(eventSearch));
		model.addAttribute("eventSearch",eventSearch);
		return "/shared/event/subViewEventList";
	}
}
