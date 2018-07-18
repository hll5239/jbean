package com.jb.jbean.persistence;


import java.util.ArrayList;

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
	
}