package com.jb.jbean.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jb.jbean.domain.ProReviewVo;
import com.jb.jbean.service.ReviewService;


@RestController
public class ReviewController {
	
	@Autowired
	ReviewService rs;

	@RequestMapping(value="/reviews/all/{pronum}") //pathVariable-경로변수
	public ArrayList<ProReviewVo> ReviewsAll(@PathVariable("pronum") int pronum){
		
		ArrayList<ProReviewVo> alist= rs.reviewList(pronum);

		
		return alist;
	}
	
	@RequestMapping(value="/reviews/del/{ridx}/{pronum}",method=RequestMethod.GET)
	public ArrayList<ProReviewVo> ReviewsDelete(@PathVariable("pronum") int pronum,@PathVariable("ridx") int ridx,HttpSession session){
		
		int midx=(Integer)session.getAttribute("sMidx");
		ProReviewVo prorvo = new ProReviewVo();
		
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
		 System.out.println("pronum="+pronum);
		 System.out.println("ridx="+ridx);
		 
		 prorvo.setRip(ip);
		 prorvo.setMidx(midx);
		 prorvo.setRidx(ridx);
		 
		 rs.reviewDelete(prorvo);

		ArrayList<ProReviewVo> alist= rs.reviewList(pronum);
		
		return alist;
	}
	
	
}
