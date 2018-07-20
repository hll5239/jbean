<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jb.jbean.domain.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Piece & Style
<c:choose>
<c:when test="${sMid eq null}">
<a href="MemberLoginController">로그인</a>
<a href="MemberJoinController">회원가입</a>
<a href="/BoardListN">공지사항</a>
<a href="/BoardListF">FAQ</a>
</c:when>
<c:otherwise>
<c:out value="${sMid}님 안녕하세요"></c:out>
<a href="MemberLogoutC">로그아웃</a>
<a href="MemberModifyController">회원정보수정</a>
<a href="/MypageC">마이페이지</a>
<a href="/BoardListN">공지사항</a>
<a href="/BoardListF">FAQ</a>
</c:otherwise>
</c:choose>

<c:if test="${sMidx eq 1 }">
<a href="${pageContext.request.contextPath}/AcntC">관리자페이지</a>
</c:if>
<div>
	<c:forEach var="prov" items="${alistCate}">
		<a href="${request.contextPath}/ProListC?cidx=${prov.cidx}">
			<span>${prov.cname}</span>
		</a>
	</c:forEach>
</div>

<c:forEach var="prov" items="${alistProA}">
	<div  style="float:left; width:30%; text-align:center;">
		<div><a href="${request.contextPath}/ProInfoC?pronum=${prov.pronum}">
		${prov.promain}</a></div>
		<div>${prov.proname}, ${prov.proprice}</div>
	</div>
</c:forEach>

</body>
</html>