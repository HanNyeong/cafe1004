package com.cafe24.seoje1004.event.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.event.model.Event;

public interface EventDao {

	List<Event> viewEvent(Map<String, Object> map);

}
