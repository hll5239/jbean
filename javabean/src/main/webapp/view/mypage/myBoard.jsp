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

내 게시물 조회

<%-- <input type="button" id="review" value="Review" onclick="location.href='${request.getContextPath}/MyReviewC'">
<input type="button" id="qna" value="QnA" onclick="location.href='${request.getContextPath}/MyQnaC'">
 --%>
 
<table border="1">
	<tr>
		<td>번호</td>
		<td>게시물</td>
		<td>작성일</td>
	</tr>
	<c:forEach var="prorvo" items="${alist}">
	<tr>
		<td>${prorvo.ridx}</td>
		<td>${prorvo.rcontent}</td>
		<td>${prorvo.rday}</td>
	</tr>
	</c:forEach>
</table>


</body>
</html>