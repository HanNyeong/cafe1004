package com.cafe24.seoje1004.subStaff.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.subStaff.model.SubStaffSearch;
import com.cafe24.seoje1004.subStaff.repository.SubStaffDao;

@Service
public class SubStaffServiceImpl implements SubStaffService{

	@Autowired
	private SubStaffDao subStaffDao;
	
	/**
	 * 가맹직원을 등록하는 서비스 메서드입니다.
	 * 등록하고 가맹직원 아이디를 리턴합니다.
	 * @param subStaff
	 * @return
	 */
	@Override
	public void addSubStaffService(SubStaff subStaff) {
		System.out.println("SubStaffServiceImpl addSubStaffService실행");
		subStaff.setHeadStaffId("head_staff1");
		subStaff.setSubCode("sub_code20");
		subStaffDao.addSubStaff(subStaff);
		System.out.println(subStaff);
	}

	/**
	 * 가맹직원 리스트를 리턴하는 서비스 메서드입니다.
	 * @return
	 */
	@Override
	public List<SubStaff> viewSubStaffListService(SubStaffSearch subStaffSearch) {
		System.out.println("SubStaffServiceImpl viewSubStaffListService실행");
		System.out.println("SubServiceImpl viewSubListService. 조회 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subStaffSearch", subStaffSearch);
		return subStaffDao.viewSubStaffList(map);
	}
	/**
     * 가맹 직원 수정을 보여주는 서비스메서드(GET) 입니다.
     * @return
     */
     @Override
     public SubStaff selectSubStaffService(SubStaff subStaff) {
        System.out.println("SubStaffServiceImpl selectSubStaffService실행");
        System.out.println(subStaff);
        return subStaffDao.selectSubStaff(subStaff);
     }
     /**
      *  가맹 직원 수정을 보여주는 서비스메서드(POST) 입니다.
      * @return
      */
     @Override
     public int subModifySubStaffService(SubStaff subStaff) {
        System.out.println("SubStaffServiceImpl selectSubStaffService실행");
        subStaff.setHeadStaffId("subStaff지연");//임의로 값넣음
        return subStaffDao.modifySubStaff(subStaff);
     }

     /**
      * 본사직원이 가맹직원을 등록을 승인하는 서시브 메서드 입니다.
      * 매개변수로 subStaff 를 받습니다. 
      * int로 메서드 결과를 리턴 합니다.
      */
	@Override
	public int headModifySubStaffByPermitService(SubStaff subStaff) {
		System.out.println("SubStaffServiceImpl headModifySubStaffByPermitService실행");
		System.out.println(subStaff);
		subStaff.setHeadStaffId("head_staff1001");
		return subStaffDao.headModifySubStaffByPermit(subStaff);
	}
	
	/**
	 * 가맹직원을 퇴사 처리하는 서비스 메서드 입니다.
	 * 매개변수로 가맹직원정보를 받아서
	 * 탈퇴처리합니다.
	 * @param subStaff
	 * @return
	 */
	@Override
	public int subModifySubStaffByResignService(SubStaff subStaff) {
		System.out.println("SubStaffServiceImpl subModifySubStaffByResignService실행");
		System.out.println(subStaff);
		return subStaffDao.subModifySubStaffByResign(subStaff);
	}
	
	/**
	 * 가맹직원 로그인 서비스 메서드 입니다.
	 * 매개변수로 로그인정보를 받아서 dao에 매개변수로 줍니다.
	 */
	@Override
	public SubStaff loginSubStaffService(SubStaff subStaff) {
		System.out.println("SubStaffServiceImpl loginSubStaffService실행");
		
		SubStaff reSubStaff = null;
		
		if(subStaffDao.loginSubStaff(subStaff) != null){
			reSubStaff = subStaffDao.loginSubStaff(subStaff);
		}
		if(reSubStaff.getSubStaffResign()!= null){
			reSubStaff = null;
		}
		return reSubStaff;
	}
	/**
     * 직원 급여를 관리하는 서비스 메서드 입니다.
     * 매개변수로 직원정보를 고 가맹정보를 업데이트하고
     * 가맹통합회계 에 등록 합니다.
     * 결과를 int로 리턴합니다.
     * @param subStaff
     * @return
     */
	@Override
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public int subStaffSalaryService(SubStaff subStaff) {
		System.out.println("SubStaffServiceImpl subStaffSalaryService실행");
		int resultSubStaff = subStaffDao.subStaffSalary(subStaff);
//		int resultSubAccount = subAccountDao.addSubStaffSalary(subStaff.getTotalAccountGroup());
		return resultSubStaff;
	}

}
