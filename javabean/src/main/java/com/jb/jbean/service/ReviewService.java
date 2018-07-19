package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.ProReviewVo;

public interface ReviewService {

	public ArrayList<ProReviewVo> reviewList(int pronum);
	
	public int reviewDelete(ProReviewVo prorvo);
	
	public int reviewWrite(ProReviewVo prorvo);
}
