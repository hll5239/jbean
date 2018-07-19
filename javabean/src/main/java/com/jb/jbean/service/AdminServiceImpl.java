package com.jb.jbean.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.domain.SearchCriteria;
import com.jb.jbean.persistence.AdminMapper;


@Service("adminServiceImpl")
public class AdminServiceImpl implements AdminService  {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int productInsert(ProductVo pv) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productInsert(pv);
		
		return res;
	}

	@Override
	public ArrayList<ProductVo> productAll() {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ArrayList<ProductVo> alist = msm.productAll();
		
		return alist;
	}

	@Override
	public ArrayList<ProductVo> productSelect(ProductVo pv) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		System.out.println("cidx="+pv.getCidx());
		
		ArrayList<ProductVo> alist = msm.productSelect(pv);
			
		return alist;
	}

	@Override
	public ProductVo productModify(int proidx) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ProductVo detail = msm.productModify(proidx);
		
		return detail;
	}
	
	@Override
	public int productUpdate(ProductVo pv) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productUpdate(pv);
		
		return res;
	}

	@Override
	public int productDelete(int proidx) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productDelete(proidx);
		
		return res;
	}

	@Override
	public ArrayList<MemberVo> memberAll() {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ArrayList<MemberVo> mlist = msm.memberAll();
		
		return mlist;
	}

	@Override
	public ArrayList<MemberVo> memberCare(SearchCriteria scri) {
		
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		ArrayList<MemberVo> mCare = msm.memberCare(scri);
		
		return mCare;
	}

	@Override
	public MemberVo memberModfiyOne(int midx) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		MemberVo mmlist = msm.memberModfiyOne(midx);
		
		return mmlist;
	}

	@Override
	public int adminMemberModify(MemberVo mv) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.adminMemberModify(mv);
		
		return res;
	}

	@Override
	public int adminMemberDelete(int midx) {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.adminMemberDelete(midx);
		
		return res;
	}

	@Override
	public int memberOutCnt() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.memberOutCnt();
		return res;
	}

	@Override
	public int memberAllCnt() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.memberAllCnt();
		return res;
	}

	@Override
	public int noReplyCnt() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.noReplyCnt();
		return res;
	}

	@Override
	public int paymentBeforeCnt() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.paymentBeforeCnt();
		return res;
	}

	@Override
	public int productReadyCnt() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productReadyCnt();
		return res;
	}

	@Override
	public int productCancelCnt() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.productCancelCnt();
		return res;
	}

	@Override
	public int nowOrderAmount() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.nowOrderAmount();
		return res;
	}

	@Override
	public int nowPayAmount() {

		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		
		int res= msm.nowPayAmount();
		return res;
	}

	@Override
	public ArrayList<BuyVo> orderAdmin() {
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		 ArrayList<BuyVo> oaList= msm.orderAdmin();
		
		return oaList;
	}

	@Override
	public ArrayList<BuyVo> orderAllList(SearchCriteria scri, int ooidx) {
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		ArrayList<BuyVo> oaList=null;
		
		if(ooidx==1) {
			oaList= msm.orderAdmin();
		}else if(ooidx==2) {
			oaList= msm.orderPaymentBeforeList(scri);
		}else if(ooidx==3) {
			oaList= msm.orderProductReadyList(scri);
		}else if(ooidx==4) {
			oaList= msm.orderDeliveringList(scri);
		}else if(ooidx==5) {
		oaList = msm.orderDeliveredList(scri);
		
		}else if(ooidx==6){
			oaList = msm.orderCanlcelList(scri);
		}
		
		return oaList;
		
		
	}

	@Override
	public ArrayList<BuyVo> orderModifyButton(BuyVo buyvo) {
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		 ArrayList<BuyVo> omList = msm.orderModifyButton(buyvo);
		
		return omList;
	}

	@Transactional
	@Override
	public int orderModifyAll(BuyVo buyvo) {
		AdminMapper msm = sqlSession.getMapper(com.jb.jbean.persistence.AdminMapper.class);
		int res=0;

		System.out.println(buyvo.getP_nxy());
		
		msm.orderPayModify(buyvo);
		res= msm.orderDeliveryModify(buyvo);
		
		System.out.println(res);
		
		return res;
	}


	
	
	
	
	
}