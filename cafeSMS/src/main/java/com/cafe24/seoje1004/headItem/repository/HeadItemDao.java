package com.cafe24.seoje1004.headItem.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.headItem.model.HeadItem;

public interface HeadItemDao {

	List<HeadItem> viewHeadItemList(Map<String, Object> map);

}
