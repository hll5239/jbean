<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<tr>
<td>검색조건</td>
<td>
<input type="radio" name="memberSearch" id="searchType1" value="1" checked>아이디 
<input type="radio" name="memberSearch" id="searchType2" value="2">회원명
<input type="radio" name="memberSearch" id="searchType3" value="3">이메일
<input type="radio" name="memberSearch" id="searchType4" value="4">연락처
</td>
</tr>
<tr>
<td>입력</td>
<td>
<input type="text" name="membertext" id="membertext" />
<input type="button"  value="검색" onclick="history.back();"/>

</td>
</tr>
</table>
<br><br>
<table border=1>
<tr>
<td>ID</td>
<td>PW</td>
<td>이름</td>
<td>이메일</td>
<td>연락처</td>
<td>주소</td>
<td>등록일</td>
<td>삭제유무</td>
<td colspan=2></td>
</tr>
<c:forEach var="ml" items="${mlist}">
<tr>
<td>${ml.mid}</td>
<td>${ml.mpwd}</td>
<td>${ml.mname}</td>
<td>${ml.mmail}</td>
<td>${ml.mphone}</td>
<td>${ml.mpost} ${ml.maddr1} ${ml.maddr2}</td>
<td>${ml.mday}</td>
<td>${ml.mdel_yn}</td>
<td><a href="#">수정</a></td>
<td><a href="#">삭제</a></td>

</tr>
</c:forEach>
</table>


</body>
</html>
