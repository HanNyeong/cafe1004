package com.cafe24.seoje1004.subSell.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap; 
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.subAccount.model.AddSharedSubAccount;
import com.cafe24.seoje1004.subSell.model.SubSell;
import com.cafe24.seoje1004.subSell.model.SubSellGroup;
import com.cafe24.seoje1004.subSell.model.SubSells;
import com.cafe24.seoje1004.subSell.repository.SubSellDao;
import com.cafe24.seoje1004.util.Price;
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
	public List<SubSell> subViewSubSellList(Search search,String subCode,String YN) {
		System.out.println("SubSellServiceImpl subViewSubSellList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("subCode", subCode);
		map.put("YN", YN);
		return subSellDao.subViewSubSellList(map);
	}

	
	
	//가맹 판매 마감처리s
	@Override
	public void subSellFinals(SubSells subSells) {
		System.out.println("SubSellServiceImpl subSellFinals 실행");
		
		/*for(int i=0; i<subSells.getSubSellCode().size(); i++){*/
		for(int i=0; i<subSells.getSubSellCode().size(); i++){	
			//판매테이블 내부의 final컬럼 update
			SubSell subSell = new SubSell();
			System.out.println("subSell : "+subSells.getSubSellCode().get(i));
			subSell.setSubSellCode(subSells.getSubSellCode().get(i));
			subSellDao.subSellFinals(subSell);
			
			//해당 SubSellCode에 해당하는 subSell행을 가져오자
			SubSell subSell2 = new SubSell();
			subSell2 = 	subSellDao.selectSubSellBySubSellCode(subSells.getSubSellCode().get(i));
			System.out.println("subSell2 : " + subSell2);
			
			//회계테이블에 insert 
		
			AddSharedSubAccount addSharedSubAccount = new AddSharedSubAccount();
			addSharedSubAccount.setSubAccountFlow("입금");
			addSharedSubAccount.setSubAccountPrice(subSell2.getSubSellPracticalSellingPrice());
			addSharedSubAccount.setSubAccountDetail("상품 판매");
			addSharedSubAccount.setSubCode(subSell2.getSubSellCode());
			addSharedSubAccount.setTotalAccountGroup(subSell2.getTotalAccountGroup());
			addSharedSubAccount.setSubjectCode("상품 판매");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("addSharedSubAccount", addSharedSubAccount);
			
			subSellDao.subSellAccount(map);
			
			
		}
	}


	//메뉴리스트를 가져오자
	@Override
	public List<Menu> viewMenuList() {
		System.out.println("SubSellServiceImpl viewMenuList 실행");
		return subSellDao.viewMenuList();
	}


	//메뉴 차트 + 매출차트
		@Override
		public Map<String,Object> menuChart(String subCode){

			Date memDelStartDate; // 삭제 시작일
			Date currentDate; // 현재날짜 Date
			String oTime = ""; // 현재날짜
			System.out.println("SubSellServiceImpl menuChart실행");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("menuChart", subSellDao.menuChart());
			System.out.println(subCode);
			if(subCode != ""){
				List<Price> accounts = subSellDao.priceChart(subCode);
				System.out.println(accounts);
				Integer sumPrice1 = 0;
				Integer sumPrice2 = 0;
				Integer sumPrice3 = 0;
				Integer sumPrice4 = 0;
				Integer sumPrice5 = 0;
				Integer sumPrice6 = 0;
				Integer sumPrice7 = 0;
				for(int i = 0; i < accounts.size(); i++){
					SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
					Date currentTime = new Date();
					oTime = mSimpleDateFormat.format ( currentTime ); //현재시간 (String)
					System.out.println(accounts.get(i).getSubAccountRequestDate());
					System.out.println("확인");
					try {
						memDelStartDate = mSimpleDateFormat.parse( accounts.get(i).getSubAccountRequestDate());
						currentDate =  mSimpleDateFormat.parse( oTime );
						int compare = currentDate.compareTo( memDelStartDate );
						if(compare==0){
							System.out.println(sumPrice1+"=========1번");
							sumPrice1 += accounts.get(i).getSubAccountPrice();
							System.out.println(sumPrice1);
						}else if(compare-1==0){
							sumPrice2 += accounts.get(i).getSubAccountPrice();
						}else if(compare-2==0){
							sumPrice3 += accounts.get(i).getSubAccountPrice();
						}else if(compare-3==0){
							sumPrice4 += accounts.get(i).getSubAccountPrice();
						}else if(compare-4==0){
							sumPrice5 += accounts.get(i).getSubAccountPrice();
						}else if(compare-5==0){
							sumPrice6 += accounts.get(i).getSubAccountPrice();
						}else if(compare-6==0){
							sumPrice7 += accounts.get(i).getSubAccountPrice();
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
										
					// 날짜비교
				}
				
				List<Integer> priceChart = new ArrayList<Integer>();
				priceChart.add(sumPrice1);
				priceChart.add(sumPrice2);
				priceChart.add(sumPrice3);
				priceChart.add(sumPrice4);
				priceChart.add(sumPrice5);
				priceChart.add(sumPrice6);
				priceChart.add(sumPrice7);
				System.out.println(priceChart);
				map.put("priceChart", priceChart);
			}
			return map;
		}
		
	
	public void subAddSubSellService(SubSellGroup subSellGroup){
		SubSell subSell = new SubSell();
		subSell.setSubSellGroup(subSellDao.selectGroupCode());
		subSell.setPayMethod(subSellGroup.getPayMethod());
		subSell.setSubCode(subSellGroup.getSubCode().get(0));
		for(int i = 0; i<subSellGroup.getMenuCode().size(); i++){
			double d = subSellGroup.getMenuSellingPrice().get(i);
			subSell.setSubSellPracticalSellingPrice((int)d);
			subSell.setSubSellCost(subSellGroup.getMenuIngrePrice().get(i));
			subSell.setEventCode(subSellGroup.getEventCode().get(i));
			subSell.setMenuCode(subSellGroup.getMenuCode().get(i));
			for(int j = 0; j<subSellGroup.getQuantity().get(i); j++){
				subSellDao.subAddSubSell(subSell);
				
			}
		}
	}
	
	
}
