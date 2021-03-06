package com.cafe24.seoje1004.subClientService;

import java.util.List;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.SubAccounts;
import com.cafe24.seoje1004.subClient.model.Client;

import com.cafe24.seoje1004.util.Search;

public interface ClientService {

	List<Client> viewClientListService(Search clientSearch, SubLogin subLogin);

	void addClientService(Client client,SubLogin subLogin);

	Client selectClientService(Client client);

	void modifyClientService(Client client,String subClientCode);

	Client viewClientListByAccount(Client client);

	void addSubAccount(SubAccounts subAccounts);

}
