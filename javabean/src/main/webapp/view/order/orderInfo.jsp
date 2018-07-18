<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jb.jbean.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="mv" value="mv" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function(){
		$('#box').click(function(){
			alert("기본배송지 클릭함");
				
					$.ajax({
						type : "POST",
										//이곳에 들어감.
						url : "Order/DefaultAddr/${1}",
						datatype : "text",
						cache : false,
						error : function(){				
							alert("error");
						},
						success : function(data){


						}
					});
					
		});
		
		
	});
</script>

<body>

	<table>
		<tr>
			<td></td>
			<td>상품정보</td>
			<td>판매가</td>
			<td>수량</td>
			<td>합계</td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>${param.promain}</td>
			<td>${param.proname}<br>${param.prosize}</td>
			<td>${param.proprice}</td>
			<td>${param.cnt}</td>
			<td>${param.sum}</td>
		</tr>
	</table>
		<%-- <c:choose>
		    <c:when test="${param.baidx != null}">
		    	<c:forEach var="probav" items="${alist}">
		        <table border="1">
					<tr>
						<td>${param.promain}</td>
						<td>${param.proname}<br>${param.prosize}</td>
						<td>${param.proprice}</td>
						<td>${param.cnt}</td>
						<td>${param.sum}</td>
					</tr>
				</table>
				</c:forEach>
		    </c:when>
		    <c:otherwise>
       			<table border="1">
					<tr>
						<td>${param.promain}</td>
						<td>${param.proname}<br>${param.prosize}</td>
						<td>${param.proprice}</td>
						<td>${param.cnt}</td>
						<td>${param.sum}</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose> --%>
	
	<table>
		<tr>
			<td>총 상품 금액</td>
			<td>배송비</td>
			<td>결제 예정 금액</td>
		</tr>
		<tr>
			<td>${param.sum}원</td>
			<td>
				<c:choose>
				    <c:when test="${param.sum < 30000}">
				        2500원
				    </c:when>
				    <c:otherwise>
	        			무료
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
				    <c:when test="${param.sum < 30000}">
				        ${param.sum + 2500}원
				    </c:when>
				    <c:otherwise>
	        			${param.sum}원
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	<label>배송지 정보</label>
	<table>
		<tr>
			<td>배송지</td>
			<td><input type="checkbox" id="box">기본배송지</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="dname" id="dname"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="dphone" id="dphone"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="dpost" id="dpost" placeholder="우편번호"><br>
				<input type="text" name="addr1" id="addr1" placeholder="도로명주소"><br>
				<input type="text" name="addr2" id="addr2" placeholder="상세주소"></td>
		</tr>
		<tr>
			<td>배송메시지</td>
			<td><input type="text" name="dmsg"></td>
		</tr>
	</table>
	
	<label>결제정보</label>
	<table>
		<tr>
			<td>결제수단</td>
			<td><input type="radio" name="ptype" value="B" checked>무통장입금
				<input type="radio" name="ptype" value="C" disabled>신용/체크카드
				<input type="radio" name="ptype" value="P" disabled>핸드폰결제</td>
		</tr>
		<c:if test="${ptype == B}">	
		<tr>
			<td>입금은행</td>
			<td>국민은행  7000-110-00003(스앤피)</td>
		</tr>
		<tr>
			<td>입금자명</td>
			<td><input type="text" name="pname"></td>
		</tr>
		</c:if>
	</table>
	<br>
	<br>
	<label>최종결제금액</label>
		<c:choose>
		    <c:when test="${param.sum < 30000}">
		        ${param.sum + 2500}원
		    </c:when>
		    <c:otherwise>
	      			${param.sum}원
			</c:otherwise>
		</c:choose>
		<br>
		<input type="checkbox" id="check">상기 결제 내용을 확인 하였습니다.
		<br>
		<input type="button" id="order" value="결제하기">


</body>
</html>