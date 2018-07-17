package com.jb.jbean.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.persistence.ProductMapper;

@Service("ProductServiceImpl")
public class ProductServiceImpl implements ProductService{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<ProductVo> category() {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.category();
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> productAll() {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.productAll();
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> highPrice() {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.highPrice();

		return alist;
	}

	@Override
	public ArrayList<ProductVo> lowPrice() {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.lowPrice();

		return alist;
	}

	@Override
	public ArrayList<BuyVo> productBest() {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<BuyVo> alist = prom.productBest();

		return alist;
	}

	@Override
	public ArrayList<ProductVo> productNew() {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.productNew();

		return alist;
	}

	@Override
	public ArrayList<ProductVo> productList(int cidx) {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.productList(cidx);

		return alist;
	}

	@Override
	public ArrayList<ProductVo> productInfo(int pronum) {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.productInfo(pronum);

		return alist;
	}

	@Override
	public ArrayList<ProductVo> productInfoSize(int pronum) {
		
		ProductMapper prom = sqlSession.getMapper(com.jb.jbean.persistence.ProductMapper.class);
		ArrayList<ProductVo> alist = prom.productInfoSize(pronum);

		return alist;
	}

}
