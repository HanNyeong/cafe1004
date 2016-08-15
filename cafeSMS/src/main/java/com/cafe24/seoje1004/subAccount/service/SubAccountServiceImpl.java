package com.cafe24.seoje1004.subAccount.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.repository.SubAccountDao;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.util.Search;
@Service
public class SubAccountServiceImpl implements SubAccountService{

	@Autowired
	private SubAccountDao subAccountDao;

	/**
	 * 권한체크하는 service메서드 입니다.
	 * 가맹 아이디를 입력받으면 권한이 점주이면서 필요정보를 넘겨줍니다.
	 */
	@Override
	public SubAccount subAccountKeeperCheckService(SubStaff subStaff) {
		System.out.println("SubAccountSerivceImpl subAccountKeeperCheckService실행");
		return subAccountDao.subAccountKeeperCheck(subStaff);
		
	}
	/**
	 * 가맹통합회계 등록 service메서드 입니다.
	 * 매개변수로  subAccount 를 받습니다.
	 */
	@Override
	public void addSubAccountService(SubAccount subAccount) {
		System.out.println("SubAccountSerivceImpl addSubAccountService실행");
		System.out.println(subAccount);
		subAccountDao.addSubAccount(subAccount);
	}

	/**
	 * 가맹 통합 회계를 출력하는 service 메서드 입니다.
	 * 매개변수로 검색정보와 권한정보, 가맹코드를 받아습니다.
	 */
	@Override
	public List<SubAccount> viewSubAccountListService(Search subAccountSearch,SubStaff subStaff) {
		System.out.println("SubAccountServiceImpl viewSubAccountListService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subAccountSearch", subAccountSearch);
		map.put("subStaff", subStaff);
		return subAccountDao.viewSubAccountList(map);
		
	}

	/**
	 * 점주가 회계 마감처리하는 service메서드 입니다.
	 * 
	 */
	@Override
	public void modifySubAccountService(SubAccount subAccount, SubStaff subStaff) {
		System.out.println("SubAccountServiceImpl modifySubAccountService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		if(subStaff.getSubStaffLevel() == "점주"){
			map.put("subAccount", subAccount);
			map.put("subStaff", subStaff);
			subAccountDao.modifySubAccount(map);
			
		}
		
	}

	
}
