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
<input type="button"  value="등록하기" onclick="writer()"  />
</form>
</body>
</html>