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
//		System.out.println("����Ŭ����path:"+path);
		
//  	����Ǵ� �ý��� ��ġ	
//		System.out.println(System.getProperty("user.dir"));
       
//        String realpath = request.getSession().getServletContext().getRealPath(uploadPath);
//		System.out.println("realpath:"+realpath);
        
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath+savedPath,savedName);
//  	����� ���� �����
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
	//�� �� ���� ����Ͽ� ������ �����ϴ°��� ���
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
	//�� �� �Ͽ� ���� ������ �����ϴ°�
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
	//�����(ȭ�鿡���̴� ���� �̹���)�� ����°�
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
	
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);	//java�� ��ҹ��ڱ����� �Ѵ�. toUpperCase�빮�ڷ� ����
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	
}