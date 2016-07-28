package com.cafe24.seoje1004.sub.repository;

import com.cafe24.seoje1004.sub.model.Sub;

public interface SubDao {

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
	

	

}
