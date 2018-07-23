<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.fileDrop {
width: 300px;
height:100px;
border:1px dotted blue;
}

.fileDrop1 {
width: 300px;
height:100px;
border:1px dotted blue;
}
.fileDrop2 {
width: 300px;
height:100px;
border:1px dotted blue;
}
.fileDrop3 {
width: 300px;
height:100px;
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
	   	formname.action ="${pageContext.request.contextPath}/AProductInsertActionC";
	   	formname.submit();  
  	}
  	return ;
}	



function checkImageType(fileName){
	
	var pattern = /jpg$|gif$|png$|jpeg$/i;

	
	return fileName.match(pattern);
}

function getOriginalName(fileName){

	//이미지파일이면 원본이름 안쓴다
	if (checkImageType(fileName)) {
		return;
	}
	
	var idx = fileName.lastIndexOf("_")+1;
	

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
<div class="table1-style1" >
              <div class="sub-title" >
                <span><h3>주문검색</h3></span>
              </div>
              <div class="table1-responsive mtb">
                <table class="table1 table-bordered table1-1 ">
                  <thead>
                   <tr>
		<td>상품명</td>
		<td><input class="form-control" name="proname" id="proname" required="" type="text" value="${Modify.proname}"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input class="form-control" name="proprice" id="proprice" required="" type="text" value="${Modify.proprice}"></td>
	</tr>
	<tr>
		<td>상품 수량</td>
		<td><input class="form-control" name="procnt" id="procnt" required="" type="text" value="${Modify.procnt}"></td>
	</tr>
	<tr>
		<td>상품 코드</td>
		<td><input class="form-control" name="pronum" id="pronum" required="" type="text" value="${Modify.pronum}"></td>
	</tr>
	<tr>
		<td>분류선택</td>
		<td><select name="cidx">
						<option value="1" <c:if test="${Modify.cidx eq '1' }">selected </c:if>>티셔츠</option>
						<option value="2" <c:if test="${Modify.cidx eq '2' }">selected </c:if>>니트</option>
						<option value="3" <c:if test="${Modify.cidx eq '3' }">selected </c:if>>블라우스</option>
						<option value="4" <c:if test="${Modify.cidx eq '4' }">selected </c:if>>치마</option>
						<option value="5" <c:if test="${Modify.cidx eq '5' }">selected </c:if>>청바지</option>
				</select></td>
	</tr>
	<tr>
		<td>사이즈선택</td>
		<td><select name="prosize">
						<option value="S" <c:if test="${Modify.prosize eq 'S' }">selected </c:if>>스몰</option>
						<option value="M" <c:if test="${Modify.prosize eq 'M' }">selected </c:if>>미디움</option>
						<option value="L" <c:if test="${Modify.prosize eq 'L' }">selected </c:if>>라지</option>
				</select></td>
	</tr>
                  </tbody>
                </table>
                <button class="btn std-btn btn-lg btn-info" type="button" onclick="check()" style="float:auto">
			               	   상품등록	
			</button>
			<button class="btn std-btn btn-lg btn-common" type="button" onclick="history.back();" style="float:auto">
			               	  취소하기
			</button>
              
              
              </div>
              <input type="hidden" id="promain" name="promain" value="${Modify.promain}">
<div class='fileDrop'>메인상품</div>
<div class='uploadedList' ></div>


<input type="hidden" id="prosub1" name="prosub1" value="${Modify.prosub1}">  
<div class='fileDrop1' >상세상품1</div>
<div class='uploadedList1' ></div>


<input type="hidden" id="prosub2" name="prosub2" value="${Modify.prosub2}">  
<div class='fileDrop2' >상세상품2</div>
<div class='uploadedList2' ></div>


<input type="hidden" id="proinfo" name="proinfo" value="${Modify.proinfo}">  
<div class='fileDrop3' >상품정보</div>
<div class='uploadedList3' ></div>
 </div>


</form>



</body>
</html>
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	