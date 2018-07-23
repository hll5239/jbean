<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>


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
	<div class="table-style3">
	<div class="table-responsive mtb">
	<h3 class="list-title">상품</h3>
	<table class="table" style="border: 1">
       <thead class="thead-default">
         <tr>
           <th></th>
           <th>상품정보</th>
           <th>판매가</th>
           <th>수량</th>
           <th>합계</th>
         </tr>
       </thead>
       <tbody>
         <tr>
           <c:set var="sum" value="${0}"/>
			<c:forEach var="buyvo" items="${alist}">
			<c:set var="oid" value="${buyvo.oid}"/>
			<td><img src="/resources/helium-ui-kit/img/team/team-04.jpg" style="height:70px; width:auto;"></td>
			<td style="text-align: left;">${buyvo.proname}
				<br><c:out value="옵션 : [ ${buyvo.prosize} ]"/></td>
			<td><c:out value="${buyvo.proprice} 원" /></td>
			<td>${buyvo.ocnt}</td>
			<td><c:set var="prosum" value="${buyvo.proprice * buyvo.ocnt}"/>
				<c:out value="${prosum} 원" />
				<!-- sum은 값을 저장하는 역할 -->
				<c:set var="sum" value="${sum+prosum}"/></td>
			</c:forEach>
         </tr>
       </tbody>
     </table>
	</div>
	</div>
	
	
	<div class="table-style3" >
	<div class="table-responsive mtb">
	<table class="table" style="width: 50%; margin-left: auto; margin-right: auto;">
       <thead class="thead-default">
         <tr>
           <th>총 상품 금액</th>
           <th>+</th>
           <th>배송비</th>
           <th>=</th>
           <th>결제 예정 금액</th>
         </tr>
       </thead>
       <tbody>
         <tr>
           <td>${sum}원</td>
           <td></td>
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
			<td></td>
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
       </tbody>
     </table>
	</div>
	</div>
	
	<br>
	<br>
	
	<div class="table-style3">
	<div class="table-responsive mtb">
	<form name="form">
	<input type="hidden" name="oid" value="${oid}">
	<div style="float: left; width: 50%; padding-right:2%;">
	<h3 class="list-title">배송지 정보</h3>
     <table class="table11">
       <thead class="thead-default">
         <tr>
			<th>배송지</th>
			<td><input type="checkbox" id="box" class="form-control11" style="width:30px">기본배송지</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="dname" id="dname" class="form-control11"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="dphone" id="dphone" class="form-control11"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="dpost" id="dpost" placeholder="우편번호" class="form-control11" style="width: 100px">
				<input type="text" name="daddr1" id="daddr1" placeholder="도로명주소" class="form-control11" style="width: 200px"><br>
				<input type="text" name="daddr2" id="daddr2" placeholder="상세주소" class="form-control11" style="width: 303px;"></td>
		</tr>
		<tr>
			<th>배송메시지</th>
			<td><input type="text" name="dmsg" maxlength="50" placeholder="50자내로 입력하세요" class="form-control11" style="width: 303px;"></td>
		</tr>
     </table>
     
    <br>
	<br>
     
     <h3 class="list-title">결제정보</h3>
     <table class="table11">
       <thead class="thead-default">
         <tr>
			<th>결제수단</th>
			<td><input type="radio" name="ptype" value="B" checked >무통장입금 &nbsp;
				<input type="radio" name="ptype" value="C" disabled >카드결제 &nbsp;
				<input type="radio" name="ptype" value="P" disabled >핸드폰결제</td>
		</tr>
		<c:if test="${ptype == B}">	
		<tr>
			<th>입금은행</th>
			<td>국민은행  7000-110-00003(스앤피)</td>
		</tr>
		<tr>
			<th>입금자명</th>
			<td><input type="text" name="pname" class="form-control11"></td>
		</tr>
		</c:if>
	  </thead>
	  </table>
     </div>
     
	<div style="float: right; width: 50%; ">
	<div style="margin-left:auto; margin-right:auto; margin-top:15%; padding:10%; width: 80%; text-align:center; border: 5px solid #EB586F;">
	<h3 class="list-title">최종결제금액</h3>
		<br>
		<input type="hidden" name="pprice" value="${pprice}">
		<h1 style="font-size:50px;"><span class="text-primary">${pprice} 원</span></h1>
		<br>
		<br>
		<input type="checkbox" id="check" name="check" class="form-control11" style="width:30px">상기 결제 내용을 확인 하였습니다.
		<br>
		<br>
		<br>
		<input type="button" id="orderCheck" class="btn std-btn btn-lg btn-filled" value="결제하기">
		</div>
		</div>
	</form>
	</div>
	</div>

</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	