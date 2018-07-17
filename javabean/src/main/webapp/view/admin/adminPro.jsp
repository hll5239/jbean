<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
 function writer() {
 
	 var res;
     res= confirm("글을 작성하겠습니까?");
	 
	 if(res==true){
		 document.frm.method="post";
		 document.frm.action="<%=request.getContextPath()%>/ProductInsertC";
		 document.frm.submit();
		
	       	}
 }

 </script>

<title>Insert title here</title>
</head>
<body>
<form name="frm">
<table border="1">
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
		<td>상품명</td>
		<td><input type="text" name="proname" id="proname" /></td>
	</tr>
	<tr>
		<td>분류선택</td>
		<td><select name="proprice">
						<option>전체</option>
						<option value="1">1만원</option>
						<option value="2" selected>2만원</option>
						<option value="3">3만원</option>
						<option value="4">4만원</option>
						
				</select></td>
	</tr>
</table>
<input type="button"  value="검색하기" onclick="select()"  />


<input type="button"  value="등록하기" onclick="writer()"  />
</form>
</body>
</html>