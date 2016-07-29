package com.cafe24.seoje1004.menu.service;

import java.util.List;

import com.cafe24.seoje1004.menu.model.Menu;
import com.cafe24.seoje1004.menu.model.MenuSearch;
import com.cafe24.seoje1004.sub.model.SubLogin;

public interface MenuService {

	/**
	 * 메뉴 리스트를 리턴하는  서비스 메서드 입니다.
	 * @param menuSearch
	 * @param subLogin
	 * @return
	 */
	List<Menu> subViewMenuListService(MenuSearch menuSearch,SubLogin subLogin);

}
