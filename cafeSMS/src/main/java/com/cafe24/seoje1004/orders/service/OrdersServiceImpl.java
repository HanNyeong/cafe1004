package com.cafe24.seoje1004.orders.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.repository.OrdersDao;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersDao ordersDao;
	@Override
	public List<HeadItem> viewOrdersInHeadItemService(String hItemCode) {
		System.out.println("OrdersServiceImpl//viewviewOrdersInHeadItemService실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("hItemCode", hItemCode);
		return ordersDao.viewOrdersInHeadItem(map);
	}

}
