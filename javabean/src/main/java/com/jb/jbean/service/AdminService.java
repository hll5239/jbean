package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.domain.SearchCriteria;

public interface AdminService {

	public int productInsert(ProductVo pv);
	
	public int productUpdate(ProductVo pv);
	
	public ProductVo productModify(int proidx);
	
	public int productDelete(int proidx);
	
	public ArrayList<ProductVo> productAll();
	
	public ArrayList<ProductVo> productSelect(ProductVo pv);
	
	public ArrayList<MemberVo> memberAll();
	
	public ArrayList<MemberVo> memberCare(SearchCriteria scri);
	
	public MemberVo memberModfiyOne(int midx);
	
	public int adminMemberModify(MemberVo mv);
	
	public int adminMemberDelete(int midx);
	
	public int memberOutCnt();
	
	public int memberAllCnt();
	
	public int noReplyCnt();
	
	public int paymentBeforeCnt();
	
	public int productReadyCnt();
	
	public int productCancelCnt();
	
	public int nowOrderAmount();
	
	public int nowPayAmount();
	
	public ArrayList<BuyVo> orderAdmin();
	
	public ArrayList<BuyVo> orderAllList(SearchCriteria scri, int ooidx);
	
	public ArrayList<BuyVo> orderModifyButton(BuyVo buyvo);
	
	public int orderModifyAll(BuyVo buyvo);
}