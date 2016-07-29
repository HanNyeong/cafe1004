package com.cafe24.seoje1004.headItem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.headItem.model.HeadSearch;
import com.cafe24.seoje1004.headItem.repository.HeadItemDao;

@Service
public class HeadItemServiceImpl implements HeadItemService{

	@Autowired
	private HeadItemDao headItemDao;
	
	@Override
	public List<HeadItem> viewHeadItemListService(HeadSearch headSearch) {
		System.out.println("HeadItemServiceImpl viewHeadItemListService실행");
		System.out.println(headSearch);
		return headItemDao.viewHeadItemList(headSearch);
	}

}
