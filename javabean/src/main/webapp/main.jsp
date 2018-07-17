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
<a href="/MemberJoinController">회원가입</a>

<div>
	<c:forEach var="prov" items="${alistCate}">
		<a href="${request.contextPath}/proList?cidx=${prov.cidx}">
			<span>${prov.cname}</span>
		</a>
	</c:forEach>
</div>

<c:forEach var="prov" items="${alistProA}">
	<div  style="float:left; width:30%; text-align:center;">
		<div><a href="${request.contextPath}/proInfo?pronum=${prov.pronum}">
		${prov.promain}</a></div>
		<div>${prov.proname}, ${prov.proprice}</div>
	</div>
</c:forEach>

</body>
</html>