package com.cafe24.seoje1004.recipe.service;

import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.util.Search;


public interface RecipeService {

	/**
	 * 레시피 리스트를 리턴하는 서비스 메서드 입니다.
	 * @param recipeSearch
	 * @param subLogin
	 * @param menuCode
	 * @return
	 */
	Object subViewRecipeListService(Search recipeSearch, SubLogin subLogin, String menuCode);
}
