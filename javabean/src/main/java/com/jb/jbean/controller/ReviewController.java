package com.jb.jbean.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jb.jbean.domain.ProReviewVo;
import com.jb.jbean.service.ReviewService;
import com.jb.jbean.util.MediaUtils;
import com.jb.jbean.util.UploadFileUtiles;


@RestController
public class ReviewController {
	
	@Autowired
	ReviewService rs;

	@Resource(name ="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/reviews/all/{pronum}") //pathVariable-°æ·Îº¯¼ö
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
	

	@RequestMapping(value="/reviews",method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ArrayList<ProReviewVo> ProReviewWrite(@RequestBody ProReviewVo prorvo,HttpSession session){
		System.out.println("µé¾î¿È");
		int midx=(Integer)session.getAttribute("sMidx");
		
		String ip =null;
		InetAddress local=null;
		try {
			local = InetAddress.getLocalHost();
			ip= local.getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		System.out.println("midx="+midx);
		 System.out.println("ip="+ip);
		 System.out.println("pronum="+prorvo.getPronum());
		 System.out.println("ridx="+prorvo.getProidx());
		 System.out.println("rstar="+prorvo.getRstar());
		 System.out.println("rcontent="+prorvo.getRcontent());
		 System.out.println("rfilename="+prorvo.getRfilename());
			prorvo.setRip(ip); 
			prorvo.setMidx(midx);
		 
		 rs.reviewWrite(prorvo);
		 System.out.println("µé¾î¿È2");
		 ArrayList<ProReviewVo> alist= rs.reviewList(prorvo.getPronum());
		 System.out.println("µé¾î¿È3");
		return alist;
	}
	

	@RequestMapping(value="/uploadc" ,method = RequestMethod.POST, produces ="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax( MultipartFile file)  throws Exception{
		
		System.out.println("originalName: "+ file.getOriginalFilename());
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		
		//String uploadeFileName= UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.CREATED);
	}

	@RequestMapping(value="/displayc", produces ="text/plain;charset=UTF-8")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity=null;
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType= MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null){
				headers.setContentType(mType);
			}else{
				
				fileName= fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity= new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		
		return entity;
	}
	
	@RequestMapping(value="/deleteFilec", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) throws Exception{
		
		String formatName= fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			String front = fileName.substring(0,12);
			 String end = fileName.substring(14);
		new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	
}
