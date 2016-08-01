package com.cafe24.seoje1004.subject.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subject.model.Subject;

@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Autowired
	private SqlSessionTemplate sqlSessionSubject;
	
	private final String NS = "com.cafe24.seoje1004.subject.repository.SubjectMapper";
	
	//계정과목 List Dao 0801 박효민
	@Override
	public List<Subject> viewSubjectList(Map<String, Object> map) {
		System.out.println("SubjectDaoImpl//viewSubjectList실행");
		return sqlSessionSubject.selectList(NS+".viewSubject",map);
	}

}
