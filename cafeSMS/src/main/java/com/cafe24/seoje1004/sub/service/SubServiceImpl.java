package com.cafe24.seoje1004.sub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.sub.model.Sub;
import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.sub.repository.SubDao;

@Service
public class SubServiceImpl implements SubService{

	@Autowired
	private SubDao subDao;
	
	/**
	 * 가맹을 등록하는 서비스메서드 입니다.
	 * 매개변수로 Sub sub와 HeadStaff headStaff를 받아서
	 * Dao에 매개변수로줍니다 
	 * 실행결과를 int로 리턴합니다.
	 * @param sub
	 * @param headStaff
	 * @return
	 */
	@Override
	public int addSubService(Sub sub) {
		System.out.println("SubServiceImpl addSubService 실행");
		System.out.println(sub);
		sub.setHeadStaffId("head_staff1001");
		sub.setHeadStaffId("staff");//임의로 값집어넣음
	
		// 4.addSub메서드로 가맹등록 합니다. 결과를 int로 리턴합니다 
		return subDao.addSub(sub);
	}
	
	
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
	
	/**
	 * 가맹직원 로그인 서비스 메서드 입니다.
	 * 매개변수로 로그인정보를 받아서 dao에 매개변수로 줍니다.
	 */
	@Override
	public SubLogin loginSubService(Sub sub) {
		System.out.println("SubServiceImpl loginSubService실행");
		System.out.println(sub);
		SubLogin subLogin = null;
		
		subLogin = subDao.loginSub(sub);
		
		System.out.println(subLogin);
		return subLogin;
	}
	

}
