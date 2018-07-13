package com.jb.jbean.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jb.jbean.service.AdminService;



@Controller
public class AdminController {

	@Autowired
	AdminService as;
}
