package com.jb.jbean.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String memberJoinAction(@ModelAttribute("mv") MemberVo mv, @RequestParam("mmail1") String mmail1,
			@RequestParam("mmail2") String mmail2) {

		
		 String mmail = mmail1 + "@" + mmail2;
		 String ip =null;
		 try {
				InetAddress local = InetAddress.getLocalHost();
				ip= local.getHostAddress();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 System.out.println("ip="+ip);
		 
		mv.setMmail(mmail);
		mv.setMip(ip);
		
		int res = ms.memberJoin(mv);

		// int res=0;
		String page = null;
		if (res == 1) {
			page = "redirect:/MemberLoginController";
		} else {
			page = "redirect:/MemberJoinController";
		}

		return page;
	}

	@RequestMapping(value = "/MemberLoginController")
	public String memberLogin() {

		return "/view/member/memberLogin";
	}

	@RequestMapping(value = "/MemberLoginActionController")
	public String memberLoginAction(@ModelAttribute("mv") MemberVo mv, Model model, HttpSession session) {

		MemberVo mmv = null;
		int res = 0;
		mmv = ms.memberLogin(mv);

		if (mmv != null) {

			session.setAttribute("sMid", mv.getMid());
			session.setAttribute("sMidx", mv.getMidx());
			session.setAttribute("sMname", mv.getMname());
			
			res = 1;
		}
		
		model.addAttribute("mv", mmv);

		String page = null;
		if (res == 1) {
			page = "redirect:/";
		} else {
			page = "redirect:/MemberLoginController";
		}
		return page;
	}
	
	@RequestMapping(value = "/MemberModifyController")
	public String memberOne(@RequestParam("mid") String mid, Model model) {
		
		MemberVo Mone = ms.memberOne(mid);
		model.addAttribute("Mone", Mone);
		
		return "/view/member/memberModify";
		
	}
	
	@RequestMapping(value = "/MemberModifyActionController")
	   public String memberModifyAction(@ModelAttribute("mv") MemberVo mv){
	            
	      
	      int res = ms.memberModify(mv);
	      
	      String page = null;
	      
	      if (res == 1) {
	      page = "redirect:/";
	      }else{
	         page = "redirect:/MemberModifyController";
	      } 
	      
	      return page;
	   }
	
}
