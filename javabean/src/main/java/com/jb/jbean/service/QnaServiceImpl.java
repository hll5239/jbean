package com.jb.jbean.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.jb.jbean.domain.QnaVo;
import com.jb.jbean.persistence.QnaMapper;


@Service("QnaServiceImpl")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSession sqlSession;
	
	

}
