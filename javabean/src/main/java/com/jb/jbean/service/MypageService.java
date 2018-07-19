package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.*;

public interface MypageService {
	
	public int orderAllCnt(int midx);
	public int paymentBeforeCnt(int midx);
	public int productReadyCnt(int midx);
	public int deliveringCnt(int midx);
	public int deliveredCnt(int midx);
	public ArrayList<BuyVo> myOrder(int midx);
	public ArrayList<BuyVo> myOrderInfo(long oid);
	public ArrayList<ProReviewVo> myReview(int midx);
	public ArrayList<ProQnaVo> myQna(int midx);
	
}
