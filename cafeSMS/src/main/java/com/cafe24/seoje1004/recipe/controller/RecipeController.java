package com.cafe24.seoje1004.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String subViewRecipeList(Model model, RecipeSearch recipeSearch,SubLogin subLogin){
		System.out.println("RecipeController subViewRecipeList실행");
		System.out.println(recipeSearch);
		model.addAttribute("subViewRecipeList", recipeService.subViewRecipeListService(recipeSearch,subLogin));
		return "/shared/recipe/subViewRecipeList";
	}

}