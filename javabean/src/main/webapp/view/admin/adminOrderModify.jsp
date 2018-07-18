<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function check() {	
  
  var formname = document.frm;
  	console.log(formname);
    var res;
  	res = confirm("등록하시겠습니까?");
  
  	if (res == true) {
	   	formname.method ="post";
	   	formname.action ="${pageContext.request.contextPath}/OrdermActionC";
	   	formname.submit();  
  	}
  	return ;
}	
</script>

<title>Insert title here</title>
</head>
<body>
<form name="frm">
<c:forEach var="om" items="${omList}">

<table border=1>
<tr>
<td>주문일</td>
<td>${om.proname}</td>
</tr>
<tr>
<td>주문번호</td>
<td><input type="hidden" name="oid" value="${om.oid}">${om.oid}</td>
</tr>
<tr>
<td>주문자ID</td>
<td>${om.mid}</td>
</tr>
<tr>
<td>결제금액</td>
<td>${om.pprice}</td>
</tr>
<tr>
<td>운송장 번호</td>
<td><input type="text" name="Dcode"></td>
</tr>

<tr>
<td>결제상태</td>
<td>
<select name="p_nxy">
				<option value="N" <c:if test="${om.p_nxy eq 'N'}">selected </c:if>>입금대기</option>
				<option value="X" <c:if test="${om.p_nxy eq 'X'}">selected </c:if>>입금취소</option>
				<option value="Y" <c:if test="${om.p_nxy eq 'Y'}">selected </c:if>>입금완료</option>
						
				</select>
</td>
</tr>

<tr>
<td>배송상태</td>
<td>
<select name="d_nxczy">
				<option value="N" <c:if test="${om.p_nxy eq 'N'}">selected </c:if>>입금대기</option>
				<option value="X" <c:if test="${om.p_nxy eq 'N'}">selected </c:if>>배송취소</option>
				<option value="C" <c:if test="${om.p_nxy eq 'N'}">selected </c:if>>상품준비중</option>
				<option value="Z" <c:if test="${om.p_nxy eq 'N'}">selected </c:if>>배송중</option>
				<option value="Y" <c:if test="${om.p_nxy eq 'N'}">selected </c:if>>배송완료</option>		
				</select>
</td>
</tr>

</table>
</c:forEach>
<input type="button" onclick="check()" value="변경하기" />

</form>
</body>
</html>