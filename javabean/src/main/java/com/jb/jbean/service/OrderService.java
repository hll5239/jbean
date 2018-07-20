package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.*;

public interface OrderService {
	
	public int orderInsert(OrderVo ov);
	public MemberVo defaultAddr(int midx);
	public ArrayList<BuyVo> orderCheck(int midx, long oid);
	public ArrayList<BuyVo> orderSelect(long oid);
	public int orderFinish(BuyVo buyvo);
}
