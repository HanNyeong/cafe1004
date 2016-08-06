package com.cafe24.seoje1004.orders.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.cart.model.CartDetail;
import com.cafe24.seoje1004.cart.model.CartsDetail;
import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.orders.model.Orders;

@Repository
public class OrdersDaoImpl implements OrdersDao{
	@Autowired
	private SqlSessionTemplate sqlSessionOrders;
	
	private final String NS = "com.cafe24.seoje1004.orders.repository.OrdersMapper";
	//장바구니에서 체크된 cartList 정보확인 Dao
	@Override
	public CartDetail viewOrdersInCart(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//viewOrdersInCart");
		return sqlSessionOrders.selectOne(NS+".viewOrdersInCart",map);
	}
	//orders List Dao
	@Override
	public List<Orders> viewOrdersList(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//viewOrdersList");
		return sqlSessionOrders.selectList(NS+".viewOrdersList",map);
	}
	
	//orders add
	@Override
	public void addOrders(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//addOrders실행");
		sqlSessionOrders.insert(NS+".addOrders",map);
	}
	//cart del
	@Override
	public void addDelivery(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//addDelivery실행");
		sqlSessionOrders.insert(NS+".delCartForAddOrders",map);
	}
	//delivery add
	@Override
	public void delCart(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//delCart실행");
		sqlSessionOrders.insert(NS+".addDeliveryForAddOrders",map);
	}
	/*//selec specific
	@Override
	public void selectspecific(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//selectspecific실행");
		sqlSessionOrders.selectOne(NS+".selectSpecificAddOrders",map);
	}*/
	//주문그룹코드 생성 쿼리
	@Override
	public String selectOrdersGroupCode(){
		return sqlSessionOrders.selectOne(NS+".selectOrdersGroupCode");
	}
	//주문코드 생성쿼리 for DeliveryAdd
	@Override
	public String selectOrdersCode() {
		return sqlSessionOrders.selectOne(NS+".selectOrdersCode");
	}
	@Override
	public void modifyOrders(Map<String, Object> map) {
		System.out.println("OrdersDaoImpl//modifyOrders실행");
		sqlSessionOrders.update(NS+".updateOrdersPay",map);
	}
	//발주 취소
	@Override
	public void subDeleteOrdersCancel(Orders orders) {
		System.out.println("OrdersDaoImpl//subModifyOrdersCancel실행");
		sqlSessionOrders.delete(NS+".subDeleteOrdersCancel",orders);
	}
	
	
	
	
	

}
