package com.jb.jbean.controller;



import java.net.UnknownHostException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.domain.MemberVo;
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
	public String memberJoinAction(@ModelAttribute("mv") MemberVo mv ,@RequestParam("mmail1") String mmail1, @RequestParam("mmail2") String mmail2) {

		System.out.println("aaaa");
		String mmail = mmail1 + "@" + mmail2;
		
		mv.setMmail(mmail);
		System.out.println("mmail="+mmail);
		int res = ms.memberJoin(mv);
		
		//int res=0;
		String page = null;
		if (res == 1) {
			page = "redirect:/MemberLoginController";
		} else {
			page = "redirect:/MemberJoinController";
		}

		return page;
	}
	
	
	
}


