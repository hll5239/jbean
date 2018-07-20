package com.jb.jbean.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.domain.*;
import com.jb.jbean.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@RequestMapping(value="/OrderInsertC")
	protected String orderInfo(@ModelAttribute("ov") OrderVo ov, Model model,
								@RequestParam("cnt") int cnt,
								@RequestParam("proidx") int proidx, HttpSession session
								) {
		//주문정보 DB입력
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
		
		String view;
		
		if (session.getAttribute("sMidx") != null){
			view = "view/order/orderInfo";
		}else {
			view = "redirect:/MemberLoginController";
		}	
		return view;
	}
	

	
}
