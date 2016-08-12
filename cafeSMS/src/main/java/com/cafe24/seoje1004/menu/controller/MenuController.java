package com.cafe24.seoje1004.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.seoje1004.menu.service.MenuService;
import com.cafe24.seoje1004.sub.model.SubLogin;

import com.cafe24.seoje1004.util.Search;

@Controller
public class MenuController {

		@Autowired
		private MenuService menuService;
		
		/**
		 * 메뉴 목록을 조회하는 컨트롤러입니다.
		 * @param model
		 * @param menuSearch
		 * @param subLogin
		 * @return
		 */
		@RequestMapping(value="/subViewMenuList")
		public String subViewMenuList(Model model, Search menuSearch,SubLogin subLogin){
			System.out.println("MenuController subViewMenuList실행");
			System.out.println(menuSearch);
			model.addAttribute("subViewMenuList", menuService.subViewMenuListService(menuSearch, subLogin));
			model.addAttribute("menuSearch",menuSearch);
			return "/shared/menu/subViewMenuList";
		}
}
