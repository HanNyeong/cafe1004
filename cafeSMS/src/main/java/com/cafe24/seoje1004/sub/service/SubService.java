package com.cafe24.seoje1004.sub.service;

import com.cafe24.seoje1004.sub.model.Sub;

public interface SubService {
	
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

	
}
