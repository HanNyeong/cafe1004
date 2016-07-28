package com.cafe24.seoje1004.sub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.sub.model.Sub;
import com.cafe24.seoje1004.sub.repository.SubDao;

@Service
public class SubServiceImpl implements SubService{

	@Autowired
	private SubDao subDao;
	
	/**
	 * 가맹하나의 정보를 꺼내오는 서비스 메서드 입니다.(가맹정보수정할떄 자료를 보여줄용도로)
	 * 매개변수로 가맹코드를 받습니다
	 * @param sub
	 * @return
	 */
	@Override
	public Sub selectSubService(Sub sub) {
		System.out.println("SubServiceImpl selectSubService실행");
		System.out.println(sub);
		return subDao.selectSub(sub);
	}
	/**
	 * 가맹정보를 수정하는 서비스 메서드입니다.
	 * 매개변수로 가맹정보를 받습니다.
	 * @param sub
	 * @return
	 */
	@Override
	public int modifySubService(Sub sub) {
		System.out.println("SubServiceImpl modifySubService실행");
		sub.setHeadStaffId("headStaff한녕");//임의로 값넣음
		return subDao.modifySub(sub);
	}
	

}
