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
<h1>"주문이 완료되었습니다"</h1>
<h6>입금완료 후 배송이 시작됩니다</h6>


<c:forEach var="buyvo" begin="0" varStatus="status" items="${alist}">
		<div>
		 <c:if test="${status.index eq 0}">
		 	<h4>주문내역</h4>
		 	<table>
		 		<tr>
		 			<td></td>
		 			<td>상품정보</td>
		 			<td>수량</td>
		 			<td>합계</td>
		 		</tr>
			<c:forEach var="buypro" items="${alist}">
				<tr>
					<td>${buypro.promain}</td>
		 			<td>${buypro.proname}<br>${buypro.prosize}</td>
		 			<td>${buypro.ocnt}</td>
		 			<td>${buypro.ocnt * buypro.proprice}</td>
				</tr>
			</c:forEach>
			</table>
			<h4>배송정보</h4>
				<table>
					<tr>
						<td>받는사람</td>
						<td>${buyvo.dname}<br>${buyvo.dphone}<br>${buyvo.dpost}${buyvo.daddr1}<br>${buyvo.daddr2}</td>
					</tr>
				</table>
			<h4>결제정보</h4>
				<table>
					<tr>
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
						<td>
							<c:if test="${buyvo.ptype == 'B'}">
								<c:out value="국민은행  7000-110-00003(스앤피)"/>
							</c:if>
						${buyvo.pprice}</td>
					</tr>
				</table>
		</c:if>
		</div>
</c:forEach>

	<input type="button" value="홈으로" onclick="location.href='${request.getContextPath}/'">



<body>


</body>
</html>