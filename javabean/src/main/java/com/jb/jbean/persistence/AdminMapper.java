package com.jb.jbean.persistence;


import java.util.ArrayList;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.domain.SearchCriteria;

public interface AdminMapper {

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
	
	public ArrayList<BuyVo> orderDeliveredList(SearchCriteria scri);
	
	public ArrayList<BuyVo> orderPaymentBeforeList(SearchCriteria scri);
	
	public ArrayList<BuyVo> orderProductReadyList(SearchCriteria scri);
	
	public ArrayList<BuyVo> orderDeliveringList(SearchCriteria scri);
	
	public ArrayList<BuyVo> orderCanlcelList(SearchCriteria scri);
	
	public ArrayList<BuyVo> orderModifyButton(BuyVo buyvo);
	
	public int orderPayModify(BuyVo buyvo);
	public int orderDeliveryModify(BuyVo buyvo);
	
	
}
