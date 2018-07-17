<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.fileDrop {
width: 100%;
height:200px;
border:1px dotted blue;
}

.fileDrop1 {
width: 100%;
height:200px;
border:1px dotted blue;
}
.fileDrop2 {
width: 100%;
height:200px;
border:1px dotted blue;
}
.fileDrop3 {
width: 100%;
height:200px;
border:1px dotted blue;
}

small {
margin-left:3px;
font-weight:bold;
color:gray;
}


</style>
<script type="text/javascript">
function check() {	
  
  var formname = document.frm;
  
    var res;
  	res = confirm("등록하시겠습니까?");
  
  	if (res == true) {
	   	formname.method ="post";
	   	formname.action ="<%=request.getContextPath() %>/ProductInsertActionC";
	   	formname.submit();  
  	}
  	return ;
}	

function addFilePath(msg){
	alert(msg);	
}

function checkImageType(fileName){
	
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	alert(fileName.match(pattern));
	
	return fileName.match(pattern);
}

function getOriginalName(fileName){
//	alert(fileName);
	//이미지파일이면 원본이름 안쓴다
	if (checkImageType(fileName)) {
		return;
	}
	
	var idx = fileName.lastIndexOf("_")+1;
	
	alert(idx);
	return fileName.substr(idx);
}

//파일이 이미지일경우
function getImageLink(fileName){
	if (!checkImageType(fileName)) {
		return;
	}
	//위치 폴더뽑기
	var front = fileName.substr(0,12);
	//파일이름뽑기
	//_는 빼고
	var end = fileName.substr(14);
	
	return front+end;	
}

$(function(){
	
	$(".fileDrop").on("dragenter dragover",function(event){
	
		event.preventDefault();		
	});
	
	$(".fileDrop").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		$.ajax({
			url:'/uploadAjax',
			data: formData,
			dataType:'text',
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			processData:false,
			contentType:false,
			type:'POST',
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#promain").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+ "<img src='displayFile?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList").append(str);
			}		
			
		});	
		
	});	
	
	$(".fileDrop1").on("dragenter dragover",function(event){
		
		event.preventDefault();		
	});
	
	$(".fileDrop1").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		$.ajax({
			url:'/uploadAjax',
			data: formData,
			dataType:'text',
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			processData:false,
			contentType:false,
			type:'POST',
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#prosub1").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+ "<img src='displayFile?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList1").append(str);
			}		
			
		});	
		
	});
	
	$(".fileDrop2").on("dragenter dragover",function(event){
		
		event.preventDefault();		
	});
	
	$(".fileDrop2").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		$.ajax({
			url:'/uploadAjax',
			data: formData,
			dataType:'text',
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			processData:false,
			contentType:false,
			type:'POST',
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#prosub2").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+ "<img src='displayFile?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList2").append(str);
			}		
			
		});	
		
	});
	
$(".fileDrop3").on("dragenter dragover",function(event){
		
		event.preventDefault();		
	});
	
	$(".fileDrop3").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		$.ajax({
			url:'/uploadAjax',
			data: formData,
			dataType:'text',
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			processData:false,
			contentType:false,
			type:'POST',
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#proinfo").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+ "<img src='displayFile?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList3").append(str);
			}		
			
		});	
		
	});
	
});

</script>

<title>Insert title here</title>

</head>
<body>
<form name="frm" id="frm" enctype="multipart/form-data">
<table border="1">
	<tr>
		<td>상품명</td>
		<td><input type="text" name="proname" id="proname" /></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="proprice" id="proprice" /></td>
	</tr>
	<tr>
		<td>상품 수량</td>
		<td><input type="text" name="procnt" id="procnt" /></td>
	</tr>
	<tr>
		<td>상품 코드</td>
		<td><input type="text" name="pronum" id="pronum" /></td>
	</tr>
	<tr>
		<td>분류선택</td>
		<td><select name="cidx">
						<option value="1">티셔츠</option>
						<option value="2" selected>니트</option>
						<option value="3">블라우스</option>
						<option value="4">치마</option>
						<option value="5">청바지</option>
				</select></td>
	</tr>
	<tr>
		<td>사이즈선택</td>
		<td><select name="prosize">
						<option value="S">스몰</option>
						<option value="M" selected>미디움</option>
						<option value="L">라지</option>
				</select></td>
	</tr>
	

</table>
<input type="button"  value="상품등록" onclick="check()"  />



<input type="hidden" id="promain" name="promain">
<div class='fileDrop'></div>
<div class='uploadedList'></div>

<input type="hidden" id="prosub1" name="prosub1" >  
<div class='fileDrop1'></div>
<div class='uploadedList1'></div>

<input type="hidden" id="prosub2" name="prosub2">  
<div class='fileDrop2'></div>
<div class='uploadedList2'></div>

<input type="hidden" id="proinfo" name="proinfo">  
<div class='fileDrop3'></div>
<div class='uploadedList3'></div>

</form>
</body>
</html>