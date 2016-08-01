package com.cafe24.seoje1004.subject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subject.model.Subject;
import com.cafe24.seoje1004.subject.model.SubjectSearch;
import com.cafe24.seoje1004.subject.repository.SubjectDao;

@Service
public class SubjectServiceImpl implements SubjectService{
	@Autowired
	private SubjectDao subjectDao;

	@Override
	public List<Subject> viewSubjectListService(SubjectSearch subjectSearch) {
		System.out.println("SubjectServiceImpl//viewSubjectListService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subjectSearch", subjectSearch);
		
		return subjectDao.viewSubjectList(map);
	}

}
