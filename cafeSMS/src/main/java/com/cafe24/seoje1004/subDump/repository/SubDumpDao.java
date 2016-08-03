package com.cafe24.seoje1004.subDump.repository;

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

	
}
