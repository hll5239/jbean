package com.jb.jbean.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.domain.QnaVo;
import com.jb.jbean.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qs;

	
	
	
}
