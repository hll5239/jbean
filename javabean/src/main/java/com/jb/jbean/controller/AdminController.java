package com.jb.jbean.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.service.AdminService;




@Controller
public class AdminController {

	@Autowired
	AdminService as;
	
	@RequestMapping(value="/ProductC")
	public String Product(){
	
		
		return "/admin/adminPro";
	}
	
	@RequestMapping(value="/ProductInsertC")
	public String ProductInsert(){
	
		
		return "/admin/adminProWrite";
	}
	@RequestMapping(value="/ProductInsertActionC")
	public String ProductInsertAction(@ModelAttribute("pv") ProductVo pv){
		
		int bv=0;
		String url="";
		
		bv=as.productInsert(pv);
		
		if(bv==1) {
			url="redirect:/ProductC";
		}else {
			
			url="redirect:/ProductInsertC";
		}
		
		return url;
	}
}
