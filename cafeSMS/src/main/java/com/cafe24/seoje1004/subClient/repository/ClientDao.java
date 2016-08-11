package com.cafe24.seoje1004.subClient.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subClient.model.Client;

public interface ClientDao {

	List<Client> viewClientList(Map<String, Object> map);

	void addClient(Map<String, Object> map);

	Client selectClient(Client client);

	void modifyClient(Map<String, Object> map);

	String selectClientCode();
	
}
