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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="JavaScript">

	var sell_price;
	var cnt;
	
	function init () {
		sell_price = $('#price').val();
		cnt = document.form.cnt.value;
		document.form.sum.value = sell_price;
		change();
	}

	
	function add () {
		hm = document.form.cnt;
		sum = document.form.sum;
		hm.value ++ ;
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	function del () {
		hm = document.form.cnt;
		sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
	}
	
	function change () {
		hm = document.form.cnt;
		sum = document.form.sum;
			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sell_price;
	}
	
	
	$(function(){
		
	$('#buy').click(function(){
		alert("바로구매");
		document.form.method ="POST"; //메소드 타입을 결정
		document.form.action ="${request.contextPath}/OrderC";
							//이것은 보이지 않는 주소값을 반환해주는 것으로
							// 서버-톰켓-모듈-패스를 지워줘야 정상작동
		document.form.submit();
		
	});
	
	$('#basket').click(function(){
		alert("장바구니");
		document.form.method ="POST"; //메소드 타입을 결정
		document.form.action ="${request.contextPath}/BasketC";
							//이것은 보이지 않는 주소값을 반환해주는 것으로
							// 서버-톰켓-모듈-패스를 지워줘야 정상작동
		document.form.submit();
	});
	
	var pronum= $("#pronum").val();
	var midx=$("#midx").val();
	$.ajax({
		type : "GET",
		url  : "<%=request.getContextPath()%>/reviews/all/"+pronum,
		datatype : "text",
		cache : false,
		error : function(){				
			alert("error");
		},
		success : function(data){
			 console.dir(data);
				var str = '';
				var index = 0
				var modinput="";
				var delinput="";
				
				/* if (midx == data.midx) {
					modinput ="<li class='sub4'><button  onclick='$.mod("+this.ridx+")'>수정</button></li>";         
					delinput ="<li class='sub5'><button  onclick='$.del("+this.ridx+")'>삭제</button></li>";
				
				} */
				$(data).each(function(index){
					str += "<ul><li class='sub1'>"+this.rstar  + "</li>" 
					+  "<li class='sub2'>"+this.mname + "</li>"
					+  "<li class='sub3'>"+this.rcontent  + "</li>"
					+  "<li class='sub3'>"+this.rday  + "</li>"
					+  modinput
					+  "<li class='sub5'><button  onclick='$.del("+this.ridx+")'>삭제</button></li>"
					+  "</ul>";					
				});
				
				$('#tbl').html("<ul><li class='title1'>평점</li><li class='title2'>내용</li><li>작성자</li><li>작성일</li></ul>"+str);	

		}			
	});
	
	//댓글 입력
	 $('#save').click(function(){
		 //속성이기 때문에, 제이쿼리 밖으로 빼면 안됌. 아래 List나 del은 새로운 스크립트
		 var bbidx = $("#bbidx").val();
		 var cwriter = $("#cwriter").val();
		 var ccontent = $("#ccontent").val();			 
		 
		 $.ajax({
				type : "POST",
				url  : "/comments", //컨트롤러와 같은경로
				headers : {
					"Content-Type" : "application/json", //json으로
					"X-HTTP-Method-Override" : "POST"	//포스트 타입으로 넘기겠다. 안되는 브라워져를 위해, 브라우져특성상 못 읽을수 있기 때문.
				},
				datatype : "text", //데이터를 텍스트 타입으로 보내는데,
				data : JSON.stringify({ 	//제이슨타입으로 문자화 한다. 
					bbidx : bbidx,		//각각을 받아
					cwriter : cwriter,
					ccontent : ccontent
				}),
				cache : false,
				error : function(){				
					alert("error");
				},
				success : function(data){
					if (data == null){
						alert("데이타없음");
					}
					 
					alert(data);
					
					//등록하면 헤더값 가져옴
					$.boardCommentList();
					
					//성공시 input값 초기화
					//여기 $("#bbidx").val(""); 입력해주면 bbidx값이 초기화 되서 넣으면 안됨
					$("#cwriter").val("");
					$("#ccontent").val("")
					}
				
			});	
	});
	
	
	});
	
	$.del = function(ridx){
		alert("삭제버튼")
		var pronum= $("#pronum").val();
		var ridx = ridx;
		alert(ridx);
		
		 $.ajax({
			type : "GET",
			url  : "/reviews/del/"+ridx+"/"+pronum,
			datatype : "text",				
			cache : false,
			error : function(){				
				alert("error");
			},
			success : function(data){
					var str = '';
					var index = 0
					var modinput="";
					var delinput="";
					
					/* if (midx == data.midx) {
						modinput ="<li class='sub4'><button  onclick='$.mod("+this.ridx+")'>수정</button></li>";         
						delinput ="<li class='sub5'><button  onclick='$.del("+this.ridx+")'>삭제</button></li>";
					
					} */
					$(data).each(function(index){
						str += "<ul><li class='sub1'>"+this.rstar  + "</li>" 
						+  "<li class='sub2'>"+this.mname + "</li>"
						+  "<li class='sub3'>"+this.rcontent  + "</li>"
						+  "<li class='sub3'>"+this.rday  + "</li>"
						+  modinput
						+  "<li class='sub5'><button  onclick='$.del("+this.ridx+")'>삭제</button></li>"
						+  "</ul>";					
					});
					
					$('#tbl').html("<ul><li class='title1'>평점</li><li class='title2'>내용</li><li>작성자</li><li>작성일</li></ul>"+str);	

			}
						
		});
	 }
</script>


<body onload="init();">

	<div>
		<c:forEach var="prov" items="${alistCate}">
			<a href="${request.contextPath}/ProListC?cidx=${prov.cidx}"> <span>${prov.cname}</span>
			</a>
			
		</c:forEach>
	</div>
	
	<form name="form">
	<c:forEach var="prov" begin="0" varStatus="status" items="${alistProI}">
		<div>
		 <c:if test="${status.index eq 0}">
			<div style="float: left; width: 50%; text-align: center;">
				<input type="text" name="promain" style="border:none;" readonly value="${prov.promain}"></div>
			<div style="float: left; width: 50%; text-align: center;">
				<ul style="list-style:none;">
					<li><input type="text" name="proname" style="border:none;" readonly value="${prov.proname}"></li>
					<li><input type="text" name="proprice" style="border:none;" readonly value="${prov.proprice}"></li>
					<li>배송비</li>
					<li><input type="hidden" id="pronum" name="pronum" value="${prov.pronum}">
							<select name="proidx">
							<c:forEach var="provs" items="${alistProI}">
								<option value="${provs.proidx}">${provs.prosize}</option>
							</c:forEach>
							</select>

							</li>
					<li>수량<input type="hidden" name="proprice" id="price" value="${prov.proprice}">
							<input type="text" name="cnt" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();">
							<input type="button" value=" - " onclick="del();">					
					</li>
				</ul> 
				<ul style="list-style:none;">
					<li>금액 <input type="text" name="sum" size="11" readonly style="border:none;">원</li>
					<li>
						<span><input type="button" id="buy" value="바로구매" />
								<input type="button" id="basket" value="장바구니" /></span>
					</li>
				</ul>
			</div>
			</c:if>
		</div>
	</c:forEach>
	<input type="hidden" name="midx" id="midx" value="${sMidx}">
	<div>
	
	<li>
	<textarea name="ccontent" id="ccontent" class="text"></textarea>
	</li>
	
	<li>사진추가${prov.pronum}</li>
	<li><select name="rstar">
						<option value="5">★★★★★ 완전좋아요</option>
						<option value="4">★★★★ 좋아요</option>
						<option value="3">★★★ 보통이에요</option>
						<option value="2">★★ 그저 그래요</option>
						<option value="1">★ 별로에요</option>
				</select>
	</li>
	<li><input type="button" name="save" id="save" value="저장"/></li>
	</div>
	</form>
	
<div id=tbl>
</div>

</body>
</html>