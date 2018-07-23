<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<div style="text-align: center;">
<h1 style="font-size:50px;"><span class="text-primary">"주문이 완료되었습니다"</span></h1>
<br>
<h6>입금완료 후 배송이 시작됩니다</h6>
</div>
<br>
<br>
<br>
<div class="table-style3">
	<div class="table-responsive mtb">
	<h4 class="list-title">주문내역</h4>
	<c:forEach var="buyvo" begin="0" varStatus="status" items="${alist}">
	<c:if test="${status.index eq 0}">
	<table class="table" style="border: 1">
       <thead class="thead-default">
         <tr>
           <th></th>
           <th>상품정보</th>
           <th>판매가</th>
           <th>수량</th>
           <th>합계</th>
         </tr>
       </thead>
       <tbody>
        <c:forEach var="buypro" items="${alist}">
				<tr>
					<td><img src="/resources/helium-ui-kit/img/team/team-04.jpg" style="height:70px; width:auto;"></td>
		 			<td>${buypro.proname}<br>${buypro.prosize}</td>
		 			<td>${buypro.proprice}</td>
		 			<td>${buypro.ocnt}</td>
		 			<td>${buypro.ocnt * buypro.proprice}</td>
				</tr>
			</c:forEach>
       </tbody>
     </table>
     
     <h4 class="list-title">배송정보</h4>
     <table class="table11">
       <thead class="thead-default">
         <tr>
			<th>받는사람</th>
			<td>${buyvo.dname}<br>
				${buyvo.dphone}<br>
				${buyvo.dpost}<br>
				${buyvo.daddr1}<br>
				${buyvo.daddr2}</td>
		</tr>
		</thead>
	  </table>
	  <h4 class="list-title">결제정보</h4>
	  <table class="table11">
       <thead class="thead-default">
         <tr>
			<th><c:choose>
				<c:when test="${buyvo.ptype == 'B'}">
					<c:out value="무통장입금"/>
				</c:when>
				<c:when test="${buyvo.ptype == 'C'}">
					<c:out value="카드결제"/>
				</c:when>
				<c:when test="${buyvo.ptype == 'P'}">
					<c:out value="핸드폰결제"/>
				</c:when>
				</c:choose></th>
			<td><c:if test="${buyvo.ptype == 'B'}">
								<c:out value="국민은행  7000-110-00003(스앤피)"/><br>
							</c:if>
						<c:out value="${buyvo.pprice}  원"/></td>
		</tr>
		</thead>
	  </table>
     </c:if>
     </c:forEach>
	</div>
	</div>
	<div style="text-align: center;">
	<input type="button" value="홈으로" class="btn std-btn btn-lg btn-common" onclick="location.href='${request.getContextPath}/'">
	</div>


<body>


</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	