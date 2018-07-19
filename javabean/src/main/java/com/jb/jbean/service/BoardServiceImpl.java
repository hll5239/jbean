package com.jb.jbean.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.jb.jbean.domain.BoardVo;
import com.jb.jbean.persistence.BoardMapper;


@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService  {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<BoardVo> boardListN(String bgroup){
		
		BoardMapper bm = sqlSession.getMapper(com.jb.jbean.persistence.BoardMapper.class);
		ArrayList<BoardVo> alist = bm.boardListN(bgroup);
				
		return alist;
				
	}
	@Override
	public ArrayList<BoardVo> boardListF(String bgroup){
		
		BoardMapper bm = sqlSession.getMapper(com.jb.jbean.persistence.BoardMapper.class);
		ArrayList<BoardVo> alist = bm.boardListF(bgroup);
		
		return alist;
	}
	@Override
	public int boardWrite(BoardVo bv){
		
		BoardMapper bm = sqlSession.getMapper(com.jb.jbean.persistence.BoardMapper.class);
		int res = bm.boardWrite(bv);
		
		return res;
	}
}
