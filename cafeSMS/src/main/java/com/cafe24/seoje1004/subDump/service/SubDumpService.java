package com.cafe24.seoje1004.subDump.service;

import com.cafe24.seoje1004.subDump.model.SubDump;

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

}
