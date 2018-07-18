package com.jb.jbean.service;

import com.jb.jbean.domain.MemberVo;

public interface MemberService {
	
	public int memberJoin(MemberVo mv);
	
	public MemberVo memberLogin(MemberVo mv);

	public int memberModify(MemberVo mv);
	
	public MemberVo memberOne(String mid);
	
}
