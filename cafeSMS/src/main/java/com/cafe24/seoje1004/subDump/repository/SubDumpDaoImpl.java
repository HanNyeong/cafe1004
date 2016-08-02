package com.cafe24.seoje1004.subDump.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubDumpDaoImpl implements SubDumpDao {
	@Autowired
	private SqlSessionTemplate sqlSessionSubDump;
	
	private final String NS = "com.cafe24.seoje1004.subDump.repository.SubDumpMapper";
}
