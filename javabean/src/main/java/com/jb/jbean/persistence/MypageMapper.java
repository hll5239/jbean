package com.jb.jbean.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.jb.jbean.domain.*;

public interface MypageMapper {
	
	public int orderAllCnt(int midx);
	public int paymentBeforeCnt(int midx);
	public int productReadyCnt(int midx);
	public int deliveringCnt(int midx);
	public int deliveredCnt(int midx);
	public ArrayList<BuyVo> myOrder(int midx);
	public ArrayList<BuyVo> myOrderInfo(long oid);
	public ArrayList<ProReviewVo> myReview(int midx);
	public ArrayList<ProQnaVo> myQna(int midx);
	public int orderX(HashMap<String, Object> map);
	public int payX(HashMap<String, Object> map);
	public int deliveryX(HashMap<String, Object> map);
	
}
