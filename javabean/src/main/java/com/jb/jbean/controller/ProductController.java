package com.jb.jbean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jb.jbean.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	ProductService pros;
	
	
	@RequestMapping(value="/")
	protected String main(Model model) {
		
		System.out.println("-------------sllls-----------------------------------");
		
		return "main";
	}
	
}
