package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.ProductVo;

public interface ProductService {
	
	public ArrayList<ProductVo> category();
	public ArrayList<ProductVo> productAll();
	public ArrayList<ProductVo> highPrice();
	public ArrayList<ProductVo> lowPrice();
	public ArrayList<BuyVo> productBest();
	public ArrayList<ProductVo> productNew();
	public ArrayList<ProductVo> productList(int cidx);
	public ArrayList<ProductVo> productInfo(int pronum);
	public ArrayList<ProductVo> productInfoSize(int pronum);
	
}
