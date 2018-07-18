<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<table border=1 style="margin: auto; text-align: center;">
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

	<form name="frm"
		action="${pageContext.request.contextPath}/OrderSelectC">
		<table border="1">
			<tr>
				<td>주문상태</td>
				<td><select name="ooidx">
						<option value="1">전체상품</option>
						<option value="2">입금대기</option>
						<option value="3">입금완료 및 상품준비</option>
						<option value="4">배송중</option>
						<option value="5">배송완료</option>
						<option value="6">취소</option>

				</select></td>
			</tr>
			<tr>
				<td>주문검색</td>
				<td><select name="searchType">
						<option value="o.Oid">주문번호</option>
						<option value="o.Oday">주문일</option>
						<option value="m.Mid">주문자ID</option>

				</select><input type="text" name="keyword" id="keyword" /></td>

			</tr>
			<tr>
				<td colspan=3><input type="submit" value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<br>
	<br>

	<table border=1>
		<tr>
			<td>주문일</td>
			<td>주문번호</td>
			<td>주문자ID</td>
			<td>결제금액</td>
			<td>결제상태</td>
			<td>배송상태</td>

		</tr>

		<c:forEach var="ord" items="${oaList}">

			<tr>
				<td>${ord.oday}</td>
				<td>${ord.oid}</td>
				<td>${ord.mid}</td>
				<td>${ord.pprice}</td>
				<td>${ord.p_nxy}</td>
				<td>${ord.d_nxczy}</td>
				<td><a href="${pageContext.request.contextPath}/OrdermC?mid=${ord.mid}&oid=${ord.oid}">수정</a></td>

			</tr>
		</c:forEach>

	</table>


</body>
</html>
