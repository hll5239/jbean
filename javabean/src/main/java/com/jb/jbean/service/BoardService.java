package com.jb.jbean.service;

import java.util.ArrayList;

import com.jb.jbean.domain.BoardVo;

public interface BoardService {
	
	public ArrayList<BoardVo> boardListN(String bgroup); 
	
	public ArrayList<BoardVo> boardListF(String bgroup);
	
	public int boardWrite(BoardVo bv);

}
