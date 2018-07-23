package com.jb.jbean.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jb.jbean.domain.*;
import com.jb.jbean.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService os;
	
	//주문정보 DB입력
	@RequestMapping(value="/OrderInsertC")
	protected String orderInsert(@ModelAttribute("ov") OrderVo ov, Model model,
								@RequestParam("cnt") int cnt,
								@RequestParam("proidx") int proidx, HttpSession session
								) {
		
		System.out.println("----OrderInsertC---------------------------------");
		
		
		int midx = (Integer) session.getAttribute("sMidx");
		Random rd = new Random();
		long oid = rd.nextInt(100000000);
		
		ov.setOcnt(cnt);
		ov.setProidx(proidx);
		ov.setOid(oid);
		ov.setMidx(midx);
		int res = os.orderInsert(ov);
		System.out.println("주문입력: "+res);
		
		ArrayList<BuyVo> alist = os.orderSelect(oid);
		model.addAttribute("alist", alist);
		
		return "view/order/orderInfo";
	}
	
	@ResponseBody
  	@RequestMapping(value="Order/DefaultAddr/{midx}", produces ="application/json;charset=UTF-8")
  	public MemberVo defaultAddr(@PathVariable("midx") int midx) {
		
		MemberVo mv = os.defaultAddr(midx);
		
  		return mv;
  	}
	
	@RequestMapping(value="/OrderFinishC")
	protected String orderFinish(@ModelAttribute("buyvo") BuyVo buyvo, Model model,
								 HttpSession session,  @RequestParam("oid") long oid							 
								) {
		
		System.out.println("----OrderFinishC---------------------------------");
		os.orderFinish(buyvo);
		
		int midx = (Integer) session.getAttribute("sMidx");

		ArrayList<BuyVo> alist = os.orderCheck(midx,oid);
		model.addAttribute("alist", alist);
		
		return "view/order/orderCheck";
	}
	
}
