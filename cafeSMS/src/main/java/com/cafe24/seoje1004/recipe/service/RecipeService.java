package com.cafe24.seoje1004.recipe.service;

import com.cafe24.seoje1004.recipe.model.RecipeSearch;
import com.cafe24.seoje1004.sub.model.SubLogin;

public interface RecipeService {
	/**
	 * 레시피 리스트를 리턴하는 서비스 메서드 입니다.
	 * @param recipeSearch
	 * @param subLogin
	 * @return
	 */
	Object subViewRecipeListService(RecipeSearch recipeSearch, SubLogin subLogin);

}
