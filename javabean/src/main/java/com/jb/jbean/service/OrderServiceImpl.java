package com.jb.jbean.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public MemberVo defaultAddr(int midx) {
		
		OrderMapper om = sqlSession.getMapper(com.jb.jbean.persistence.OrderMapper.class);
		MemberVo mv = om.defaultAddr(midx);
		
		return mv;
	}


	@Override
	public ArrayList<BuyVo> orderCheck(int midx, long oid) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("midx", midx);
		map.put("oid", oid);
		
		OrderMapper om = sqlSession.getMapper(com.jb.jbean.persistence.OrderMapper.class);
		ArrayList<BuyVo> alist = om.orderCheck(map);
		
		return alist;
	}

	@Override
	public ArrayList<BuyVo> orderSelect(long oid) {

		OrderMapper om = sqlSession.getMapper(com.jb.jbean.persistence.OrderMapper.class);
		ArrayList<BuyVo> alist = om.orderSelect(oid);
		
		return alist;
	}
	
	@Transactional
	@Override
	public int orderFinish(BuyVo buyvo) {
		
		OrderMapper om = sqlSession.getMapper(com.jb.jbean.persistence.OrderMapper.class);
		 
		 int res = om.deliveryInsert(buyvo);
		 om.payInsert(buyvo);
		 
		return res;
	}



	
	
}
