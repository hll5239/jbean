package com.jb.jbean.persistence;

import java.util.ArrayList;

import com.jb.jbean.domain.*;

public interface OrderMapper {
	
	public MemberVo defaultAddr();
	public int orderInsert(OrderVo ov);
	public int deliveryInsert(BuyVo buyv);
	public int payInsert(BuyVo buyv);
	public ArrayList<BuyVo> orderFinish(int midx, long oid);

}
