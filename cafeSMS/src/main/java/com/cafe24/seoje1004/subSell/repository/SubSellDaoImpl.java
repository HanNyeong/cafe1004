package com.cafe24.seoje1004.subSell.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.subSell.model.SubSell;

@Repository
public class SubSellDaoImpl implements SubSellDao {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSellDao 
	 */
	
	@Autowired
	private SqlSessionTemplate sqlSessionSubSell;
	
	private final String NS = "com.cafe24.seoje1004.subSell.repository.SubSellMapper";

	
	//가맹 판매 조회
	@Override
	public List<SubSell> subViewSubSellList(Map<String, Object> map) {
		System.out.println("SubSellDaoImpl subViewSubSellList 실행");
		return sqlSessionSubSell.selectList(NS+".subViewSubSellList", map);
	}

	//가맹 판매 마감처리
	@Override
	public void subSellFinal(String subSellCode) {
		System.out.println("SubSellDaoImpl subSellFinal 실행");
		sqlSessionSubSell.update(NS+".subSellFinal", subSellCode);
	}
	
}
