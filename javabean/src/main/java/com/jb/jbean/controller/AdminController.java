package com.jb.jbean.controller;




import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.service.AdminService;

import com.jb.jbean.util.MediaUtils;
import com.jb.jbean.util.UploadFileUtiles;

import org.springframework.web.bind.annotation.ResponseBody;


import org.apache.commons.io.IOUtils;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;



import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;


@Controller
public class AdminController {

	@Autowired
	AdminService as;
	
	@Resource(name ="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/ProductC")
	public String Product(){
	
		
		return "/view/admin/adminPro";
	}
	
	@RequestMapping(value="/ProductInsertC")
	public String ProductInsert(){
	
		
		return "/view/admin/adminProWrite";
	}
	@RequestMapping(value="/ProductInsertActionC")
	public String ProductInsertAction(@ModelAttribute("pv") ProductVo pv){
		
		int bv=0;
		String url="";
		
		System.out.println(pv.getCidx());
		System.out.println(pv.getProname());
		bv=as.productInsert(pv);
		
		if(bv==1) {
			url="redirect:/ProductC";
		}else {
			
			url="redirect:/ProductInsertC";
		}
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax" ,method = RequestMethod.POST, produces ="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax( MultipartFile file)  throws Exception{
		
		System.out.println("originalName: "+ file.getOriginalFilename());
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		
		//String uploadeFileName= UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.CREATED);
	}
	@ResponseBody
	@RequestMapping(value="/displayFile", produces ="text/plain;charset=UTF-8")
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
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
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
