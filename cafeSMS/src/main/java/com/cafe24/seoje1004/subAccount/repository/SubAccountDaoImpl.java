package com.cafe24.seoje1004.subAccount.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
@Repository
public class SubAccountDaoImpl implements SubAccountDao{

	@Autowired
	private SqlSessionTemplate sqlSeesionSubAccount;
	
	@Override
	public void addSubAccount(SubAccount subAccount) {
		
	}

}
