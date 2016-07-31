package com.cafe24.seoje1004.headItem.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.headItem.model.HeadItem;

@Repository
public class HeadItemDaoImpl implements HeadItemDao{

	@Autowired
	private SqlSessionTemplate sqlSessionHeadItem;
	
	private final String NS ="com.cafe24.seoje1004.headItem.repository.HeadItemMapper";
	
	@Override
	public List<HeadItem> viewHeadItemList(Map<String, Object> map) {
		
		return sqlSessionHeadItem.selectList(NS+".viewHeadItemList",map);
	}

}
