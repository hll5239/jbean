<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jb.jbean.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td></td>
			<td>상품이미지</td>
			<td>상품정보</td>
			<td>판매가</td>
			<td>수량</td>
			<td>합계</td>
		</tr>
	</table>
	<c:forEach var="probavo" items="${alist}">
		<table>
			<tr>
				<td><input type="checkbox" name="baidx" value="${probavo.baidx}"></td>
				<td>${probavo.promain}</td>
				<td>${probavo.prosize}</td>
				<td>${probavo.proprice}</td>
				<td>${probavo.bacnt}<input type="hidden" id="price" value="${probavo.proprice}"></td>
				<td><input type="text" name="sum" size="11" readonly style="background-color:silver;">원</td>
			</tr>
		</table>
	</c:forEach>
	<table>
		<tr>
			<td>총 상품 금액</td>
			<td>배송비</td>
			<td>결제예정금액</td>
		</tr>
	</table>
	<input type="button" id="AllOrder" value="전체상품 주문">
	<input type="button" id="SelectOrder" value="선택상품 주문">
</body>
</html>