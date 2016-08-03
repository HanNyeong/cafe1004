package com.cafe24.seoje1004.subDump.service;

import java.util.List;

import com.cafe24.seoje1004.subDump.model.SubDump;
import com.cafe24.seoje1004.subDump.model.SubDumpSearch;

public interface SubDumpService {
	
	/**
	 * 폐기를 등록하는 서비스 메서드 입니다.(GET)
	 * @param subDump
	 * @return
	 */
	SubDump selectSubDumpService(SubDump subDump);

	/**
	 * 폐기를 등록하는 서비스 메서드 입니다.(POST)
	 * @param subDump
	 * @return
	 */
	int addSubDumpService(SubDump subDump);
	
	/**
	 * 폐기 관리 리스트를 리턴하는 서비스 메서드 입니다.
	 * @param subDumpSearch
	 * @param subDump
	 * @return
	 */
	List<SubDump> viewSubDumpListService(SubDumpSearch subDumpSearch, SubDump subDump);

}
