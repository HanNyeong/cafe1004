package com.cafe24.seoje1004.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.headItem.model.HeadItem;

@Service
public interface OrdersService {

	List<HeadItem> viewOrdersInHeadItemService(String hItemCode);

}
