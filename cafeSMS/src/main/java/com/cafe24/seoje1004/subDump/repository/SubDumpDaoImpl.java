package com.cafe24.seoje1004.subDump.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subDump.model.SubDump;

@Repository
public class SubDumpDaoImpl implements SubDumpDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubDump;
	private final String NS = "com.cafe24.seoje1004.subDump.repository.SubDumpMapper";

	/**
	 * 폐기 등록 메서드 입니다.
	 */
	@Override
	public int addSubDump(Map<String, Object> map) {
		System.out.println("SubDumpDaoImpl addSubDump실행");
		return sqlSessionSubDump.insert(NS+".addSubDump", map);
	}
	/**
	 * 폐기 등록하기전 정보 받아오기
	 */
	@Override
	public SubDump selectSubDump(SubDump subDump) {
		System.out.println("SubDumpDaoImpl selectSubDump실행");
		return sqlSessionSubDump.selectOne(NS+".selectSubDump",subDump);
	}
}
