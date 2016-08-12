package com.cafe24.seoje1004.subStaff.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subAccount.model.AddSharedSubAccount;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subAccount.repository.SubAccountDao;
import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.subStaff.repository.SubStaffDao;
import com.cafe24.seoje1004.util.Search;

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
	public List<SubStaff> viewSubStaffListService(Search subStaffSearch,SubLogin subLogin,String division) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subStaffSearch", subStaffSearch);
		map.put("subLogin", subLogin);
		map.put("division", division);
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

	@Override
	public void subStaffSalaryService(SubStaff subStaff) {
		System.out.println("SubStaffServiceImpl subStaffSalary실행");
		System.out.println(subStaff);
		SubStaff reSubStaff = subStaffDao.selectSubStaff(subStaff);
		AddSharedSubAccount subAccount = new AddSharedSubAccount();
		String Flow = "출금";
		String Detail = "직원급여";
		String subjectCode = "subject_code3";
//		String 
		subAccount.setSubAccountFlow(Flow);
		subAccount.setSubAccountDetail(Detail);
		subAccount.setSubAccountPrice(reSubStaff.getSubStaffSalary());
		subAccount.setSubCode(reSubStaff.getSubCode());
		subAccount.setSubjectCode(subjectCode);
		subAccount.setTotalAccountGroup(reSubStaff.getTotalAccountGroup());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subAccount", subAccount);
		subStaffDao.addSubAccount(map);
	}

	@Override
	public SubStaff subStaffKeeperCheckService(SubStaff subStaff) {
		System.out.println("SubAccountSerivceImpl subAccountKeeperCheckService실행");
		return subStaffDao.subStaffKeeperCheck(subStaff);
	}
	

}
