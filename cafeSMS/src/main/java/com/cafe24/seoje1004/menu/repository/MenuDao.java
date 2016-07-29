package com.cafe24.seoje1004.menu.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.menu.model.Menu;

public interface MenuDao {
	
	/**
	 * 메뉴 리스트를 조회하는 dao 메서드 입니다.
	 * @param map
	 * @return
	 */
	List<Menu> subViewMenuList(Map<String, Object> map);


}
