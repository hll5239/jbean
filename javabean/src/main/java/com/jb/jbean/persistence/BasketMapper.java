package com.jb.jbean.persistence;

import java.util.ArrayList;

import com.jb.jbean.domain.ProBasketVo;

public interface BasketMapper {
	
	public ArrayList<ProBasketVo> basketCheck();
	public int basketSelectCancel();
	public int basketAllCancel();
	
	
	

}
