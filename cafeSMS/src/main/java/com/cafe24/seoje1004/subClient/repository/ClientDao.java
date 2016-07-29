package com.cafe24.seoje1004.subClient.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.subClient.model.Client;

public interface ClientDao {

	List<Client> viewClientList(Map<String, Object> map);

}
