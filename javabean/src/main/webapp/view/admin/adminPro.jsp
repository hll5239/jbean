<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		 document.frm.action="${pageContext.request.contextPath}/AProductInsertC";
		 document.frm.submit();
		
	       	}
 }
 

 </script>

<title>Insert title here</title>
</head>
<body>
<table border=1 style="margin: auto; text-align: center;">
		<tr>
			<td><a href="${pageContext.request.contextPath}/AcntC">메인</a></td>
			<td><a href="${pageContext.request.contextPath}/AMemberC">회원관리</a></td>
			<td><a href="${pageContext.request.contextPath}/AProductC">상품관리</a></td>
			<td><a href="${pageContext.request.contextPath}/AOrderaC">주문관리</a></td>
			<td><a href="#">통계</a></td>
			<td><a href="#">게시판관리</a></td>
		</tr>
	</table>
<br>
<br>

<form name="frm" action="${pageContext.request.contextPath}/AProductSelectC">
<table border="1">
	<tr>
		<td>분류선택</td>
		<td><select name="cidx">
						<option value="1">티셔츠</option>
						<option value="2">니트</option>
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
						<option value="0">전체</option>
						<option value="1">1만원</option>
						<option value="2">2만원</option>
						<option value="3">3만원</option>
						<option value="4">4만원</option>
						
				</select></td>
	</tr>
</table>
<input type="submit"  value="검색하기" />
</form>

<br>
<br>
<input type="button"  value="등록하기" onclick="writer()"  />


<table border=1>
<tr>
<td>분류</td>
<td>상품명</td>
<td>사이즈</td>
<td>가격(재고)</td>

</tr>

<c:forEach var="prov" items="${alist}">
<tr>
<td>

	<c:choose>
	<c:when test="${prov.cidx eq '1'}">
	티셔츠
	</c:when>
	<c:when test="${prov.cidx eq '2'}">
	니트
	</c:when>
	<c:when test="${prov.cidx eq '3'}">
	블라우스
	</c:when>
	<c:when test="${prov.cidx eq '4'}">
	치마
	</c:when>
	<c:otherwise>
	청바지
	</c:otherwise>
	</c:choose>

</td>
<td>${prov.proname}</td>
<td>${prov.prosize}</td>
<td>${prov.proprice} (${prov.procnt})</td>
<td><a href="${pageContext.request.contextPath}/AProductModifyC?proidx=${prov.proidx}">수정</a></td>
<td><a href="${pageContext.request.contextPath}/AProductDeleteC?proidx=${prov.proidx}">삭제</a></td>
</tr>

</c:forEach>
</table>




</body>
</html>