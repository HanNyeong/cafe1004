package com.cafe24.seoje1004.subject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subject.model.SpecificItem;
import com.cafe24.seoje1004.subject.model.Subject;
import com.cafe24.seoje1004.subject.repository.SubjectDao;
import com.cafe24.seoje1004.util.Search;


@Service
public class SubjectServiceImpl implements SubjectService{
	@Autowired
	private SubjectDao subjectDao;

	@Override
	public List<Subject> viewSubjectListService(Search subjectSearch) {
		System.out.println("SubjectServiceImpl//viewSubjectListService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subjectSearch", subjectSearch);
		
		return subjectDao.viewSubjectList(map);
	}

	@Override
	public void add(SpecificItem specificItem) {
		Map<String,Object> map = new HashMap<String,Object>();
		for(int i = 0; i<100 ; i++) {
			specificItem.setHeadStaffRegistration("head_staff_id1");
			specificItem.setHeadItemCode("head_item_code4");
			map.put("specificItem", specificItem);
			subjectDao.add(map);
		}
		
	}

}
