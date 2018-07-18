package com.jb.jbean.service;

public interface MypageService {
	
	public int orderAllCnt(int midx);
	public int paymentBeforeCnt(int midx);
	public int productReadyCnt(int midx);
	public int deliveringCnt(int midx);
	public int deliveredCnt(int midx);
	
}
