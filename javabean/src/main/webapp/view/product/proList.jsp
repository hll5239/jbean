<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<c:forEach var="prov" items="${alistCate}">
		<a href="${request.contextPath}/ProListC?cidx=${prov.cidx}">
			<span>${prov.cname}</span>
		</a>
	</c:forEach>
</div>

<c:forEach var="prov" items="${alistProL}">
	<div  style="float:left; width:30%; text-align:center;">
		<div><a href="${request.contextPath}/ProInfoC?pronum=${prov.pronum}">
		${prov.promain}</a></div>
		<div>${prov.proname}, ${prov.proprice}</div>
	</div>
</c:forEach>

</body>
</html>
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>