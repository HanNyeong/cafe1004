package com.cafe24.seoje1004.event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.event.model.Event;
import com.cafe24.seoje1004.event.repository.EventDao;
import com.cafe24.seoje1004.util.Search;


@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDao eventDao;
	@Override
	public List<Event> viewEventService(Search eventSearch) {
		System.out.println("EventServiceImpl//viewEventService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventSearch", eventSearch);
		return eventDao.viewEvent(map);
	}

}
