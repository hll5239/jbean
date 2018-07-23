<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {	
	 	  
	  var formname = document.frm;
	  
	  var res;
	  	res = confirm("등록 하시겠습니까??");
	  	
		if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath() %>/BoardWriteActionC";
		   	formname.submit();  
	  	}
	  	
	  	return ;
}
	  </script>
</head>
<body>
<form name="frm">

 <h1 align=center> 게시물 등록 / 수정 </h1>
 <br>
 <center>  
 <div>
 

 <input class="form-control" type="text" name="bsubject" id="bsubject"  size="60" maxlength="40" style="width: 500px; height: 30px;" required="" 
 placeholder="제목을 입력 하세요." data-error="" />

<select class='sort' name="bgroup" align="center" > 
<option value="N" selected>공지사항</option>
<option value="F">FAQ</option>
</select>

<textarea class="form-control" name="bcontent" id="bcontent" required="" placeholder="내용을 입력 하세요." cols="100" rows="20"  maxlength="4000" style="width: 600px; height: 500px;" data-error=""></textarea>

 
<input type="button" name="button" value="등록" onclick="javascript:check();"/>


</div>
</center>
</form>
</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>