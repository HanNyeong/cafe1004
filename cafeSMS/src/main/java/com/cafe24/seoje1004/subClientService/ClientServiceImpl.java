package com.cafe24.seoje1004.subClientService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subClient.model.Client;
import com.cafe24.seoje1004.subClient.repository.ClientDao;

@Service
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	private ClientDao clientDao;
	
	@Override
	public List<Client> viewClientListService(String subCode) {
		System.out.println("subClientService//viewClientListService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		return clientDao.viewClientList(map);
	}

}
