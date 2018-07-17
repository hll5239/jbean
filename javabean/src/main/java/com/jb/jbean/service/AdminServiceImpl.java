package com.jb.jbean.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.persistence.AdminMapper;


@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService  {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int productInsert(ProductVo pv) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productInsert(pv);
		
		return res;
	}

	@Override
	public ArrayList<ProductVo> productAll() {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ArrayList<ProductVo> alist = msm.productAll();
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> productSelect(ProductVo pv) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		System.out.println("cidx="+pv.getCidx());
		
		ArrayList<ProductVo> alist = msm.productSelect(pv);
			
		return alist;
	}

	@Override
	public ProductVo productModify(int proidx) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ProductVo detail = msm.productModify(proidx);
		
		return detail;
	}
	
	@Override
	public int productUpdate(ProductVo pv) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productUpdate(pv);
		
		return res;
	}

	@Override
	public int productDelete(int proidx) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productDelete(proidx);
		
		return res;
	}

	@Override
	public ArrayList<MemberVo> memberAll() {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ArrayList<MemberVo> mlist = msm.memberAll();
		
		return mlist;
	}
	
	

	

	

	
}
