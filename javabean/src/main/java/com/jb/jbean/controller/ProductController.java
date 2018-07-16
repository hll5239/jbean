package com.jb.jbean.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	ProductService pros;
	
	
	@RequestMapping(value="/")
	protected String main(Model model) {
		
		System.out.println("----main---------------------------------------");
		ArrayList<ProductVo> alist = pros.category();
		ArrayList<ProductVo> alist2 = pros.productAll();
		model.addAttribute("alist", alist);
		model.addAttribute("alist2", alist2);
		
		return "main";
	}
	
}
