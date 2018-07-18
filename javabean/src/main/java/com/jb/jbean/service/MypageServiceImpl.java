package com.jb.jbean.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.persistence.MypageMapper;


@Service("MypageServiceImpl")
public class MypageServiceImpl implements MypageService  {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int orderAllCnt(int midx) {
		
		MypageMapper mm = sqlSession.getMapper(com.jb.jbean.persistence.MypageMapper.class);
		int res = mm.orderAllCnt(midx);
		
		return res;
	}

	@Override
	public int paymentBeforeCnt(int midx) {
		
		MypageMapper mm = sqlSession.getMapper(com.jb.jbean.persistence.MypageMapper.class);
		int res = mm.paymentBeforeCnt(midx);
		
		return res;
	}

	@Override
	public int productReadyCnt(int midx) {
		
		MypageMapper mm = sqlSession.getMapper(com.jb.jbean.persistence.MypageMapper.class);
		int res = mm.productReadyCnt(midx);
		
		return res;
	}

	@Override
	public int deliveringCnt(int midx) {
		
		MypageMapper mm = sqlSession.getMapper(com.jb.jbean.persistence.MypageMapper.class);
		int res = mm.deliveringCnt(midx);
	
		return res;
	}

	@Override
	public int deliveredCnt(int midx) {
		
		MypageMapper mm = sqlSession.getMapper(com.jb.jbean.persistence.MypageMapper.class);
		int res = mm.deliveredCnt(midx);
		
		return res;
	}



	
}
