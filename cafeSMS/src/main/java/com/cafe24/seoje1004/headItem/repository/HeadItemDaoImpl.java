package com.cafe24.seoje1004.headItem.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.headItem.model.HeadItem;
import com.cafe24.seoje1004.headItem.model.HeadSearch;

@Repository
public class HeadItemDaoImpl implements HeadItemDao{

	@Autowired
	private SqlSessionTemplate sqlSessionHeadItem;
	
	private final String NS ="com.cafe24.seoje1004.headItem.repository.HeadItemMapper";
	
	@Override
	public List<HeadItem> viewHeadItemList(HeadSearch headSearch) {
		
		return sqlSessionHeadItem.selectList(NS+".viewHeadItemList",headSearch);
	}

}
