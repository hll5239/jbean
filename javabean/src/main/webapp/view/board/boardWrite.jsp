<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

 <h1 align="center"> 게시물 등록 / 수정 </h1> 
   
 <div style="margin-top:30px;"></div>
 
 <tr>

<td >

<select name="bgroup" >
<option value="N" selected>공지사항</option>
<option value="F">FAQ</option>

</select>
</td>
</tr>
 
 <table border="1" align="center" width="40%" style="text-align:center;">
 <tr>
 <td>제목</td>
 <td colspan='4' align="left">
 <input type="text" name="bsubject" id="bsubject"  size="60" maxlength="40" /></td>
 </tr>
 <tr>
 <td colspan=2>내용</td>
 </tr>
 <tr>
 <td colspan=2>
 <textarea name="bcontent" id="bcontent" cols="100" rows="20" maxlength="4000"></textarea>
 </td>
 </tr>
 <tr>
<td colspan=4 align="center">
<input type="button" name="button" value="등록" onclick="javascript:check();"/>
</td>
</tr>
</table>
</form>
</body>
</html>