package com.cafe24.seoje1004.subClient.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subClient.model.Client;

@Repository
public class ClientDaoImpl implements ClientDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubClient;
	
	private final String NS = "org.ksmart02.cafe.subClient.repository.ClientMapper";
	
	@Override
	public List<Client> viewClientList(Map<String, Object> map) {
		System.out.println("repository//viewClientList실행");
		return sqlSessionSubClient.selectList(NS+".selectSubClient", map);
	}

}
