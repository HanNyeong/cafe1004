package com.cafe24.seoje1004.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.seoje1004.recipe.model.Recipe;
import com.cafe24.seoje1004.recipe.repository.RecipeDao;
import com.cafe24.seoje1004.sub.model.SubLogin;
import com.cafe24.seoje1004.util.Search;


@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeDao recipeDao;
	/**
	 * 레시피 리스트를 리턴하는 서비스 메서드입니다.
	 * @param recipeSearch
	 * @param subLogin
	 * @return
	 */
	@Override
	public List<Recipe> subViewRecipeListService(Search recipeSearch, SubLogin subLogin, String menuCode){
		System.out.println("RecipeServiceImpl subViewRecipeListService실행");
		System.out.println("RecipeServiceImpl subViewRecipeListService. 조회 실행");
	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recipeSearch",recipeSearch);
		map.put("subLogin",subLogin);
		map.put("menuCode", menuCode);
		
		return recipeDao.subViewRecipeList(map);
	}
}
