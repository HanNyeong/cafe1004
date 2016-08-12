package com.cafe24.seoje1004.subSell.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.util.Chart;

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



	//가맹 판매 마감처리s
	@Override
	public void subSellFinals(SubSell subSell) {
		System.out.println("SubSellDaoImpl subSellFinals 실행");
		sqlSessionSubSell.update(NS+".subSellFinals", subSell);
	}


	//해당 SubSellCode에 해당하는 subSell행을 가져오자
	@Override
	public SubSell selectSubSellBySubSellCode(String subSellCode) {
		System.out.println("SubSellDaoImpl selectSubSellBySubSellCode 실행");
		
		return sqlSessionSubSell.selectOne(NS+".selectSubSellBySubSellCode", subSellCode);
	}


	//회계테이블에 insert
	@Override
	public void subSellAccount(Map<String, Object> map) {
		System.out.println("SubSellDaoImpl subSellAccount 실행");
		sqlSessionSubSell.insert(NS+".subSellAccount", map);
		
	}


	//메뉴리스트를 가져오자
	@Override
	public List<Menu> viewMenuList() {
		System.out.println("SubSellDaoImpl viewMenuList 실행");
		return sqlSessionSubSell.selectList(NS+".viewMenuList");
	}


	//메뉴 차트
	@Override
	public List<Chart> menuChart() {
		System.out.println("SubSellDaoImpl menuChart 실행");
		return sqlSessionSubSell.selectList(NS+".menuChart");
	}

	
}
