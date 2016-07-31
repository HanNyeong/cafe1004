package com.cafe24.seoje1004.headItem.service;

import java.util.List;

import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.headItem.model.HeadItemSearch;

public interface HeadItemService {
	/**
	 * 
	 * @param headSearch
	 * @return
	 */
	List<HeadItem> viewHeadItemListService(HeadItemSearch headItemSearch);

}
