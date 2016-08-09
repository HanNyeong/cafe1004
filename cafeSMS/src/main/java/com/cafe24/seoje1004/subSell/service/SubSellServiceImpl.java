package com.cafe24.seoje1004.subSell.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.subSell.model.SubSells;
import com.cafe24.seoje1004.subSell.repository.SubSellDao;
import com.cafe24.seoje1004.util.Search;

@Service
public class SubSellServiceImpl implements SubSellService{
	/**
	 * 최종수정일 2016-08-08 오성현
	 * SubSellService
	 * 
	 */
	
	@Autowired
	SubSellDao subSellDao;
	
	
	//가맹 판매 조회
	@Override
	public List<SubSell> subViewSubSellList(Search search,String subCode) {
		System.out.println("SubSellServiceImpl subViewSubSellList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("subCode", subCode);
		return subSellDao.subViewSubSellList(map);
	}

	
	
	//가맹 판매 마감처리s
	@Override
	public void subSellFinals(SubSells subSells) {
		System.out.println("SubSellServiceImpl subSellFinals 실행");
		
		for(int i=0; i<subSells.getSubSellCode().size(); i++){
			SubSell subSell = new SubSell();
			subSell.setSubSellCode(subSells.getSubSellCode().get(i));
			subSellDao.subSellFinals(subSell);
		}
	}

	
	
}
