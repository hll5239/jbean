package com.jb.jbean.service;

import com.jb.jbean.domain.MemberVo;

public interface MemberService {
	
	public int memberJoin(MemberVo mv);
	
	public MemberVo memberLogin(MemberVo mv);

	public int memberModify(MemberVo mv);
	
	public MemberVo memberOne(String mid);
	
	public int memberDelete(int midx);
	
	public MemberVo memberIdFind(String mname1, String mmail1);
	
	public MemberVo memberPwdFind(MemberVo mv);

		
	}
