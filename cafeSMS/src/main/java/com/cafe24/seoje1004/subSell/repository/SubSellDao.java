package com.cafe24.seoje1004.subSell.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.util.Chart;
import com.cafe24.seoje1004.util.Price;

public interface SubSellDao {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSellDao 인터페이스
	 */
	
	
	public List<SubSell> subViewSubSellList(Map<String,Object> map); 	//가맹 판매 조회
	
	public void subSellFinals(SubSell subSell);	//가맹 판매 마감처리s
	
	public SubSell selectSubSellBySubSellCode(String subSellCode);			//해당 SubSellCode에 해당하는 subSell행을 가져오자
	
	public void subSellAccount(Map<String,Object> map);		//회계테이블에 insert 
	
	public List<Menu> viewMenuList(); 	//메뉴리스트를 가져오자
	//메뉴코드 카운트 입니다.
	public List<Chart> menuChart();
	
	void subAddSubSell(SubSell subSell);

	public String selectGroupCode();

	public List<Price> priceChart(String subCode);
}
