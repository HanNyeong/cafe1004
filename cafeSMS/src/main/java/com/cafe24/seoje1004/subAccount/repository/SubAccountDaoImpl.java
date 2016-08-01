package com.cafe24.seoje1004.subAccount.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
@Repository
public class SubAccountDaoImpl implements SubAccountDao{

	@Autowired
	private SqlSessionTemplate sqlSeesionSubAccount;
	private final String NS = "com.cafe24.seoje1004.subAccount.repository.SubAccountMapper";
	
	/**
	 * 통합 회계 등록 dao 메서드 입니다.
	 * 매개변수로 subAccount를 받습니다.
	 */
	@Override
	public int addSubAccount(SubAccount subAccount) {
		return sqlSeesionSubAccount.insert(NS+".addSubAccount", subAccount);
	}

}
