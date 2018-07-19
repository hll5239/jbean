package com.jb.jbean.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

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
		String ip = null;
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ip=" + ip);

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

			session.setAttribute("sMid", mmv.getMid());
			session.setAttribute("sMidx", mmv.getMidx());
			session.setAttribute("sMname", mmv.getMname());

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
	public String memberOne(HttpSession session, Model model) {

		String mid = (String) session.getAttribute("sMid");
		System.out.println("mid="+mid);
		MemberVo Mone = ms.memberOne(mid);
		model.addAttribute("Mone", Mone);

		return "/view/member/memberModify";

	}

	@RequestMapping(value = "/MemberModifyActionController")
	public String memberModifyAction(@ModelAttribute("mv") MemberVo mv, HttpSession session,
			@RequestParam("mmail1") String mmail1, @RequestParam("mmail2") String mmail2,
			@RequestParam("midx") int midx) {

		System.out.println("1=" + midx);
		String mmail = mmail1 + "@" + mmail2;
		String ip = null;
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ip=" + ip);

		mv.setMmail(mmail);
		mv.setMip(ip);
		mv.setMidx(midx);

		int res = ms.memberModify(mv);

		String page = null;

		if (res == 1) {
			page = "redirect:/";
		} else {
			page = "redirect:/MemberModifyController";
		}

		return page;
	}

	@RequestMapping(value = "/MemberDeleteController")
	public String memberDelete(@RequestParam("midx") int midx,HttpSession session) {

//		System.out.println("midx="+midx);
		//int midx = (Integer) session.getAttribute("sMidx");
//		System.out.println("midx="+mid);
		
		int res = ms.memberDelete(midx);
				
		String page="";

		page="redirect:/MemberLoginController";
		
		return page;
	}
	
	@RequestMapping(value = "/MemberFindController")
	public String memberFind(){
	
		return "/view/member/memberFind";
	}
	
	@RequestMapping(value = "/MemberFindC")
	public String memberIdFind(@RequestParam("mname1") String mname1,@RequestParam("mmail1") String mmail1, Model model) {

		
		MemberVo mf = null;
		
		mf = ms.memberIdFind(mname1,mmail1);

		//System.out.println(mf.getMid());
		model.addAttribute("mf", mf);
		
		return "/view/member/memberFind";
	}
	
	@RequestMapping(value = "/MemberFindPWdC")
	public String memberPwdFind(@ModelAttribute("mv") MemberVo mv, Model model) {
		
		System.out.println("이름:"+mv.getMid());
		System.out.println("이름:"+mv.getMname());		
		System.out.println("이름:"+mv.getMmail());
		MemberVo pf = null;
		
		pf = ms.memberPwdFind(mv);
		model.addAttribute("pf", pf);
		
		return "/view/member/memberFind";
	}

	@RequestMapping(value="/MemberLogoutC")
	public String memberLogout(HttpSession session) {	
		
		session.removeAttribute("sMid");
		session.removeAttribute("sMidx");
		session.removeAttribute("sMname");
		
		return "redirect:/";
	}	
}
