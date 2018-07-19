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
<script type="text/javascript">
	
	$(function(){
		
		$('[name="detail"]').click(function(){
			
			document.orderDetail.method ="POST";
			document.orderDetail.action ="${request.contextPath}/MyOrderInfoC";
			document.orderDetail.submit();
			
		});
			
	});
	
</script>

<body>
내 주문조회


	<form name="turm">
	<table>
		<tr>
			<td>조회기간</td>
			<td><input type="button" value="1주일">
				<input type="button" value="1개월">
				<input type="button" value="3개월">
				<input type="button" value="6개월">
				<br>
				<input type="text" id="from_date" name="from_date" class="input" style="width:70px;" readonly="readonly">
				<input type="text" id="to_date" name="to_date" class="input" style="width:70px;" readonly="readonly">	
			</td>
			<td><input type="button" id="check" value="조회하기"></td>
		</tr>
	</table>
	</form>
	
<form name="orderDetail">
	<table border="1">
		<tr>
			<td>주문일<br>(주문번호)</td>
			<td>상품정보</td>
			<td>수량</td>
			<td>결제금액</td>
			<td>주문상태</td>
		</tr>
		<c:forEach var="buyvo" items="${alist}">
		<tr>
			<td>${buyvo.oday}<br>
				<input type="text" name="oid" value="${buyvo.oid}" readonly style="border:none;"><br>
				<input type="button" value="상세보기" name="detail"></td>
				
			<td>${buyvo.proname}<br>[옵션: ${buyvo.prosize}]</td>
			<td>${buyvo.ocnt}</td>
			<td>${buyvo.pprice} 원</td>
			<c:set var="ing" value="${buyvo.o_yx}${buyvo.p_nxy}${buyvo.d_nxczy}" />
			<td><c:choose>
					<c:when test="${ing == 'YNN'}">
						<c:out value="입금대기"></c:out><br>
						<input type="button" value="주문취소">
					</c:when>
					<c:when test="${ing == 'YYC'}">
						<c:out value="상품준비중"></c:out>
					</c:when>
					<c:when test="${ing == 'YYZ'}">
						<c:out value="배송중"></c:out>
					</c:when>
					<c:when test="${ing == 'YYY'}">
						<c:out value="배송완료"></c:out><br>
						<input type="button" value="구매확정"><br>
						<input type="button" value="후기작성">
					</c:when>
					<c:when test="${ing == 'XXX'}">
						<c:out value="주문취소"></c:out>
					</c:when>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
		
	</table>
</form>


</body>
</html>