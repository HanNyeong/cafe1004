package com.cafe24.seoje1004.subStaff.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subAccount.model.AddSharedSubAccount;
import com.cafe24.seoje1004.subAccount.model.SubAccount;
import com.cafe24.seoje1004.subStaff.model.SubStaff;

@Repository
public class SubStaffDaoImpl implements SubStaffDao{

	@Autowired
	private SqlSessionTemplate sqlSessionSubStaff;
	
	private final String NS = "com.cafe24.seoje1004.subStaff.repository.SubStaffMapper";
	/**
	 * 가맹 직원 등록 메서드 입니다.
	 * 매개변수로 가맹직원정보(subStaff)를 받아서
	 * mapper로 넘겨줍니다
	 * 성공하면 가맹직원아이디(sub_staff_id)를 subStaff객체에 담아 줍니다.
	 */
	@Override
	public void addSubStaff(SubStaff subStaff) {
		System.out.println("SubStaffDaoImpl addSubStaff실행");
		sqlSessionSubStaff.insert(NS+".addSubStaff", subStaff);
	}
	

	/**
	 * 가맹직원 리스트 조회 메서드 입니다.
	 */
	@Override
	public List<SubStaff> viewSubStaffList(Map<String,Object> map) {
		System.out.println("SubStaffDaoImpl viewSubStaffList실행");
		return sqlSessionSubStaff.selectList(NS+".viewSubStaffList",map);
	}

	/**
     * 가맹 직원 정보 받아오기
     */
    @Override
    public SubStaff selectSubStaff(SubStaff subStaff) {
    	System.out.println("SubStaffDaoImpl selectSubStaff실행");
    	return sqlSessionSubStaff.selectOne(NS+".selectSubStaff", subStaff);
    }
    /**
     * 가맹 직원 정보 수정하기
     */
    @Override
    public int modifySubStaff(SubStaff subStaff) {
    	return sqlSessionSubStaff.update(NS+".modifySubStaff",subStaff);
    }

    /**
     * 본사에서 직원 승락 메서드 입니다.
     */
	@Override
	public int headModifySubStaffByPermit(SubStaff subStaff) {
		return sqlSessionSubStaff.update(NS+".headModifySubStaffByPermit",subStaff);
	}
	
	/**
	 * 가맹직원 퇴사를 처리하는 dao 메서드 입니다.
	 * 매개변수로 subStaff(subStaffId)를 받아서 해야당 직원의 퇴사일을 update합니다.
	 */
	@Override
	public int subModifySubStaffByResign(SubStaff subStaff) {
		System.out.println("SubStaffDaoImpl subModifySubStaffByResign실행");
		return sqlSessionSubStaff.update(NS+".subModifySubStaffByResign",subStaff);
		
	}


	@Override
	public void addSubAccount(Map<String,Object> map) {
		System.out.println("SubStaffDaoImpl subStaffSalary실행");
		sqlSessionSubStaff.update(NS+".addSubAccount",map);
	}


	@Override
	public SubStaff subStaffKeeperCheck(SubStaff subStaff) {
		System.out.println("SubStaffDaoImpl subStaffKeeperCheck실행");
		return sqlSessionSubStaff.selectOne(NS+".subStaffKeeperCheck",subStaff);
	}
}
