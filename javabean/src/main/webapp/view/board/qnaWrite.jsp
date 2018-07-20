<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
function check() {
		 
		 var res;
	     res= confirm("글을 등록하겠습니까?");
		 
		 if(res==true){
			 document.frm.method="post";
			 document.frm.action="${pageContext.request.contextPath}/QnaWriteActionC";
			 document.frm.submit();
			
		       	}
	 }
	
</script>
<title>Insert title here</title>
</head>
<body>
<form name="frm">
<input type="hidden" name="proidx" value="${proidx}">
<input type="hidden" name="pronum" value="${pronum}">
<h1>Q & A</h1>
<table border=1>
<tr>
<td><select name="qsubject">
					<option value="상품문의">상품문의</option>
					<option value="배송문의">배송문의</option>
					<option value="사이즈문의">사이즈문의</option>
					<option value="재입고문의">재입고문의</option>
					<option value="기타">기타</option>
				</select></td>
</tr>

<tr>
<td><textarea name="qcontent" id="qcontent" class="text" cols="50" rows="6"></textarea></td>
</tr>

<tr>
<td>
<input type="password" name="qpwd"> 
<input type="button" value="등록" onclick="check()">
 <input type="button" value="이전페이지" onclick="history.back();">
</td>
</tr>

</table>
</form>
</body>

</html>