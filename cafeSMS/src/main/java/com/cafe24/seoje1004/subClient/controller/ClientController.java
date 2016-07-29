package com.cafe24.seoje1004.subClient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subClient.model.Client;
import com.cafe24.seoje1004.subClientService.ClientService;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService clientService;
	
	@RequestMapping(value="/viewClientList")
	public String viewClientList(Model model,@RequestParam("subCode") String subCode) {
		System.out.println("ClientController//viewClientList실행");
		System.out.println(subCode+"<-----subCode잘들어왔나 확인");
		List<Client> clientList = clientService.viewClientListService(subCode);
		model.addAttribute("clientList",clientList);
		return "/sub/subClient/viewClientList";
	}
}
