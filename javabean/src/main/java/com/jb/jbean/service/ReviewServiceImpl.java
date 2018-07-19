package com.jb.jbean.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.domain.ProReviewVo;
import com.jb.jbean.persistence.ReviewMapper;


@Service("ReviewServiceImpl")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<ProReviewVo> reviewList(int pronum) {

		ReviewMapper rm = sqlSession.getMapper(com.jb.jbean.persistence.ReviewMapper.class);
		ArrayList<ProReviewVo> av =rm.reviewList(pronum);

		return av;
	}



	@Override
	public int reviewDelete(ProReviewVo prorvo) {
		ReviewMapper rm = sqlSession.getMapper(com.jb.jbean.persistence.ReviewMapper.class);
		
		int res= rm.reviewDelete(prorvo);
		
		return res;
	}

}
