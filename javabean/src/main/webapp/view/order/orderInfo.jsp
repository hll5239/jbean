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
		
		var midx = ${sMidx};	

		$('#box').click(function(){
			
			if($('#box').is(":checked")){
				$.ajax({
					type : "POST",
					url : "Order/DefaultAddr/"+midx,
					headers : {
	                    "Content-Type" : "application/json", //이것과 컨트롤러  produces ="application/json;charset=UTF-8"과 일치해야함
	                    "X-HTTP-Method-Override" : "POST" //포스트 타입으로 넘기겠다. 안되는 브라워져를 위해, 브라우져특성상 못 읽을수 있기 때문.
	                 },
					datatype : "text",
					cache : false,
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       },
					success : function(data){
						
						$(data).each(function(){
							
						$("#dname").val(data.mname);
						$("#dphone").val(data.mphone);
						$("#dpost").val(data.mpost);
						$("#daddr1").val(data.maddr1);
						$("#daddr2").val(data.maddr2);
						
						});
					}
				       
				});
			
			}else{

				$("#dname").val("");
				$("#dphone").val("");
				$("#dpost").val("");
				$("#daddr1").val("");
				$("#daddr2").val("");
			}

		
		});
		
		$('#orderCheck').click(function(){
					
					if($('#check').is(":checked")){
						document.form.method ="POST"; //메소드 타입을 결정
						document.form.action ="${request.contextPath}/OrderFinishC";
											//이것은 보이지 않는 주소값을 반환해주는 것으로
											// 서버-톰켓-모듈-패스를 지워줘야 정상작동
						document.form.submit();
					}else{
						alert("결제동의를 클릭해 주십시오.");
						
					}
				
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
		<tr>
		<c:set var="sum" value="${0}"/>
			<c:forEach var="buyvo" items="${alist}">
			<c:set var="oid" value="${buyvo.oid}"/>
			<td>${buyvo.promain}</td>
			<td>${buyvo.proname}<br>${buyvo.prosize}</td>
			<td>${buyvo.proprice}</td>
			<td>${buyvo.ocnt}</td>
			<td><c:set var="prosum" value="${buyvo.proprice * buyvo.ocnt}"/>
				<c:out value="${prosum}원" />
				<!-- sum은 값을 저장하는 역할 -->
				<c:set var="sum" value="${sum+prosum}"/></td>
			</c:forEach>
			
		</tr>
	</table>

	<table>
		<tr>
			<td>총 상품 금액</td>
			<td>배송비</td>
			<td>결제 예정 금액</td>
		</tr>
		<tr>
			<td>${sum}원</td>
			<td>
				<c:choose>
				    <c:when test="${sum < 30000}">
				        2500원
				    </c:when>
				    <c:otherwise>
	        			무료
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
				    <c:when test="${sum < 30000}">
				        <c:set var="pprice" value="${sum + 2500}" />
				        <c:out value="${pprice}원"/>
				    </c:when>
				    <c:otherwise>
	        			<c:set var="pprice" value="${sum}" />
				        <c:out value="${pprice}원"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	
	<div id="tbl"></div>
	
	<form name="form">
	<input type="hidden" name="oid" value="${oid}">
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
				<input type="text" name="daddr1" id="daddr1" placeholder="도로명주소"><br>
				<input type="text" name="daddr2" id="daddr2" placeholder="상세주소"></td>
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
				<input type="radio" name="ptype" value="C" disabled>카드결제
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
		<br>
		<input type="text" name="pprice" value="${pprice}" style="border: none;" readonly>원
		<br>
		<input type="checkbox" id="check" name="check">상기 결제 내용을 확인 하였습니다.
		<br>
		<input type="button" id="orderCheck" value="결제하기">
	</form>

</body>
</html>