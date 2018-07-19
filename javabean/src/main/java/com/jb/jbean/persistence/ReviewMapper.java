package com.jb.jbean.persistence;

import java.util.ArrayList;

import com.jb.jbean.domain.ProReviewVo;

public interface ReviewMapper {

	public ArrayList<ProReviewVo> reviewList(int pronum);
	
	public int reviewDelete(ProReviewVo prorvo);
	
	public int reviewWrite(ProReviewVo prorvo);
	
}
