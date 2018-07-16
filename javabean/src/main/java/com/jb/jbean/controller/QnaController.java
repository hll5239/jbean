package com.jb.jbean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jb.jbean.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qs;

}
