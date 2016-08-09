package com.cafe24.seoje1004.subject.service;

import java.util.List;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.subject.model.SpecificItem;
import com.cafe24.seoje1004.subject.model.Subject;
import com.cafe24.seoje1004.subject.model.SubjectSearch;

public interface SubjectService {

	List<Subject> viewSubjectListService(SubjectSearch subjectSearch);

	void add(SpecificItem specificItem);

}
