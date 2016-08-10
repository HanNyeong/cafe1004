package com.cafe24.seoje1004.sub.service;

import java.util.List;

import com.cafe24.seoje1004.sub.model.Sub;
import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.sub.model.SubSearch;

public interface SubService {
	
	/**
	 * 가맹을 등록하는 서비스메서드 입니다.
	 * 매개변수로 Sub sub와 HeadStaff headStaff를 받아서
	 * Dao에 매개변수로줍니다 
	 * 실행결과를 int로 리턴합니다.
	 * @param sub
	 * @param headStaff
	 * @return
	 */
	int addSubService(Sub sub);
	/**
	 * 가맹하나의 정보를 꺼내오는 서비스 메서드 입니다.
	 * 매개변수로 가맹코드를 받습니다
	 * @param sub
	 * @return
	 */
	Sub selectSubService(Sub sub);

	/**
	 * 가맹정보를 수정하는 서비스 메서드입니다.
	 * 매개변수로 가맹정보를 받습니다.
	 * @param sub
	 * @return
	 */
	int modifySubService(Sub sub);

	/**
	 *  가맹 로그인하는 서비스 메서드 입니다.
	 *  매개변수로 로그인 정보를 받아서 로그인 성공 유무를 판단하고 
	 *  결과를 리턴합니다.
	 * @param subStaff
	 * @return
	 */
	SubLogin loginSubService(Sub sub);
	/**
	 * 가맹 정보를 리턴하는 서비스 메서드 입니다.
	 * @param subSearch
	 * @param subLogin
	 * @return
	 */
	Sub viewSubListService(SubLogin subLogin);
	
}
