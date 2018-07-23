package com.jb.jbean.controller;




import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.jbean.domain.BuyVo;
import com.jb.jbean.domain.MemberVo;
import com.jb.jbean.domain.ProductVo;
import com.jb.jbean.service.AdminService;

import com.jb.jbean.util.MediaUtils;
import com.jb.jbean.util.UploadFileUtiles;
import com.jb.jbean.domain.SearchCriteria;

import org.springframework.web.bind.annotation.ResponseBody;


import org.apache.commons.io.IOUtils;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;



import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;


@Controller
public class AdminController {

	@Autowired
	private AdminService as;
	
	@Resource(name ="uploadPath")
	private String uploadPath;
	
	/*admin.jsp*/
	@RequestMapping(value="/AcntC")
	public String Acnt(Model model){
		int mcnt=as.memberAllCnt();
		int mdcnt=as.memberOutCnt();
		int nrcnt=as.noReplyCnt();
		int pbcnt=as.paymentBeforeCnt();
		int prcnt=as.productReadyCnt();
		int pccnt=as.productCancelCnt();
		int noamount=as.nowOrderAmount();
		int npamount=as.nowPayAmount();
		
		model.addAttribute("mcnt",mcnt);
		model.addAttribute("mdcnt",mdcnt);
		model.addAttribute("nrcnt",nrcnt);
		model.addAttribute("pbcnt",pbcnt);
		model.addAttribute("prcnt",prcnt);
		model.addAttribute("pccnt",pccnt);
		model.addAttribute("noamount",noamount);
		model.addAttribute("npamount",npamount);
		
		return "/view/admin/admin";
	}
	
	
	
	
	@RequestMapping(value="/AMemberC")
	public String Member(Model model){
	
		ArrayList<MemberVo> mlist = as.memberAll();
		model.addAttribute("mlist", mlist);
		
		
		
		return "/view/admin/adminMember";
	}
	/*ȸ���˻�*/
	@RequestMapping(value="/AMemberCareC")
	public String MemberCare(SearchCriteria scri,  Model model){
	
		ArrayList<MemberVo> mlist = as.memberCare(scri);
		model.addAttribute("mlist", mlist);
		
		
		return "/view/admin/adminMember";
		
	}
	
	@RequestMapping(value="/AMemberModifyC")
	public String MemberModify(@RequestParam("midx") int midx, Model model){
	
		System.out.println(midx);
		MemberVo mModify = as.memberModfiyOne(midx);
		model.addAttribute("mModify", mModify);
		
		
		return "/view/admin/adminMemberModify";
	}
	
	@RequestMapping(value="/AMemberModifyActionC")
	public String MemberModifyAction(@ModelAttribute("mv") MemberVo mv, @RequestParam("mmail1") String mmail1
			, @RequestParam("mmail2") String mmail2, @RequestParam("midx") int midx){
	
		String mmail= null;
		
		mmail=mmail1+"@"+mmail2;
		
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
		
		
		mv.setMmail(mmail);
		mv.setMip(ip);
		mv.setMidx(midx);
		bv = as.adminMemberModify(mv);
		
		if(bv==1) {
			url="redirect:/AMemberC";
		}else {
			
			url="redirect:/AMemberModifyC";
		}
		
		return url;
	}
	
	@RequestMapping(value="/AMemberDeleteC")
	public String MemberDelete(@RequestParam("midx") int midx, Model model){
	
		
		int res = as.adminMemberDelete(midx);
		
		String url="";

		url="redirect:/AMemberC";
		
		return url;
	}
	
	@RequestMapping(value="/AProductC")
	public String Product(Model model){
	
		ArrayList<ProductVo> alist = as.productAll();
		model.addAttribute("alist", alist);
		
		
		
		return "/view/admin/adminPro";
	}
	
	@RequestMapping(value="/AProductInsertC")
	public String ProductInsert(){
	
		
		return "/view/admin/adminProWrite";
	}
	@RequestMapping(value="/AProductInsertActionC")
	public String ProductInsertAction(@ModelAttribute("pv") ProductVo pv){
		
		int bv=0;
		String url="";
		
		System.out.println(pv.getPronum());
		System.out.println(pv.getCidx());
		System.out.println(pv.getProname());
		System.out.println("����?"+pv.getPromain());
		
		bv=as.productInsert(pv);
		
		if(bv==1) {
			url="redirect:/AProductC";
		}else {
			
			url="redirect:/AProductInsertC";
		}
		
		return url;
	}
	
	@RequestMapping(value="/AProductModifyC")
	public String ProductModify(@RequestParam("proidx") int proidx, Model model){
	
		ProductVo Modify = as.productModify(proidx);
		model.addAttribute("Modify", Modify);
		
		
		return "/view/admin/adminProModify";
	}
	
	@RequestMapping(value="/AProductModifyActionC")
	public String ProductModifyAction(@ModelAttribute("pv") ProductVo pv){
		
		int bv=0;
		String url="";
		System.out.println(pv.getPronum());
		System.out.println(pv.getCidx());
		bv=as.productUpdate(pv);
		
		if(bv==1) {
			url="redirect:/AProductC";
		}else {
			
			url="redirect:/AProductModifyC";
		}
		
		return url;
	}
	
	@RequestMapping(value="/AProductDeleteC")
	public String ProductDelete(@RequestParam("proidx") int proidx){
	
		int res = as.productDelete(proidx);
		
		String url="";
		

		url="redirect:/AProductC";
		
		
		return url;
	}
	
	/*��ǰ�˻�*/
	@RequestMapping(value="/AProductSelectC")
	public String ProductSelect(@ModelAttribute("pv") ProductVo pv, Model model){
	
		
		System.out.println(pv.getCidx());
		
		ArrayList<ProductVo> alist=as.productSelect(pv);
		
		model.addAttribute("alist", alist);
		
		return "/view/admin/adminPro";
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
	
	
	@RequestMapping(value="/AOrderaC")
	public String Order(Model model){
	
		ArrayList<BuyVo> oaList = as.orderAdmin();
	
		model.addAttribute("oaList", oaList);
		
		
		
		return "/view/admin/adminOrder";
	}
	
	@RequestMapping(value="/AOrderSelectC")
	public String OrderModify(Model model,@RequestParam("ooidx") int ooidx,SearchCriteria scri ){
	

		
		ArrayList<BuyVo> oaList = as.orderAllList(scri, ooidx);
		
		model.addAttribute("oaList", oaList);
		
		
		return "/view/admin/adminOrder";
	}
	
	@RequestMapping(value="/AOrdermC")
	public String Orderm(Model model, @ModelAttribute("buyvo") BuyVo buyvo ){
	

		ArrayList<BuyVo> omList  = as.orderModifyButton(buyvo);
		
		model.addAttribute("omList", omList);
		
		
		return "/view/admin/adminOrderModify";
	}
	
	@RequestMapping(value="/AOrdermActionC")
	public String OrdermAction(Model model,@ModelAttribute("buyvo") BuyVo buyvo){
		
		int res=0;
		String url="";
		
		res=as.orderModifyAll(buyvo);
		
		if(res==1) {
			url="redirect:/AOrderaC";
		}else {
			url="redirect:/AOrdermC";
		}
		
		return url;
	}
	
	
}