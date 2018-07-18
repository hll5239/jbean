package com.jb.jbean.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.domain.OrderVo;
import com.jb.jbean.persistence.OrderMapper;

@Service("OrderServiceImpl")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int orderInsert(OrderVo ov) {
		
		OrderMapper om = sqlSession.getMapper(com.jb.jbean.persistence.OrderMapper.class);
		int res = om.orderInsert(ov);
		
		return res;
	}
	
	@Override
	public MemberVo defaultAddr() {
		
		OrderMapper om = sqlSession.getMapper(com.jb.jbean.persistence.OrderMapper.class);
		MemberVo mv = om.defaultAddr();
		
		return mv;
	}

	@Override
	public int order(BuyVo buyvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BuyVo> orderFinish(int midx, long oid) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
