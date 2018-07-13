package com.jb.jbean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jb.jbean.service.MypageService;
import com.jb.jbean.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService os;
}
