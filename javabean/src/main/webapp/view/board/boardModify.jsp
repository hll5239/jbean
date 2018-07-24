<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">

 	var a = $("#bv.bcontent").val();
 	
</script>

<script type="text/javascript">
function check() {	
	 	  
	  var formname = document.frm;
	  
	  var res;
	  	res = confirm("등록 하시겠습니까??");
	  	
		if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath()%>/BoardModifyActionC?bidx=${bv.bidx}";
		   	formname.submit();  
	  	}
	  	
	  	return ;
}
	  </script>
	  
</head>
<body>
<form name="frm">

 <h1 align="center"> 게시물 수정 </h1>
   <br>
<div style="position: absolute; left: 270px; top: 50px;" >
<select class="form-control input-lg" name="bgroup" align="center" style= "width: 140px; height: 50px;"> 
<option value="N" selected>공지사항</option>
<option value="F">FAQ</option>
</select>
</div>
 
 
 
 <div style="position: absolute; right: 270px; top: 50px;" >
 <input class="form-control" type="text" name="bsubject" id="bsubject"  size="60" maxlength="40" style="width: 450px; height: 30px;" required="" 
 placeholder="제목을 입력 하세요." data-error="" value = "${bv.bsubject}" />
</div>
 
 
<br>
<br>
<div>
<center>
<textarea class="form-control" name="bcontent" id="bcontent" required="" placeholder="내용을 입력 하세요." cols="100" rows="20"  maxlength="4000" style="width: 600px; height: 400px;" data-error="">${bv.bcontent}</textarea>

<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check();" >수정하기</button> 

</center>
</div>
</form>
</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>