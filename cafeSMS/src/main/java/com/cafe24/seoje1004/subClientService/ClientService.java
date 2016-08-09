package com.cafe24.seoje1004.subClientService;

import java.util.List;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subClient.model.Client;
import com.cafe24.seoje1004.subClient.model.ClientSearch;

public interface ClientService {

	List<Client> viewClientListService(ClientSearch clientSearch, SubLogin subLogin);

	void addClientService(Client client,SubLogin subLogin);

	Client selectClientService(Client client);

	void modifyClientService(Client client,String subClientCode);

}
