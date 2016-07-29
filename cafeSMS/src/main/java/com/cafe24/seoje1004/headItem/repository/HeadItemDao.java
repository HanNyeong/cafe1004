package com.cafe24.seoje1004.headItem.repository;

import java.util.List;

import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.headItem.model.HeadSearch;

public interface HeadItemDao {

	List<HeadItem> viewHeadItemList(HeadSearch headSearch);

}
