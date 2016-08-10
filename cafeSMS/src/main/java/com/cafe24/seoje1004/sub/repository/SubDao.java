package com.cafe24.seoje1004.sub.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.sub.model.Sub;
import com.cafe24.seoje1004.sub.model.SubLogin;

public interface SubDao {

	
	/**
	 * 가맹을 등록하는 메서드 입니다.
	 * 매개변수로 Sub sub를 받습니다.
	 * Mapper의 addSub에 있는 쿼리를 실행하고 결과를 
	 * int값으로 받아내어 리턴합니다.
	 * @param sub
	 * @return
	 */
	int addSub(Sub sub);
	
	/**
	 * 가맹 하나의 정보를 뽑아내는 메서드 입니다
	 * Mapper의 selectSub에 있는 쿼리를 실행하고 결과를
	 * Sub로 리턴합니다.
	 * @param sub
	 * @return
	 */
	Sub selectSub(Sub sub);
	
	/**
	 * 가맹 하나의 정보를 수정하는 메서드 입니다.
	 * Mapper의 modifySub에 있는 쿼리를 실행하고 결과를
	 * int로 리턴합니다.
	 * @param sub
	 * @return
	 */
	int modifySub(Sub sub);
	
	/**
	 * 가맹 로그인하는 메서드 입니다.
	 * 입력정보가 일치하면 가맹직원정보 일부를 리턴합니다.
	 * @param subStaff
	 * @return
	 */
	SubLogin loginSub(Sub sub);
	
	/**
	 * 가맹 정보를 조회하는 dao메서드 입니다.
	 * @param map
	 * @return
	 */
	Sub viewSubList(Map<String, Object> map);
	

}
