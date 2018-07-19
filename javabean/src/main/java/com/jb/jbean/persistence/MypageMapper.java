package com.jb.jbean.persistence;

import java.util.ArrayList;

import com.jb.jbean.domain.*;

public interface MypageMapper {
	
	public int orderAllCnt(int midx);
	public int paymentBeforeCnt(int midx);
	public int productReadyCnt(int midx);
	public int deliveringCnt(int midx);
	public int deliveredCnt(int midx);
	public ArrayList<BuyVo> myOrder(int midx);
	public ArrayList<ProReviewVo> myReview(int midx);
	public ArrayList<ProQnaVo> myQna(int midx);
	
}
