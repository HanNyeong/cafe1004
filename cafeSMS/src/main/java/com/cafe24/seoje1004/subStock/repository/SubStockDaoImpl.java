package com.cafe24.seoje1004.subStock.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subStock.model.SubStock;

@Repository
public class SubStockDaoImpl implements SubStockDao{
	/**
	 * 최종수정일 2016-08-06 오성현
	 *	SubStockDao
	 * 
	 */
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubStock;
	
	private final String NS = "com.cafe24.seoje1004.subStock.repository.SubStockMapper";
	
	
	//가맹재고리스트
	@Override
	public List<SubStock> subViewSubStockList(Map<String, Object> map) {
		System.out.println("SubStockDaoImpl subViewSubStockList 실행");
		
		return sqlSessionSubStock.selectList(NS+".subViewSubStockList", map);
	}
	
}
