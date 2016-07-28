package com.cafe24.seoje1004.subStaff.service;

import java.util.List;

import com.cafe24.seoje1004.subStaff.model.SubStaff;
import com.cafe24.seoje1004.subStaff.model.SubStaffSearch;

public interface SubStaffService {

	/**
	 * 가맹직원을 등록하는 서비스 메서드입니다.
	 * 등록하고 가맹직원 아이디를 리턴합니다.
	 * @param subStaff
	 * @return
	 */
	void addSubStaffService(SubStaff subStaff);

	/**
	 * 가맹직원 리스트를 리턴하는 서비스 메서드입니다.
	 * @return
	 */
	List<SubStaff> viewSubStaffListService(SubStaffSearch subStaffSearch);

   /**
    * 가맹 직원 수정을 하는 서비스메서드 입니다.
    * @return
    */
   SubStaff selectSubStaffService(SubStaff subStaff);
   /**
    * 가맹 직원 수정을 하는 서비스메서드 입니다.
    * @return
    */
   int subModifySubStaffService(SubStaff subStaff);
   
   /**
    * 본사직원이 가맹직원 등록을 승인하는 서비스 메서드입니다.
    * @param subStaff
    * @return
    */
   int headModifySubStaffByPermitService(SubStaff subStaff);

   /**
    * 가맹직원을 퇴사 처리하는 서비스 메서드 입니다.
	* 매개변수로 가맹직원정보와 탈퇴여부를받아서
	* 탈퇴처리합니다.
	* @param subStaff
	* @return
	*/
   int subModifySubStaffByResignService(SubStaff subStaff);
   
   
   /**
    *  가맹직원 로그인하는 서비스 메서드 입니다.
    *  매개변수로 로그인 정보를 받아서 로그인 성공 유무를 판단하고 
    *  결과를 리턴합니다.
    * @param subStaff
    * @return
    */
   SubStaff loginSubStaffService(SubStaff subStaff);
   /**
    * 직원 급여를 관리하는 서비스 메서드 입니다.
    * 매개변수로 직원정보를 고 가맹정보를 업데이트하고
    * 가맹통합회계 에 등록 합니다.
    * 결과를 int로 리턴합니다.
    * @param subStaff
    * @return
    */
   int subStaffSalaryService(SubStaff subStaff);

}
