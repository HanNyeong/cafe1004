package com.cafe24.seoje1004.subClientService;

import java.util.List;

import com.cafe24.seoje1004.subClient.model.Client;

public interface ClientService {

	List<Client> viewClientListService(String subCode);

	void addClientService(Client client);

	Client selectClientService(Client client);

	void modifyClientService(Client client,String subClientCode);

}
