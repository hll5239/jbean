package com.jb.jbean.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.jbean.service.AdminService;
import com.jb.jbean.service.BasktService;
import com.jb.jbean.service.MypageService;



@Controller
public class MypageController {

	@Autowired
	MypageService mys;
	
	@RequestMapping(value="/MypageC")
	protected String mypage(Model model, HttpSession session) {
		
		int midx = (Integer) session.getAttribute("sMidx");
		
				
		int a1 = mys.orderAllCnt(midx);
		/*int a2 = mys.paymentBeforeCnt(midx);
		int a3 = mys.productReadyCnt(midx);
		int a4 = mys.deliveringCnt(midx);
		int a5 = mys.deliveredCnt(midx);*/
		
		model.addAttribute("a1", a1);
		/*model.addAttribute("a2", a2);
		model.addAttribute("a3", a3);
		model.addAttribute("a4", a4);
		model.addAttribute("a5", a5);*/
		
		String view;
		
		if (session.getAttribute("sMidx") != null){
			view = "view/mypage/mypage";
		}else {
			view = "redirect:/MemberLoginController";
		}	
		return view;

	}
	
}
