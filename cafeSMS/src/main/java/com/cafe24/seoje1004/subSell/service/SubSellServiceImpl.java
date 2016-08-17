package com.cafe24.seoje1004.subSell.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
			addSharedSubAccount.setSubCode(subSell2.getSubCode());
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

		System.out.println("SubSellServiceImpl menuChart실행");
		Map<String,Object> map = new HashMap<>();
		//메뉴 차트 리스트
		map.put("menuChart", subSellDao.menuChart());
		System.out.println(subCode);
		
		int week = 7;	// 일주일
		
		//로그인 성공일시 실행
		if(subCode != "" && subCode !=null){
			//가맹 매출 정보(금액과 날짜를 가져옴)
			List<Price> accounts = subSellDao.priceChart(subCode);
//			System.out.println(accounts);
			//날짜별 매출금액
			Integer[] sumPrice = new Integer[week];
			
			//오늘~1주일전 날짜 
			Calendar[] calendar = new Calendar[week];
			
			//날짜 포맷용
			Date[] date = new Date[week];
			
			//for문에서 날짜 비교용
			String[] fomat = new String[week];
			
			//한국시간구하기
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
			
			for(int i = 0; i<week; i++){
				sumPrice[i] = 0;//0으로 초기화
				calendar[i] = Calendar.getInstance();//현재날짜로 초기화
				calendar[i].add(Calendar.DAY_OF_MONTH, -i);//어제그제엊그제... 구하기
				date[i] = calendar[i].getTime();//구해진날짜 date에 대입
				fomat[i] = mSimpleDateFormat.format(date[i]);//날짜를 string형으로 바꿈
				//date가 일주일전까지 Date 객체 입니다.
				//일주일전까지 날짜가 찍히게 됩니다.
			}
			//가맹매출정보(날짜)를 일주일전까지의 날짜와 비교후 배열에 매출액 담기  
			for(int i = 0; i < accounts.size(); i++){
				
				String RequestDate = accounts.get(i).getSubAccountRequestDate().substring(0, 10);
//				System.out.println(RequestDate);
				for(int j = 0; j < week; j++){
					if(RequestDate.equals(fomat[j])){
						sumPrice[j] += accounts.get(i).getSubAccountPrice();
					}
				}
			}
			//구해진 매출액을 List에 담기
			List<Integer> priceChart = new ArrayList<Integer>();			
			for(int i=0; i<week;i++){
				priceChart.add(sumPrice[i]);
			}
//			System.out.println(priceChart);
			//list를 map에 담기
			map.put("priceChart", priceChart);
		}
		return map;
	}
		
	@Override
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
