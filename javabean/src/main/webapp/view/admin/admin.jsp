<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1 style="margin:auto; text-align:center;">
<tr>
<td><a href="${pageContext.request.contextPath}/AcntC">메인</a></td>
<td><a href="${pageContext.request.contextPath}/MemberC">회원관리</a></td>
<td><a href="${pageContext.request.contextPath}/ProductC">상품관리</a></td>
<td><a href="#">주문관리</a></td>
<td><a href="#">통계</a></td>
<td><a href="#">게시판관리</a></td>
</tr>
</table>

<br>
<br>
<table border=1 style="margin:auto; text-align:center;">
<tr>
<td colspan="4">총회원수:${mcnt} (명)</td>
</tr>
<tr>
<td colspan="4">회원 탈퇴수:${mdcnt} (명)</td>
</tr>
<tr>
<td>답변안한글</td>
<td>입금대기</td>
<td>상품 준비중</td>
<td>취소</td>
</tr>
<tr>
<td>${nrcnt}(개)</td>
<td>${pbcnt}(명)</td>
<td>${prcnt}(개)</td>
<td>${pccnt}(개)</td>
</tr>
</table>
<table border=1; style="margin:auto; text-align:center;">
<tr>
<td>오늘 총 주문금액</td>
<td>오늘 실 결제금액</td>
</tr>

<tr>
<td>${noamount}(원)</td>
<td>${npamount}(원)</td> 
</tr>

</table>
</body>
</html>
