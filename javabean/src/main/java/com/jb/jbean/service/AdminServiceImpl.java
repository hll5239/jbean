package com.jb.jbean.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.persistence.AdminMapper;


@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService  {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int productInsert(ProductVo pv) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productInsert(pv);
		
		return res;
	}

	
}
