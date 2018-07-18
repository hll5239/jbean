package com.jb.jbean.persistence;

import java.util.ArrayList;

import com.jb.jbean.domain.*;

public interface OrderMapper {
	
	public MemberVo defaultAddr();
	public int orderInsert(BuyVo buyvo);
	public int deliveryInsert(BuyVo buyvo);
	public int payInsert(BuyVo buyvo);
	public ArrayList<BuyVo> orderFinish(int midx, long oid);

}
