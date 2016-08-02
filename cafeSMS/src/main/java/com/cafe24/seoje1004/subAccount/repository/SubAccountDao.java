package com.cafe24.seoje1004.subAccount.repository;

import java.util.Map;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subStaff.model.SubStaff;

public interface SubAccountDao {
	/**
	 * 가맹 통합회계 등록 dao메서드입니다.
	 * 매개변수는 통합회계 필수 입력 정보들입니다.
	 * @param subAccount
	 * @return
	 */
	int addSubAccount(SubAccount subAccount);
	/**
	 * 가맹 통합회계마감처리 하는 dao메서드입니다.
	 * 매개변수는점주의 직원정보를 받습니다.
	 */
	SubStaff subAccountKeeperCheck(SubStaff subStaff);
	SubAccount viewSubAccountList(Map<String, Object> map);

}
