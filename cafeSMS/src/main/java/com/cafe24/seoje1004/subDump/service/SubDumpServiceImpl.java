package com.cafe24.seoje1004.subDump.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subDump.model.SubDump;
import com.cafe24.seoje1004.subDump.repository.SubDumpDao;
import com.cafe24.seoje1004.util.Search;

@Service
public class SubDumpServiceImpl implements SubDumpService {

	@Autowired
	private SubDumpDao subDumpDao;

	/**
	 * 폐기를 등록하는 서비스 메서드 입니다.(GET)
	 */
	@Override
	public SubDump selectSubDumpService(SubDump subDump) {
		 System.out.println("SubDumpServiceImpl selectSubDumpService실행");
	     System.out.println(subDump);
		return subDumpDao.selectSubDump(subDump);
	}

	/**
	 * 폐기를 등록하는 서비스 메서드 입니다.(POST)
	 */
	@Override
	public int addSubDumpService(SubDump subDump) {
		System.out.println("SubDumpServiceImpl addSubDumpService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subDump", subDump);
		return subDumpDao.addSubDump(map);
	}
	
	/**
	 * 폐기 리스트를 리턴하는 서비스 메서드 입니다.
	 */
	@Override
	public List<SubDump> viewSubDumpListService(Search subDumpSearch, SubDump subDump) {
		System.out.println("SubDumpServiceImpl viewSubDumpListService실행");
		System.out.println("SubDumpServiceImpl viewSubDumpListService. 조회 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subDumpSearch", subDumpSearch);
		map.put("subDump", subDump);
		return subDumpDao.viewSubDumpList(map);
	}


}
