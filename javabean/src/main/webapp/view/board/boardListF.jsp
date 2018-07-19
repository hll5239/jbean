<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {	
	 	  
	  var formname = document.frm;
	  
	  var res;
	  	res = confirm("등록 하시겠습니까?");
	  
	  	if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath() %>/BoardWriteC";
		   	formname.submit();  
	  	}
	  	
	  	return ;
}
	  </script>
</head>

<body>
<form name="frm">

 <h1 align="center"> F A Q </h1> 
 
  
 <div style="margin-top:30px;"></div>
 
 <table border="1" align="center" width="80%" style="text-align:center;">
 
 <td>번호</td>
 <td width="60%">제목/내용</td> 
 <td>작성자</td>
 <td>작성일</td>
 <td>조회수</td> 
 </tr> 

<c:forEach varStatus="status"  step="1"  var="al" items="${alist}">

<td> ${status.index+1}</td>
 <td width="60%">${al.bsubject}</td> 
 <td>관리자</td>
 <td>${al.bday}</td>
 <td>${al.bhits}</td>
 </tr> 
 </c:forEach>
 </table>
  <tr>
<td>
<c:choose>
<c:when test="${sMidx eq '1'}">
 <p align="center">
<input type="button" name="button" value="등록하기" onclick="javascript:check();"/>
</p>
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>
 </form>
</body>
</html>