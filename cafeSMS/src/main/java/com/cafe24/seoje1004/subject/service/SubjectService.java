package com.cafe24.seoje1004.subject.service;

import java.util.List;

import com.cafe24.seoje1004.subject.model.SpecificItem;
import com.cafe24.seoje1004.subject.model.Subject;
import com.cafe24.seoje1004.util.Search;

public interface SubjectService {

	List<Subject> viewSubjectListService(Search subjectSearch);

	void add(SpecificItem specificItem);

}
