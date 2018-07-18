package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.*;

public interface OrderService {
	
	public int orderInsert(OrderVo ov);
	public MemberVo defaultAddr();
	public int order(BuyVo buyvo);
	public ArrayList<BuyVo> orderFinish(int midx, long oid);
}
