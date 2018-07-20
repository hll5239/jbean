package com.jb.jbean.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.jb.jbean.domain.*;

public interface OrderMapper {
	
	public MemberVo defaultAddr(int midx);
	public int orderInsert(OrderVo ov);
	public int deliveryInsert(BuyVo buyvo);
	public int payInsert(BuyVo buyvo);
	public ArrayList<BuyVo> orderCheck(HashMap<String, Object> map);
	public ArrayList<BuyVo> orderSelect(long oid);

}
