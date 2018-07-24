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

</script>

<body>
<h1>주문내역상세</h1>
<br>
<br>
<br>
<div class="table-style3">
	<div class="table-responsive mtb">

<c:forEach var="buyvo" begin="0" varStatus="status" items="${alist}">
 <c:if test="${status.index eq 0}">
<h4 style="color: gray;">주문내역</h4>
<table class="table22">
	<thead class="thead-default">
	<tr>
		<th></th>
		<th>상품정보</th>
		<th>수량</th>
		<th>상품금액</th>
		<th>주문상태</th>
	</tr>
	</thead>
	<c:forEach var="order" items="${alist}" >
	<tr>
		<td><img src="/resources/helium-ui-kit/img/team/team-04.jpg" style="height:70px; width:auto;"></td>
		<td>${order.proname}<br>${order.prosize}</td>
		<td>${order.ocnt}</td>
		<td>${order.ocnt * order.proprice}</td>
		<c:set var="ing" value="${order.o_yx}${order.p_nxy}${order.d_nxczy}" />
			<td><c:choose>
					<c:when test="${ing == 'YNN'}">
						<c:out value="입금대기"></c:out><br><br>
						<input type="button" class="btn std-btn btn-sm11 btn-common" value="주문취소">
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
	<br>
	<h4 style="color: gray;">배송정보</h4>
	<table class="table22">
	<thead class="thead-default">
		<tr>
			<th style="width:15%">받는사람</th>
			<td style="text-align: left; padding-left: 20px;">${buyvo.dname}<br>
				${buyvo.dphone}<br>
				${buyvo.dpost}<br>
				${buyvo.daddr1}<br>
				${buyvo.daddr2}</td>
		</tr>
	</thead>
	</table>
	<br>
	<h4 style="color: gray;">결제정보</h4>
	<table class="table22">
	<thead class="thead-default">
	<tr>
		<th>상품금액</th>
		<th>배송비</th>
		<th>결제금액</th>
		<th>결제수단</th>
		<th>결제일</th>
	</tr>
	</thead>
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
</div>
</div>
</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	