package com.jb.jbean.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UploadFileUtiles {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UploadFileUtiles.class);

	public static String uploadFile(String uploadPath,
									String originalName,byte[] fileData)	
	throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() +"_"+originalName;
		
//		String path = UploadFileUtiles.class.getResource("").getPath();
//		System.out.println("현재클래스path:"+path);
		
//  	실행되는 시스템 위치	
//		System.out.println(System.getProperty("user.dir"));
       
//        String realpath = request.getSession().getServletContext().getRealPath(uploadPath);
//		System.out.println("realpath:"+realpath);
        
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savedPath,savedName);
//  	등록한 파일 상대경로
//		String loc = target.getCanonicalPath();

		FileCopyUtils.copy(fileData,target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath,savedPath, savedName);
		}else{
			uploadedFileName = makeIcon(uploadPath,savedPath,savedName);
		}
				
		return uploadedFileName;
	}	

	private  static String makeIcon(String uploadPath,
			String path,
			String fileName)throws Exception{

		String iconName = uploadPath+path+File.separator+fileName;				
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	//년 월 일을 계산하여 폴더를 생성하는곳에 사용
	private static String calcPath(String uploadPath){	
		
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		
		String monthPath = yearPath+
				File.separator +
				new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath +
				File.separator +
				new DecimalFormat("00").format(cal.get(Calendar.DATE));
			
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	//년 월 일에 따른 폴더를 생성하는곳
	private static void makeDir(String uploadPath,String...paths){
			
		if(new File(uploadPath+paths[paths.length -1]).exists())
			return;
		
		for(String path : paths){
			
			File dirPath = new File(uploadPath + path);		
	//		System.out.println("dirPath:"+dirPath);			
			
			if (! dirPath.exists()){			
				dirPath.mkdir();				
			}
		}
	}
	//썸네일(화면에보이는 작은 이미지)을 만드는곳
	private static String makeThumbnail(String uploadPath,
			String path,
			String fileName) throws Exception{
		
		BufferedImage sourceImg = 
				ImageIO.read(new File(uploadPath+path,fileName));
		BufferedImage destImg = 
				Scalr.resize(sourceImg, 
						Scalr.Method.AUTOMATIC, 
						Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = 
				uploadPath + 
				path + 
				File.separator + 
				"s-"+fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);	//java는 대소문자구별을 한다. toUpperCase대문자로 변경
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	
}