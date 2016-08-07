package com.cafe24.seoje1004.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.seoje1004.recipe.model.RecipeSearch;
import com.cafe24.seoje1004.recipe.service.RecipeService;
import com.cafe24.seoje1004.sub.model.SubLogin;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	/**
	 * 레시피를 조회하는 컨트롤러입니다.
	 * @param model
	 * @param recipeSearch
	 * @param subLogin
	 * @return
	 */
	@RequestMapping(value="/subViewRecipeList")
	
	public String subViewRecipeList(Model model, RecipeSearch recipeSearch,SubLogin subLogin,
									@RequestParam("menuCode")String menuCode,
									@RequestParam("menuName")String menuName){
		System.out.println("RecipeController subViewRecipeList실행");
		System.out.println(recipeSearch);
		System.out.println(menuCode+"확인작업");
		model.addAttribute("subViewRecipeList", recipeService.subViewRecipeListService(recipeSearch,subLogin,menuCode));
		model.addAttribute("menuCode", menuCode);
		model.addAttribute("menuName",menuName);
		return "/shared/recipe/subViewRecipeList";
	}
}
