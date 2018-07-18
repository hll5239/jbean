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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>

	<table>
		<tr>
			<td></td>
			<td>상품정보</td>
			<td>판매가</td>
			<td>수량</td>
			<td>합계</td>
		</tr>
	</table>
	<%-- <c:forEach var="probav" items="${alist}"> --%>
	<table border="1">
		<tr>
			<td>이미지</td>
			<td>${param.proname}<br>${param.size}</td>
			<td>${param.proprice}</td>
			<td>${param.cnt}</td>
			<td>${param.sum}</td>
		</tr>
	</table>
	
	<%-- </c:forEach> --%>
	
	<table>
		<tr>
			<td>총 상품 금액</td>
			<td>배송비</td>
			<td>결제 예정 금액</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>총 상품 금액</td>
			<td><input type="hidden" id="delivery" readonly style="background-color:silver;" value="2500" >원</td>
			<td><input type="text" name="sum" size="11" readonly style="background-color:silver;"></td>
		</tr>
	</table>

</body>
</html>