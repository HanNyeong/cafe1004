package com.cafe24.seoje1004.orders.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.headItem.model.HeadItem;

public interface OrdersDao {

	List<HeadItem> viewOrdersInHeadItem(Map<String, Object> map);

}
