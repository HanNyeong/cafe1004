package com.cafe24.seoje1004.subClient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.subClient.model.Client;
import com.cafe24.seoje1004.subClientService.ClientService;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService clientService;
	
	//거래처목록 불러오는 컨트롤러 0729 박효민 search추가후 수정
	@RequestMapping(value="/subViewSubClientList")
	public String viewClientList(Model model) {
		System.out.println("ClientController//viewClientList실행");
		String subCode = "sub_code1";
		List<Client> clientList = clientService.viewClientListService(subCode);
		model.addAttribute("clientList",clientList);
		return "/sub/subClient/subViewSubClientList";
	}
	
	//거래처 추가 폼이동 컨트롤러 0729 박효민 
	@RequestMapping(value="/subAddSubClient")
	public String addClientView() {
		System.out.println("ClientController//addClientView실행");
		return "sub/subClient/subAddSubClient";
	}
	
	//거래처 추가 컨트롤러 0729 박효민
	@RequestMapping(value="/addClient",method=RequestMethod.POST)
	public String addClient(Model model, Client client) {
		System.out.println("ClientController//addClient실행");
		System.out.println("쿼리실행전//"+client);
		clientService.addClientService(client);
		System.out.println("쿼리실행후//"+client);
		
		model.addAttribute("client",client);
		
		return "redirect:/subViewSubClientList";
	}
	
	//거래처 수정 폼이동 컨트롤러 0729 박효민
	@RequestMapping(value="/subModifySubClient")
	public String modifyClientView(Model model, Client client) {
		System.out.println("ClientController//modifyClientView실행");
		System.out.println(client);
		
		model.addAttribute("reClient",clientService.selectClientService(client));
		System.out.println(clientService.selectClientService(client));
		return "sub/subClient/subModifySubClient";
	}
	
	//거래처 수정 컨트롤러 0729박효민
	@RequestMapping(value="/modifyClient",method=RequestMethod.POST)
	public String modifyClient(Model model,Client client, @RequestParam("subClientCode")String subClientCode) {
		System.out.println("ClientController//modifyClient실행");
		System.out.println(client);
		
		clientService.modifyClientService(client,subClientCode);
		
		return "redirect:/subViewSubClientList";
	}
}
