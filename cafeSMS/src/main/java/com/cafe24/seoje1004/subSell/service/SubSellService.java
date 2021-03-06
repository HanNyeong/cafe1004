package com.cafe24.seoje1004.subSell.service;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.subSell.model.SubSellGroup;
import com.cafe24.seoje1004.subSell.model.SubSells;
import com.cafe24.seoje1004.util.Search;

public interface SubSellService {
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSellService 인터페이스
	 */
	
	public List<SubSell> subViewSubSellList(Search search,String subCode,String YN); 	//가맹 판매 조회[승인처리리스트]
	
	public void subSellFinals(SubSells subSells);		//가맹 판매 마감처리s
	
	
	public List<Menu> viewMenuList(); 		//메뉴리스트를 가져오자

	//메뉴 코드 chart 만들때 count 구하는 서비스입니다.
	public Map<String,Object> menuChart(String subCode);
	
	//메뉴 차트 + 매출차트
	void subAddSubSellService(SubSellGroup subSellGroup);
}
