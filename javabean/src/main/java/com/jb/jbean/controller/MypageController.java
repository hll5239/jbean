package com.jb.jbean.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jb.jbean.domain.*;
import com.jb.jbean.service.MypageService;




@Controller
public class MypageController {

	@Autowired
	MypageService mys;
	
	@RequestMapping(value="/MypageC")
	protected String mypage(Model model, HttpSession session) {
		
System.out.println("----MypageC----------------------");
		int midx = (Integer) session.getAttribute("sMidx");
		String mid = (String) session.getAttribute("sMid");
System.out.println("技记midx"+midx);
System.out.println("技记mid"+mid);

		int a1 = mys.orderAllCnt(midx);
		int a2 = mys.paymentBeforeCnt(midx);
		int a3 = mys.productReadyCnt(midx);
		int a4 = mys.deliveringCnt(midx);
		int a5 = mys.deliveredCnt(midx);
		
		model.addAttribute("a1", a1);
		model.addAttribute("a2", a2);
		model.addAttribute("a3", a3);
		model.addAttribute("a4", a4);
		model.addAttribute("a5", a5);
		
		String view;
		
		if (session.getAttribute("sMidx") != null){
			view = "view/mypage/mypage";
		}else {
			view = "redirect:/MemberLoginController";
		}	
		return view;

	}
	
	@RequestMapping(value="/MyOrderC")
	protected String myOrder(Model model, HttpSession session) {
		
		int midx = (Integer) session.getAttribute("sMidx");
		
		ArrayList<BuyVo> alist = mys.myOrder(midx);
		model.addAttribute("alist", alist);
		
		String view;
		
		if (session.getAttribute("sMidx") != null){
			view = "view/mypage/myOrder";
		}else {
			view = "redirect:/MemberLoginController";
		}	
		return view;

	}
	
	@RequestMapping(value="/MyOrderInfoC")
	protected String myOrderinfo(Model model, HttpSession session,
									@RequestParam("oid") long oid) {
		System.out.println("oid蔼?  "+oid);
		
		ArrayList<BuyVo> alist = mys.myOrderInfo(oid);
		model.addAttribute("alist", alist);
		
		return "view/mypage/myOrderInfo";

	}
	@RequestMapping(value="/OrderCancelC")
	protected String orderCancel(Model model, HttpSession session,
									@RequestParam("oid") long oid) {
		System.out.println("oid蔼?  "+oid);
		int midx = (Integer) session.getAttribute("sMidx");
		
		mys.OrderCancel(midx, oid);
		
		return "redirect:/MyOrderC";

	}
	
	
	@RequestMapping(value="/MyBoardC")
	protected String myBoard(Model model, HttpSession session) {
	
System.out.println("----MyBoardC----------------------");
		int midx = (Integer) session.getAttribute("sMidx");
System.out.println("技记midx"+midx);

		ArrayList<ProReviewVo> alist = mys.myReview(midx);
		model.addAttribute("alist", alist);
		
		String view;
		
		if (session.getAttribute("sMidx") != null){
			view = "view/mypage/myBoard";
		}else {
			view = "redirect:/MemberLoginController";
		}	
		return view;

	}
	
	//Ajax侩
	@ResponseBody
  	@RequestMapping(value="/MyReviewC", produces ="text/plain;charset=UTF-8")
  	public ArrayList<ProReviewVo> myReview(Model model, HttpSession session) throws Exception {
  		
		int midx = (Integer) session.getAttribute("sMidx");
		
		ArrayList<ProReviewVo> alist = mys.myReview(midx);
		model.addAttribute("alist", alist);
		
  		return alist;
  	}
	//Ajax侩
	@ResponseBody
  	@RequestMapping(value="/MyQnaC", produces ="text/plain;charset=UTF-8")
  	public ArrayList<ProQnaVo> myQna(Model model, HttpSession session) throws Exception {
  		
		int midx = (Integer) session.getAttribute("sMidx");
		
		ArrayList<ProQnaVo> alist = mys.myQna(midx);
		model.addAttribute("alist", alist);
		
  		return alist;
  	}
	
	
}
