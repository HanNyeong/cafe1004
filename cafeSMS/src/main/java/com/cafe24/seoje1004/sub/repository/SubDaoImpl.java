package com.cafe24.seoje1004.sub.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.seoje1004.sub.model.Sub;

@Repository
public class SubDaoImpl implements SubDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionSub;
	private final String NS = "com.cafe24.seoje1004.sub.repository.SubMapper";
	
	/**
	 * 가맹을 등록하는 메서드 입니다.
	 * 매개변수로 Sub sub를 받습니다.
	 * Mapper의 addSub에 있는 쿼리를 실행하고 결과를 
	 * int값으로 받아내어 리턴합니다.
	 * @param sub
	 * @return
	 */
	@Override
	public int addSub(Sub sub) {
		System.out.println("SubDaoImpl addSub실행");
		System.out.println(sub);
		return sqlSessionSub.insert(NS+".addSub",sub);
	}
	
	/**
	 * 가맹 하나의 정보를 뽑아내는 메서드 입니다
	 * Mapper의 selectSub에 있는 쿼리를 실행하고 결과를
	 * Sub로 리턴합니다.
	 * @param sub
	 * @return
	 */
	@Override
	public Sub selectSub(Sub sub) {
		System.out.println("SubDaoImpl selectSub실행");	
		return sqlSessionSub.selectOne(NS+".selectSub",sub);
	}
	/**
	 * 가맹 하나의 정보를 수정하는 메서드 입니다.
	 * Mapper의 modifySub에 있는 쿼리를 실행하고 결과를
	 * int로 리턴합니다.
	 * @param sub
	 * @return
	 */
	@Override
	public int modifySub(Sub sub) {
		return sqlSessionSub.update(NS+".modifySub", sub);
	}
	
	/**
	 * 로그인을 처리를 하는 dao메서드입니다.
	 */
	@Override
	public Sub loginSub(Sub sub) {
		System.out.println("SubDaoImpl loginSub실행");
		return sqlSessionSub.selectOne(NS+".loginSub",sub);
	}
	

}
