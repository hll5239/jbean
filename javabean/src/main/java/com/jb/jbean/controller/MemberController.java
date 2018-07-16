package com.jb.jbean.controller;

import java.net.InetAddress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.service.AdminService;
import com.jb.jbean.service.BasktService;
import com.jb.jbean.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;

	@RequestMapping(value = "/MemberJoinController")
	public String memberJoin() {

		return "/view/member/memberJoin";
	}

	@RequestMapping(value = "/MemberJoinActionController")
	public String memberJoinAction(@ModelAttribute("mv") MemberVo mv) {

		int res = ms.memberJoin(mv);

		String page = null;
		if (res == 1) {
			page = "redirect:/MemberLoginController";
		} else {
			page = "redirect:/MemberJoinController";
		}

		return page;
	}
}
