package com.jb.jbean.controller;

import org.apache.tomcat.jni.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.service.MypageService;
import com.jb.jbean.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@RequestMapping(value="/OrderInfoC")
	protected String orderInfo(Model model) {
		
		
		return "view/order/orderInfo";
	}
	
}
