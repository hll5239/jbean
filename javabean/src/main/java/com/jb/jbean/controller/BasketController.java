package com.jb.jbean.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jb.jbean.service.AdminService;
import com.jb.jbean.service.BasktService;



@Controller
public class BasketController {

	@Autowired
	BasktService bas;
}
