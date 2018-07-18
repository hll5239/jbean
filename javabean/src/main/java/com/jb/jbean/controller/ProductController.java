package com.jb.jbean.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	ProductService pros;
	
	
	@RequestMapping(value="/")
	protected String main(Model model) {
		
		System.out.println("----main---------------------------------------");
		ArrayList<ProductVo> alistCate = pros.category();
		ArrayList<ProductVo> alistProA = pros.productAll();
		model.addAttribute("alistCate", alistCate);
		model.addAttribute("alistProA", alistProA);
		
		
		return "main";
	}
	
	@RequestMapping(value="/ProListC")
	protected String prolist(@RequestParam("cidx") int cidx, Model model) {
		
		ArrayList<ProductVo> alistCate = pros.category();
		ArrayList<ProductVo> alistProL = pros.productList(cidx);
		model.addAttribute("alistCate", alistCate);
		model.addAttribute("alistProL", alistProL);
				
		return "/view/product/proList";
	}
	
	@RequestMapping(value="/ProInfoC")
	protected String proInfo(@RequestParam("pronum") int pronum, Model model) {
		
		System.out.println("----proInfo--------------------------");
		
		ArrayList<ProductVo> alistCate = pros.category();
		ArrayList<ProductVo> alistProI = pros.productInfo(pronum);

		model.addAttribute("alistCate", alistCate);
		model.addAttribute("alistProI", alistProI);
		
		//model.addAttribute("prov", prov);
				
		return "/view/product/proInfo";
	}
	
}
