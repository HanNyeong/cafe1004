package com.cafe24.seoje1004.headItem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.headItem.repository.HeadItemDao;

import com.cafe24.seoje1004.util.Search;

@Service
public class HeadItemServiceImpl implements HeadItemService{

	@Autowired
	private HeadItemDao headItemDao;
	
	@Override
	public List<HeadItem> viewHeadItemListService(Search headItemSearch) {
		System.out.println("HeadItemServiceImpl viewHeadItemListService실행");
		System.out.println(headItemSearch);
		// 1. 나중에 페이징을 위한 맵 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("headItemSearch", headItemSearch);
		return headItemDao.viewHeadItemList(map);
	}

}
