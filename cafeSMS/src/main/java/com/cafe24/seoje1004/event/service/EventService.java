package com.cafe24.seoje1004.event.service;

import java.util.List;

import com.cafe24.seoje1004.event.model.Event;
import com.cafe24.seoje1004.event.model.EventSearch;

public interface EventService {

	List<Event> viewEventService(EventSearch eventSearch);

}
