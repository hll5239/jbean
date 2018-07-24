<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
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
<span class=""></span>
<h1>내 주문조회</h1>
<br>
<br>
<!-- 
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
-->
	 
<form name="orderDetail">
	<table class="table22">
		<thead class="thead-default">
		<tr>
			<th style="width:23%">주문일<br>(주문번호)</th>
			<th style="width:43%">상품정보</th>
			<th>수량</th>
			<th>결제금액</th>
			<th>주문상태</th>
		</tr>
		</thead>
		<c:forEach var="buyvo" items="${alist}">
		<tr>
			<td>${buyvo.oday}<br>
				<input type="hidden" name="oid" value="${buyvo.oid}" >
				<c:out value="( ${buyvo.oid} )"/><br>
				<a href="${request.contextPath}/MyOrderInfoC?oid=${buyvo.oid}">상세보기</a></td>
			<td>${buyvo.proname}<br>[옵션: ${buyvo.prosize}]</td>
			<td>${buyvo.ocnt}</td>
			<td>${buyvo.pprice} 원</td>
			<c:set var="ing" value="${buyvo.o_yx}${buyvo.p_nxy}${buyvo.d_nxczy}" />
			<td><c:choose>
					<c:when test="${ing == 'YNN'}">
						<c:out value="입금대기"></c:out><br><br>
						<input type="button" value="주문취소" class="btn std-btn btn-sm11 btn-common" onclick="location.href='${request.getContextPath}/OrderCancelC?oid=${buyvo.oid}'">
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

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	