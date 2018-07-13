package com.jb.jbean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jb.jbean.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService rs;

}
