package com.cafe24.seoje1004.returns.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.returns.model.Returns;

@Repository
public class ReturnsDaoImpl implements ReturnsDao {
	/**
	 * 2016-08-02 오성현
	 * ReturnsDao 
	 */
	private final String NS ="com.cafe24.seoje1004.returns.repository.ReturnsMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionReturns;
	
	
	
	//가맹측 반품상품관리 조회
	@Override
	public List<Returns> subViewReturnsList(Map<String, Object> map) {
		System.out.println("ReturnsDaoImpl subViewReturnsList 실행");
		return sqlSessionReturns.selectList(NS+".subViewReturnsList", map);
	}
	
}
