package com.cafe24.seoje1004.subStaff.repository;

import java.util.List; 
import java.util.Map;

import com.cafe24.seoje1004.subStaff.model.SubStaff;

public interface SubStaffDao {

	/**
	 * 가맹직원을 등록하는 dao 메서드 입니다.
	 * 매개변수로 map(subStaff)를 받아서  Mapper에 접근해서 쿼리 실행합니다
	 * 결과는 int로 리턴합니다.
	 * @param map
	 * @return
	 */
	void addSubStaff(SubStaff subStaff);

	/**
	 * 가맹직원을 리스트를 조회하는 dao메서드입니다.
	 * 매개변수로 검색조건(Search)과 본사,가맹  정보를 
	 * @param subStaffSearch
	 * @return
	 */
	List<SubStaff> viewSubStaffList(Map<String,Object> map);
	
	 /**
	  * 가맹 직원 수정 GET방식
	  * @param subStaff
	  * @return
	  */
	SubStaff selectSubStaff(SubStaff subStaff);
   
	/**
	 * 가맹 직원 수정 POST방식
	 * @param subStaff
	 * @return
	 */
	int modifySubStaff(SubStaff subStaff);
	
	/**
	 * 본사직원이 가맹직원 입사를 승인하는 dao메서드 입니다.
	 * 매개변수로 본사직원,가맹직원 id(subStaff)를 받습니다. 
	 * 결과를 int롤 리턴합니다. 
	 */
	int headModifySubStaffByPermit(SubStaff subStaff);
	/**
	 * 가맹직원 퇴사 하는 dao 메서드 입니다.
	 * @param subStaff
	 * @return
	 */
	int subModifySubStaffByResign(SubStaff subStaff);

	/**
	 * 통합회계에 직원급여 지급을 등록하는 dao 메서드입니다
	 * @param map
	 */
	void addSubAccount(Map<String,Object> map);

	/**
	 * 직원관리페이지 권한체크를 하는 dao 메서드입니다.
	 * @param subStaff
	 * @return
	 */
	SubStaff subStaffKeeperCheck(SubStaff subStaff);
	/**
	 *  직원최종 급여일 업데이트하는 dao 메서드 입니다.
	 * @param map
	 */
	void modifyFinalSalaryDate(Map<String, Object> map);
}
