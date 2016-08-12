package com.cafe24.seoje1004.subClient.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subClient.model.Client;

@Repository
public class ClientDaoImpl implements ClientDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubClient;
	
	private final String NS = "com.cafe24.seoje1004.subClient.repository.ClientMapper";
	
	//거래처 리스트 Dao 0729박효민
	@Override
	public List<Client> viewClientList(Map<String, Object> map) {
		System.out.println("ClientDaoImpl//viewClientList실행");
		return sqlSessionSubClient.selectList(NS+".viewSubClient", map);
	}
	
	//거래처추가 Dao 0729박효민
	@Override
	public void addClient(Map<String, Object> map) {
		System.out.println("ClientDaoImpl//addClient실행");
		sqlSessionSubClient.insert(NS+".insertClient", map);
	}
	
	//거래처 수정폼이동및값셋팅 Dao 0729 박효민
	@Override
	public Client selectClient(Client client) {
		System.out.println("ClientDaoImpl//selectClient실행");
		return sqlSessionSubClient.selectOne(NS+".selectSubClient",client);
	}

	//거래처 수정 Dao 0729박효민
	@Override
	public void modifyClient(Map<String, Object> map) {
		System.out.println("ClientDaoImpl//modifyClient");
		sqlSessionSubClient.update(NS+".modifyClient",map);
	}
	
	//clientcode 가져오기
	@Override
	public String selectClientCode() {
		return sqlSessionSubClient.selectOne(NS+".selectClientCode");
	}
	
	//client --> addSubAccount
	@Override
	public void addSubAccount(Map<String, Object> map) {
		System.out.println("addSubAccount실행");
		sqlSessionSubClient.insert(NS+".addSubAccount",map);
	}
	
}
