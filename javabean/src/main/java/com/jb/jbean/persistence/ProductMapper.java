package com.jb.jbean.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.ProQnaVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.domain.QnaVo;

public interface ProductMapper {
	
	public ArrayList<ProductVo> category();
	public ArrayList<ProductVo> productAll();
	public ArrayList<ProductVo> highPrice();
	public ArrayList<ProductVo> lowPrice();
	public ArrayList<BuyVo> productBest();
	public ArrayList<ProductVo> productNew();
	public ArrayList<ProductVo> productList(int cidx);
	public ArrayList<ProductVo> productInfo(int pronum);
	
	public ArrayList<ProQnaVo> qnaList(int pronum);
	public int qnaWrite(ProQnaVo proqvo);
	public int qnaMemberDelete(int qidx);
	public int qnaAdminDelete(int qidx);
	
	public int qnaReplyWrite(HashMap <String, Object> map);
}
