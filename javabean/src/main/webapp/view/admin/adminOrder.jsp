<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#name").click(function () {
		var i = 0;
		alert(i);
	});
	 
	
	  
	});
</script>



<title>Insert title here</title>
</head>
<body>
	<input type="button" id="name" value="버튼">
	<c:set var="i" value="0"/>
	<c:choose>
	<c:when test ="${i eq 0 }">
	안녕
	</c:when>
	
	<c:otherwise>
	바이
	</c:otherwise>
	
	</c:choose>
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

	<form name="frm"
		action="${pageContext.request.contextPath}/AOrderSelectC">
		<table border="1">
			<tr>
				<td>주문상태</td>
				<td><select name="ooidx">
						<option value="1">전체상품</option>
						<option value="2">입금대기</option>
						<option value="3">입금완료 및 상품준비</option>
						<option value="4">배송중</option>
						<option value="5">배송완료</option>
						<option value="6">취소</option>

				</select></td>
			</tr>
			<tr>
				<td>주문검색</td>
				<td><select name="searchType">
						<option value="o.Oid">주문번호</option>
						<option value="o.Oday">주문일</option>
						<option value="m.Mid">주문자ID</option>

				</select><input type="text" name="keyword" id="keyword" /></td>

			</tr>
			<tr>
				<td colspan=3><input type="submit" value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<br>
	<br>

	<table border=1>
		<tr>
			<td>주문일</td>
			<td>주문번호</td>
			<td>주문자ID</td>
			<td>결제금액</td>
			<td>결제상태</td>
			<td>배송상태</td>

		</tr>

		<c:forEach var="ord" items="${oaList}">

			<tr>
				<td>${ord.oday}</td>
				<td>${ord.oid}</td>
				<td>${ord.mid}</td>
				<td>${ord.pprice}</td>
				<td>${ord.p_nxy}</td>
				<td>${ord.d_nxczy}</td>
				<td><a href="${pageContext.request.contextPath}/AOrdermC?mid=${ord.mid}&oid=${ord.oid}">수정</a></td>

			</tr>
		</c:forEach>

	</table>


</body>
</html>
