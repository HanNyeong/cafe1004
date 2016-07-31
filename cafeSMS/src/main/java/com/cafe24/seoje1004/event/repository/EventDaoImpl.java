package com.cafe24.seoje1004.event.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.event.model.Event;

@Repository
public class EventDaoImpl implements EventDao{

	@Autowired
	private SqlSessionTemplate sqlSessionEvent;
	
	private final String NS = "com.cafe24.seoje1004.event.repository.EventMapper";
	
	@Override
	public List<Event> viewEvent(Map<String, Object> map) {
		System.out.println("EventDaoImpl//viewEvent실행");
		return sqlSessionEvent.selectList(NS+".viewEventList",map);
	}

}
