<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<tr>
<td>주문일</td>
<td></td>
</tr>
<tr>
<td>주문번호</td>
<td></td>
</tr>
<tr>
<td>주문자ID</td>
<td></td>
</tr>
<tr>
<td>결제금액</td>
<td></td>
</tr>
<tr>
<td>운송장 번호</td>
<td><input type="text" name="Dcode"></td>
</tr>

<tr>
<td>결제상태</td>
<td>
<select name="p_nxy">
				<option value="N">입금대기</option>
				<option value="X">입금취소</option>
				<option value="Y">입금완료</option>
						
				</select>
</td>
</tr>

<tr>
<td>배송상태</td>
<td>
<select name="d_nxczy">
				<option value="N">입금대기</option>
				<option value="X">배송취소</option>
				<option value="C">상품준비중</option>
				<option value="Z">배송중</option>
				<option value="Y">배송완료</option>		
				</select>
</td>
</tr>


</table>
</body>
</html>