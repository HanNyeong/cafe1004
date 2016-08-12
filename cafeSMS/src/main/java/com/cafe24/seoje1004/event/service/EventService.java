package com.cafe24.seoje1004.event.service;

import java.util.List;

import com.cafe24.seoje1004.event.model.Event;
import com.cafe24.seoje1004.util.Search;


public interface EventService {

	List<Event> viewEventService(Search eventSearch);

}
