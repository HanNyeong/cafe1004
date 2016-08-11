package com.cafe24.seoje1004.subClientService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.model.SubAccounts;
import com.cafe24.seoje1004.subClient.model.Client;
import com.cafe24.seoje1004.subClient.model.ClientSearch;
import com.cafe24.seoje1004.subClient.repository.ClientDao;

@Service
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	private ClientDao clientDao;
	
	//거래처 리스트 service 0729박효민
	@Override
	public List<Client> viewClientListService(ClientSearch clientSearch, SubLogin subLogin) {
		System.out.println("subClientService//viewClientListService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("clientSearch", clientSearch);
		map.put("subLogin", subLogin);
		return clientDao.viewClientList(map);
	}
	
	//거래처추가 service 0729박효민
	@Override
	public void addClientService(Client client,SubLogin subLogin) {
		System.out.println("ClientServiceImpl//addClientService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		client.setSubClientCode(clientDao.selectClientCode());
		map.put("client", client);
		map.put("subLogin", subLogin);
		clientDao.addClient(map);
	}
	
	//거래처수정을위한 select service 0729박효민
	@Override
	public Client selectClientService(Client client) {
		System.out.println("ClientServiceImpl//selectClientService실행");
		return clientDao.selectClient(client);
	}
	
	//거래서 수정 service 0729박효민
	@Override
	public void modifyClientService(Client client,String subClientCode) {
		System.out.println("ClientServiceImpl//selectClientService실행");
		System.out.println(client);
		System.out.println(subClientCode);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("client", client);
		map.put("subClientCode", subClientCode);
		clientDao.modifyClient(map);
	}

	//지출내역홈이동 service
	@Override
	public Client viewClientListByAccount(Client client) {
		System.out.println("viewClientListByAccount실행");
		return clientDao.selectClient(client);
	}
	
	
	//client -> add Sub_account service
	@Override
	public void addSubAccount(SubAccounts subAccounts) {
		System.out.println("addSubAccount실행");
		Map<String,Object> map = new HashMap<String,Object>();
		
		for(int i = 0; i<subAccounts.getSubAccountDetail().size();i++) {
			SubAccount subAccount = new SubAccount();
			
		}
	}

}
