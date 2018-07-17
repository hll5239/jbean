<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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

<script language="JavaScript">

	var sell_price;
	var amount;
	
	function init () {
		sell_price = $('#price').val();
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		change();
	}

	
	function add () {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value ++ ;
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	function del () {
		hm = document.form.amount;
		sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
	}
	
	function change () {
		hm = document.form.amount;
		sum = document.form.sum;
			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	
	$(function(){
		
	$('#buy').click(function(){
		alert("사기");
		document.form.method ="post"; //메소드 타입을 결정
		document.form.action ="view/order/orderInfo.jsp";
							//이것은 보이지 않는 주소값을 반환해주는 것으로
							// 서버-톰켓-모듈-패스를 지워줘야 정상작동
		document.form.submit();
		
	});
	
	$('#basket').click(function(){
		alert("장바구니");
		document.form.method ="post"; //메소드 타입을 결정
		document.form.action ="view/basket/basket.jsp";
							//이것은 보이지 않는 주소값을 반환해주는 것으로
							// 서버-톰켓-모듈-패스를 지워줘야 정상작동
		document.form.submit();
	});
	
	});

</script>


<body onload="init();">

	<div>
		<c:forEach var="prov" items="${alistCate}">
			<a href="${request.contextPath}/proList?cidx=${prov.cidx}"> <span>${prov.cname}</span>
			</a>
		</c:forEach>
	</div>
	
	<form name="form">
	<c:forEach var="prov" items="${alistProI}">
		<div>
			<div style="float: left; width: 50%; text-align: center;">${prov.promain}</div>
			<div style="float: left; width: 50%; text-align: center;">
				<ul style="list-style:none;">
					<li>${prov.proname}</li>
					<li>${prov.proprice}</li>
					<li>배송비</li>
					<li><select>
							<c:forEach var="provs" items="${alistProIS}">
								<option>${provs.prosize}</option>
							</c:forEach>
					</select></li>
					<li>수량<input type="hidden" id="price" value="${prov.proprice}">
							<input type="text" name="amount" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>							
					</li>
				</ul>
				<ul style="list-style:none;">
					<li>금액 <input type="text" name="sum" size="11" readonly style="background-color:silver;">원</li>
					<li>
						<span><input type="button" id="buy" value="바로구매" />
								<input type="button" id="basket" value="장바구니" /></span>
					</li>
				</ul>
			</div>
		</div>
	</c:forEach>
	</form>


</body>
</html>