package com.cafe24.seoje1004.recipe.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.recipe.model.Recipe;

@Repository
public class RecipeDaoImpl implements RecipeDao{
	@Autowired
	private SqlSessionTemplate sqlSessionRecipe;
	private final String NS = "com.cafe24.seoje1004.recipe.repository.RecipeMapper";
	/**
	 * 레시피 리스트 조회 메서드 입니다.
	 */
	@Override
	public List<Recipe> subViewRecipeList(Map<String, Object> map) {
		System.out.println("RecipeDaoImpl subViewRecipeList실행");
		return sqlSessionRecipe.selectList(NS+".subViewRecipeList",map);
	}

}
