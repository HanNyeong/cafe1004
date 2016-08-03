package com.cafe24.seoje1004.subDump.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.subDump.model.SubDump;

public interface SubDumpDao {

	/**
	 * 폐기 등록하는 dao 메서드(GET)
	 * @param subDump
	 * @return
	 */
	SubDump selectSubDump(SubDump subDump);
	/**
	 * 폐기를 등록하는 dao 메서드(POST)
	 * @param map
	 * @return
	 */
	int addSubDump(Map<String, Object> map);
	
	/**
	 * 폐기 리스트를 조회하는 dao 메서드 입니다.
	 * 매개변수로 검색조건(Search)와 SubDump를 받음
	 * @param map
	 * @return
	 */
	List<SubDump> viewSubDumpList(Map<String, Object> map);

	
}
