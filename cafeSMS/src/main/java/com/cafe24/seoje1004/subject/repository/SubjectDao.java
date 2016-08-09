package com.cafe24.seoje1004.subject.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.subject.model.Subject;

public interface SubjectDao {

	List<Subject> viewSubjectList(Map<String, Object> map);

	void add(Map<String, Object> map);

}
