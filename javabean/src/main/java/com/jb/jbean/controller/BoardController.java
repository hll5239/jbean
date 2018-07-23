package com.jb.jbean.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.domain.BoardVo;
import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService bs;
	private int bidx;

	@RequestMapping(value = "/BoardListN")
	public String boardList(Model model) {

		String bgroup = "N";

		ArrayList<BoardVo> alist = bs.boardListN(bgroup);
		model.addAttribute("alist", alist);

		return "/view/board/boardListN";
	}

	@RequestMapping(value = "/BoardListF")
	public String boardListF(Model model) {

		String bgroup = "F";

		ArrayList<BoardVo> alist = bs.boardListF(bgroup);
		model.addAttribute("alist", alist);

		return "/view/board/boardListF";
	}

	@RequestMapping(value = "/BoardWriteC")
	public String boardwrite() {

		return "/view/board/boardWrite";
	}

	@RequestMapping(value = "/BoardWriteActionC")
	public String boardWrite(@ModelAttribute("bv") BoardVo bv) {

		String ip = null;
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ip=" + ip);
		System.out.println("bgroup=" + bv.getBgroup());

		bv.setMidx(1);
		bv.setBip(ip);

		int res = bs.boardWrite(bv);

		String page = null;
		if (res == 1) {
			page = "redirect:/";
		} else {
			page = "redirect:/";
		}

		return page;

	}

	@RequestMapping(value = "/BoardDeleteC")
	public String boardDelete(@RequestParam("bidx") int bidx) {

		// System.out.println("bidx="+bidx);
		int bd = bs.boardDelete(bidx);

		String page = "";

		page = "redirect:/BoardListN";

		return page;

	}

	@RequestMapping(value = "/BoardModifyC")
	public String boardOne(@RequestParam("bidx") int bidx, Model model) {
				
		System.out.println(bidx);
		BoardVo bv = bs.boardOne(bidx);
		model.addAttribute("bv", bv);
				
		return "/view/board/boardModify";
	}
	
	@RequestMapping(value = "/BoardModifyActionC")
	public String MemberModifyAction(@ModelAttribute("bv") BoardVo bv){
			
		int res=0;
		String url="";
		String ip =null;
		InetAddress local;
		try {
			local = InetAddress.getLocalHost();
			ip= local.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		bv.setBip(ip);
		res = bs.boardModify(bv);
		
		if(res==1) {
			url="redirect:/";
		}else {
			
			url="redirect:/BoardModifyC";
		}
		
		return url;
	}
}