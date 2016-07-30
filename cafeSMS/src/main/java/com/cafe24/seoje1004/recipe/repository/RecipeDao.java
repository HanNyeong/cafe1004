package com.cafe24.seoje1004.recipe.repository;

import java.util.List;
import java.util.Map;

import com.cafe24.seoje1004.recipe.model.Recipe;

public interface RecipeDao {
	/**
	 * 레시피 리스트를 조회하는 dao 메서드 입니다.
	 * @param map
	 * @return
	 */
	List<Recipe> subViewRecipeList(Map<String, Object> map);
	
}
