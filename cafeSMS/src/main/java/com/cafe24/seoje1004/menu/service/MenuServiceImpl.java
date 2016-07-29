package com.cafe24.seoje1004.menu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.menu.model.MenuSearch;
import com.cafe24.seoje1004.menu.repository.MenuDao;
import com.cafe24.seoje1004.sub.model.SubLogin;
@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuDao menuDao;
	
	/**
	 * 메뉴 리스트를 리턴하는 서비스 메서드입니다.
	 * @return
	 */
	@Override
	public List<Menu> subViewMenuListService(MenuSearch menuSearch, SubLogin subLogin) {
		System.out.println("MenuServiceImpl subViewMenuListService실행");
		System.out.println("MenuServiceImpl subViewMenuListService. 조회 실행");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("menuSearch",menuSearch);
		map.put("subLogin",subLogin);
		
		return menuDao.subViewMenuList(map);
	}



}
