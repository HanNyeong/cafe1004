package com.cafe24.seoje1004.menu.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.menu.model.Menu;
@Repository
public class MenuDaoImpl implements MenuDao{

	@Autowired
	private SqlSessionTemplate sqlSessionMenu;
	private final String NS = "com.cafe24.seoje1004.menu.repository.MenuMapper";
	/**
	 * 메뉴 리스트 조회 메서드 입니다.
	 */
	@Override
	public List<Menu> subViewMenuList(Map<String, Object> map) {
		System.out.println("MenuDaoImpl subViewMenuList실행");
		return sqlSessionMenu.selectList(NS+".subViewMenuList",map);
	}

}
