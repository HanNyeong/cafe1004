package com.cafe24.seoje1004.subAccount.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
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
		System.out.println("SubAccountDaoImpl addSubAccount실행");
		return sqlSeesionSubAccount.insert(NS+".addSubAccount", subAccount);
	}
	/**
	 * 가맹 통합회계리스트 조회권한체크 dao메서드입니다.
	 * 매개변수는점주의 직원정보를 받습니다.
	 */
	@Override
	public SubAccount subAccountKeeperCheck(SubStaff subStaff) {
		System.out.println("SubAccountDaoImpl modifySubAccountCheck실행");
		return sqlSeesionSubAccount.selectOne(NS+".subAccountKeeperCheck", subStaff);
	}
	/**
	 * 통합회계리스트를 출력하는 dao메서드입니다.
	 */
	@Override
	public SubAccount viewSubAccountList(Map<String, Object> map) {
		System.out.println("SubAccountDaoImpl viewSubAccountList실행");
		return null;
	}

}
