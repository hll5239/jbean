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

</script>

<body>
주문내역 상세

<c:forEach var="buyvo" begin="0" varStatus="status" items="${alist}">
 <c:if test="${status.index eq 0}">
<table>
	<tr>
		<td colspan="5">주문내역</td>
	</tr>
	<tr>
		<td>이미지</td>
		<td>상품정보</td>
		<td>수량</td>
		<td>상품금액</td>
		<td>주문상태</td>
	</tr>
	<c:forEach var="order" items="${alist}" >
	<tr>
		<td>${order.promain}</td>
		<td>${order.proname}<br>${order.prosize}</td>
		<td>${order.ocnt}</td>
		<td>${order.ocnt * order.proprice}</td>
		<c:set var="ing" value="${order.o_yx}${order.p_nxy}${order.d_nxczy}" />
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
	<tr>
		<td colspan="5">배송정보</td>
	</tr>
	<tr>
		<td>받는사람</td>
		<td colspan="4">${buyvo.dname}<br>${buyvo.dphone}<br>${buyvo.dpost}${buyvo.daddr1}<br>${buyvo.daddr2}</td>
	</tr>
	<tr>
		<td colspan="5">결제정보</td>
	</tr>
	<tr>
		<td>상품금액</td>
		<td>배송비</td>
		<td>결제금액</td>
		<td>결제수단</td>
		<td>결제일</td>
	</tr>
	<tr>
		<td>
			<c:choose>
				<c:when test="${buyvo.pprice < 30000}">
					<c:out value="${buyvo.pprice - 2500}원"/>
				</c:when>
				<c:otherwise>
					<c:out value="${buyvo.pprice}원" />
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${buyvo.pprice < 30000}">
					<c:out value="2500원"/>
				</c:when>
				<c:otherwise>
					<c:out value="무료" />
				</c:otherwise>
			</c:choose>
		</td>
		<td>${buyvo.pprice}원</td>
		<td>
			<c:choose>
				<c:when test="${buyvo.ptype == 'B'}">
					<c:out value="무통장입금"/>
				</c:when>
				<c:when test="${buyvo.ptype == 'C'}">
					<c:out value="카드결제"/>
				</c:when>
				<c:when test="${buyvo.ptype == 'P'}">
					<c:out value="핸드폰결제"/>
				</c:when>
			</c:choose>
		</td>
		<td>${buyvo.pday}</td>
	</tr>
	
</table>
</c:if>
</c:forEach>

</body>
</html>