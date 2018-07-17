package com.jb.jbean.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.persistence.MemberMapper;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int memberJoin(MemberVo mv) {

		MemberMapper mm = sqlSession.getMapper(com.jb.jbean.persistence.MemberMapper.class);
		int res = mm.memberJoin(mv);

		return res;
	}
}
