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
<table border="1">
	<tr><td colspan=4>총 주문  회</td></tr>
	<tr><td colspan=4>나의 주문 처리 현황</td></tr>
	<tr>
		<td>입금전<br></td>
		<td>상품준비중<br></td>
		<td>배송중<br></td>
		<td>배송완료<br></td>
	</tr>
	<tr>
		<td colspan=4>
			<input type="button" id="order" value="주문내역조회">
			<input type="button" id="member" value="내정보">
			<input type="button" id="board" value="내 게시물 조회">
		</td>
	</tr>
</table>


</body>
</html>