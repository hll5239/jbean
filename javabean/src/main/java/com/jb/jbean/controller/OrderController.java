package com.jb.jbean.controller;

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
	
	@RequestMapping(value="/OrderC")
	protected String orderInfo(@ModelAttribute("ov") OrderVo ov, Model model,
								@RequestParam("cnt") int cnt,
								@RequestParam("proidx") String proidx
								) {
		
		System.out.println("cnt값은?"+cnt);
		System.out.println("zz값은?"+proidx);
		ov.setOcnt(cnt);
		//ov.setOprice(proprice);
		ov.setProidx(4);
		ov.setOid(123456);
		ov.setMidx(1);
		
		
		int res = os.orderInsert(ov);
				System.out.println("주문입력: "+res);
		
				//orderSelect();
				// 2개 조인 
				// 사이즈, 가격 ~~~
				
				
				
		//Hashmap<String, Object> hm = null;
		
		//model.addAttribute(hm);
		
		return "view/order/orderInfo";
	}
	

	
}
