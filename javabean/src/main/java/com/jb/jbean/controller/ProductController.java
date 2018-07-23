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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jb.jbean.domain.ProQnaVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.domain.QnaVo;
import com.jb.jbean.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	ProductService pros;
	
	
	@RequestMapping(value="/")
	protected String main(Model model) {
		
		System.out.println("----main---------------------------------------");
		
		ArrayList<ProductVo> alistProA = pros.productAll();
		model.addAttribute("alistProA", alistProA);
		
		ArrayList<ProductVo> alistCate = pros.category();
		model.addAttribute("alistCate", alistCate);

		
		
		return "main";
	}
	
	@RequestMapping(value="/ProListC")
	protected String prolist(@RequestParam("cidx") int cidx, Model model) {
		
		ArrayList<ProductVo> alistCate = pros.category();
		ArrayList<ProductVo> alistProL = pros.productList(cidx);
		model.addAttribute("alistCate", alistCate);
		model.addAttribute("alistProL", alistProL);
				
		return "/view/product/proList";
	}
	
	@RequestMapping(value="/ProInfoC")
	protected String proInfo(@RequestParam("pronum") int pronum, Model model) {
		
		System.out.println("----proInfo--------------------------");
		
		ArrayList<ProductVo> alistCate = pros.category();
		ArrayList<ProductVo> alistProI = pros.productInfo(pronum);
		ArrayList<ProQnaVo> qlist = pros.qnaList(pronum);
		
		model.addAttribute("alistCate", alistCate);
		model.addAttribute("alistProI", alistProI);
		model.addAttribute("qlist", qlist);
		model.addAttribute("pronum", pronum);
				
		return "/view/product/proInfo";
	}
	
	@RequestMapping(value="/QnaWriteC")
	protected String QnaWrite(Model model,@RequestParam("proidx") int proidx,@RequestParam("pronum") int pronum) {
		
		System.out.println(proidx);
		model.addAttribute("proidx",proidx);
		model.addAttribute("pronum",pronum);
		return "/view/board/qnaWrite";
	}
	
	@RequestMapping(value="/QnaWriteActionC")
	protected String QnaWriteAction(ProQnaVo proqvo,HttpSession session) {
		
		int midx = (Integer) session.getAttribute("sMidx");
		int bv=0;
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
		
		System.out.println("midx="+midx);
		System.out.println("ip="+ip);
		System.out.println("subject="+proqvo.getQsubject());
		System.out.println("content="+proqvo.getQcontent());
		System.out.println("proidx="+proqvo.getProidx());
		System.out.println("pronum"+proqvo.getPronum());
		proqvo.setQip(ip);
		proqvo.setMidx(midx);
		
		 bv=pros.qnaWrite(proqvo);
		
		System.out.println("5");
		if(bv==1) {
			url="redirect:/ProInfoC?pronum="+proqvo.getPronum();
		}else {
			url="redirect:/QnaWriteC";
		}
		
		return url;
	}
	
	@RequestMapping(value="/QdelteC")
	protected String Qdelte(Model model,@RequestParam("qidx") int qidx,@RequestParam("pronum") int pronum) {
		
		System.out.println(qidx);
		System.out.println(pronum);
		
		pros.qnaMemberDelete(qidx);
		
		
		return "redirect:/ProInfoC?pronum="+pronum;
	}
	
	@RequestMapping(value="/QdelteAdminC")
	protected String QdelteAdmin(Model model,@RequestParam("qidx") int qidx,@RequestParam("pronum") int pronum) {
		
		System.out.println(qidx);
		System.out.println(pronum);
		
		pros.qnaAdminDelete(qidx);
		
		
		return "redirect:/ProInfoC?pronum="+pronum;
	}
	
	@RequestMapping(value="/QAdminReplyC")
	protected String QAdminReply(Model model,@RequestParam("qidx") int qidx,@RequestParam("pronum") int pronum,@RequestParam("qreply") String qreply) {
		
		
		pros.qnaReplyWrite(qidx,qreply);
		
		return "redirect:/ProInfoC?pronum="+pronum;
	}
}
