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

<div style="padding-left: 15%">   
<h1>마이페이지</h1>
<br>
<table class="table11" style="width: 700px; ">
	<tr><th>총 주문</th><td colspan=3> ${a1} 회</td></tr>
	<tr style="text-align: center; font-size: 12px;"><td colspan=4>나의 주문 처리 현황</td></tr>
	<tr style="text-align: center;">
		<td>입금전<br><h4 class="timer" id="websites" data-to="560" data-speed="5500">${a2}</h4></td>
		<td>상품준비중<br><h4 class="timer" id="websites" data-to="560" data-speed="5500">${a3}</h4></td>
		<td>배송중<br><h4 class="timer" id="websites" data-to="560" data-speed="5500">${a4}</h4></td>
		<td>배송완료<br><h4 class="timer" id="websites" data-to="560" data-speed="5500">${a5}</h4></td>
	</tr>
	<tr>
		<td colspan=4 style="text-align: center;">
			<input type="button" class="btn std-btn btn-common" value="주문내역조회" onclick="location.href='${request.getContextPath}/MyOrderC'">
			<input type="button" class="btn std-btn btn-common" value="내정보" onclick="location.href='${request.getContextPath}/MemberModifyController'">
			<input type="button" class="btn std-btn btn-common" value="내 게시물 조회" onclick="location.href='${request.getContextPath}/MyBoardC'">
		</td>
	</tr>
</table>
</div>



</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	