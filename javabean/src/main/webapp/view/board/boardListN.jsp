<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
function check() {	
	 	  
	  var formname = document.frm;
	  
	  var res;
	  	res = confirm("등록 하시겠습니까?");
	  
	  	if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath() %>/BoardWriteC";
		   	formname.submit();  
	  	}
	  	
	  	return ;
}
function check1() {
	
	location.href = "BoardModifyC"
}
function check2() {
	
  var formname = document.frm;
	  
	  var res;
	  	res = confirm("삭제 하시겠습니까?");
	  
	  	if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath() %>/BoardDeleteC";
		   	formname.submit();  
	  	}
	
		return ;
}


	  </script>
</head>
<body>
<form name="frm">

<div class="container">
			<h1 align="center"> 공지사항 </h1> 
			<table class="table table-striped">
			<tr>

				<td width="5%">번호</td>
				<td align="left" width="20%">제목/내용</td>
				<td width="5%">작성자</td>
				<td width="10%">작성일</td>
				<td width="15%">조회수</td>
				<td width="5%"></td>
				<td width="5%"></td>
				
							
				
			</tr>
			<c:forEach varStatus="status"  step="1"  var="al" items="${alist}">
				<tr>
					<td>${status.index+1}</td>
					<td>
						<a data-toggle="collapse" data-target="#demo-${status.index}" style="cursor: pointer;">${al.bsubject}</a>
						<div id="demo-${status.index}" class="collapse" style="margin-left:10px;">
							${al.bcontent}
						</div>
					</td>
					 <td>관리자</td>
					 <td>${al.bday}</td>
					 <td>${al.bhits}</td>
					 
					 
					 <td>
				<c:choose>
				<c:when test="${sMidx eq '1'}">
					<p align="center">
					<a href="<%=request.getContextPath() %>/BoardModifyC?bidx=${al.bidx}">수정</a>
													
					</p>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
				</td>
				
				<td>
				<c:choose>
				<c:when test="${sMidx eq '1'}">
					<p align="center">
						<a href="<%=request.getContextPath() %>/BoardDeleteC?bidx=${al.bidx}">삭제</a>
					</p>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
				</td>
				
				</tr>
				

			</c:forEach>
		</table>
		</div>
			<c:choose>
				<c:when test="${sMidx eq '1'}">
					<p align="center">
						<input type="button" name="button" value="등록하기"
							onclick="javascript:check();" />
					</p>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
		

 </form>
 </body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>