<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fileDrop {
	width: 80px;
	height: 55px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	function addFilePath(msg){
		alert(msg);	
	}

	function checkImageType(fileName){
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		alert(fileName.match(pattern));
		
		return fileName.match(pattern);
	}

	function getOriginalName(fileName){
//		alert(fileName);
		//이미지파일이면 원본이름 안쓴다
		if (checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.lastIndexOf("_")+1;
		
		alert(idx);
		return fileName.substr(idx);
	}

	//파일이 이미지일경우
	function getImageLink(fileName){
		if (!checkImageType(fileName)) {
			return;
		}
		//위치 폴더뽑기
		var front = fileName.substr(0,12);
		//파일이름뽑기
		//_는 빼고
		var end = fileName.substr(14);
		
		return front+end;	
	}
	
	
	$(function(){
		
		
	$('#buy').click(function(){
		alert("바로구매");
		
		if(${sMid eq null}){
			location.href = "<%=request.getContextPath()%>/MemberLoginController"
		}else{
			
			document.form.method ="POST"; //메소드 타입을 결정
			document.form.action ="${request.contextPath}/OrderInsertC";
								//이것은 보이지 않는 주소값을 반환해주는 것으로
								// 서버-톰켓-모듈-패스를 지워줘야 정상작동
			document.form.submit();
		}
		
		
	});
	
	$('#basket').click(function(){
		
		if(${sMid eq null}){
			location.href = "<%=request.getContextPath()%>/MemberLoginController"
		}else{
		alert("장바구니");
		document.form.method ="POST"; //메소드 타입을 결정
		document.form.action ="${request.contextPath}/BasketInsertC";
							//이것은 보이지 않는 주소값을 반환해주는 것으로
							// 서버-톰켓-모듈-패스를 지워줘야 정상작동
		document.form.submit();
		}
	});
	
	$(".fileDrop").on("dragenter dragover",function(event){
		
		event.preventDefault();		
	});
	
	$(".fileDrop").on("drop",function(event){
		
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		$.ajax({
			url:'/uploadc',
			data: formData,
			dataType:'text',
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
			processData:false,
			contentType:false,
			type:'POST',
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#rfilename").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+ "<img src='displayFile?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList").append(str);
			}		
			
		});	
		
	});	
	
	/*리뷰 에이작스  */
	var pronum= $("#pronum").val();
	var midx=$("#midx").val();
	$.ajax({
		type : "GET",
		url  : "<%=request.getContextPath()%> /reviews/all/" + pronum,
					datatype : "text",
					cache : false,
					error : function() {
						alert("error");
					},
					success : function(data) {
						var str = '';
						var index = 0
						var modinput = "";
						var delinput = "";
						
						$(data).each(function(index) {

											if (midx == this.midx) {
												delinput = "<li class='sub5'><button class='btn std-btn btn-sm btn-filled' onclick='$.del("
														+ this.ridx
														+ ")'>삭제</button></li>";

											}

											if (this.rfilename != null) {
												filename = "<img src='/displayc?fileName="
														+ this.rfilename
														+ "' style='width:100%; height:auto'>"
											} else {
												filename = "<ul><li></li>";
											}
											
											
											
											if(this.rstar== 5){
												star="<span style='color:red'>★★★★★</span> 완전좋아요";
											}else if(this.rstar==4){
												star="<span style='color:red'>★★★★</span> 좋아요";
											}else if(this.rstar==3){
												star="<span style='color:red'>★★★</span> 보통이에요";
											}else if(this.rstar==2){
												star="<span style='color:red'>★★</span> 그저 그래요";
											}else {
												star="<span style='color:red'>★</span> 별로에요";
											}

											str += "<div class='table-style3'>"
									              +"<div class='sub-title'>"
								              +"</div>"
								              +"<div class='table-responsive mtb'>"
								               +" <table class='table table-hover'>"
								                 +" <tbody>"
								                 +" <tr>"					                 
								                 +" <td style='width:30%'>"+filename+"</td>"
								                 +" <td style='width:30%'>"+star+"<br>"+ this.rcontent+"</td>"
								                 +" <td>작성자:" +this.mname+ "<br> 작성일:"+this.rday+"</td>"
								                 +" <td>"+delinput+"</td>"
								                 +" </tr>"
								                 +" </tbody>"
								                 +" </table>"

								                 +" </div>"
								                 +" </div>"  ;
										});

						$('#tbl').html(str);

					}
				});

		//댓글 입력
		$('#save')
				.click(
						function() {
							//속성이기 때문에, 제이쿼리 밖으로 빼면 안됌. 아래 List나 del은 새로운 스크립트
							var pronum = $("#pronum").val();
							var midx = $("#midx").val();
							var proidx = $("#proidx").val();
							var rstar = $("#rstar").val();
							var rcontent = $("#rcontent").val();
							var rfilename = $("#rfilename").val()

							$
									.ajax({
										type : "POST",
										url : "/reviews", //컨트롤러와 같은경로
										headers : {
											"Content-Type" : "application/json", //json으로
											"X-HTTP-Method-Override" : "POST" //포스트 타입으로 넘기겠다. 안되는 브라워져를 위해, 브라우져특성상 못 읽을수 있기 때문.
										},
										datatype : "text", //데이터를 텍스트 타입으로 보내는데,
										data : JSON.stringify({ //제이슨타입으로 문자화 한다. 
											pronum : pronum,
											proidx : proidx,
											rstar : rstar,
											rfilename : rfilename,
											rcontent : rcontent
										}),
										cache : false,
										error : function() {
											alert("error");
										},
										success : function(data) {
											var str = '';
											var index = 0
											var modinput = "";
											var delinput = "";

											$(data).each(function(index) {

												if (midx == this.midx) {
													delinput = "<li class='sub5'><button class='btn std-btn btn-sm btn-filled' onclick='$.del("
															+ this.ridx
															+ ")'>삭제</button></li>";

												}

												if (this.rfilename != null) {
													filename = "<img src='/displayc?fileName="
															+ this.rfilename
															+ "' style='width:100%; height:auto'>"
												} else {
													filename = "<ul><li></li>";
												}
												
												
												
												if(this.rstar== 5){
													star="<span style='color:red'>★★★★★</span> 완전좋아요";
												}else if(this.rstar==4){
													star="<span style='color:red'>★★★★</span> 좋아요";
												}else if(this.rstar==3){
													star="<span style='color:red'>★★★</span> 보통이에요";
												}else if(this.rstar==2){
													star="<span style='color:red'>★★</span> 그저 그래요";
												}else {
													star="<span style='color:red'>★</span> 별로에요";
												}

												str += "<div class='table-style3'>"
										              +"<div class='sub-title'>"
									              +"</div>"
									              +"<div class='table-responsive mtb'>"
									               +" <table class='table table-hover'>"
									                 +" <tbody>"
									                 +" <tr>"					                 
									                 +" <td style='width:30%'>"+filename+"</td>"
									                 +" <td style='width:30%'>"+star+"<br>"+ this.rcontent+"</td>"
									                 +" <td>작성자:" +this.mname+ "<br> 작성일:"+this.rday+"</td>"
									                 +" <td>"+delinput+"</td>"
									                 +" </tr>"
									                 +" </tbody>"
									                 +" </table>"

									                 +" </div>"
									                 +" </div>"  ;
											});

											$('#tbl')
													.html(str);

										}

									});
						});

	});

	$.del = function(ridx) {
		alert("삭제버튼")
		var pronum = $("#pronum").val();
		var ridx = ridx;
		alert(ridx);

		$
				.ajax({
					type : "GET",
					url : "/reviews/del/" + ridx + "/" + pronum,
					datatype : "text",
					cache : false,
					error : function() {
						alert("error");
					},
					success : function(data) {
						var str = '';
						var index = 0
						var modinput = "";
						var delinput = "";

						$(data).each(function(index) {

							if (midx == this.midx) {
								delinput = "<li class='sub5'><button class='btn std-btn btn-sm btn-filled' onclick='$.del("
										+ this.ridx
										+ ")'>삭제</button></li>";

							}

							if (this.rfilename != null) {
								filename = "<img src='/displayc?fileName="
										+ this.rfilename
										+ "' style='width:100%; height:auto'>"
							} else {
								filename = "<ul><li></li>";
							}
							
							
							
							if(this.rstar== 5){
								star="<span style='color:red'>★★★★★</span> 완전좋아요";
							}else if(this.rstar==4){
								star="<span style='color:red'>★★★★</span> 좋아요";
							}else if(this.rstar==3){
								star="<span style='color:red'>★★★</span> 보통이에요";
							}else if(this.rstar==2){
								star="<span style='color:red'>★★</span> 그저 그래요";
							}else {
								star="<span style='color:red'>★</span> 별로에요";
							}

							str += "<div class='table-style3'>"
					              +"<div class='sub-title'>"
				              +"</div>"
				              +"<div class='table-responsive mtb'>"
				               +" <table class='table table-hover'>"
				                 +" <tbody>"
				                 +" <tr>"					                 
				                 +" <td style='width:30%'>"+filename+"</td>"
				                 +" <td style='width:30%'>"+star+"<br>"+ this.rcontent+"</td>"
				                 +" <td>작성자:" +this.mname+ "<br> 작성일:"+this.rday+"</td>"
				                 +" <td>"+delinput+"</td>"
				                 +" </tr>"
				                 +" </tbody>"
				                 +" </table>"

				                 +" </div>"
				                 +" </div>"  ;
						});

						$('#tbl')
								.html(
										"<ul><li class='title1'>평점</li><li class='title2'>내용</li><li>작성자</li><li>작성일</li></ul>"
												+ str);

					}

				});
	}

	function check() {

		var res;
		res = confirm("글을 등록하겠습니까?");

		if (res == true) {
			document.form.method = "post";
			document.form.action = "${pageContext.request.contextPath}/QnaWriteC?proidx="
					+ $("#proidx").val() + "&pronum=" + $("#pronum").val();
			document.form.submit();

		}
	}
	function rply(idx){
		var res;
		res = confirm("답변을 다시겠습니까?");
		$('#qidx').val($('#qidxx'+idx).val());		
		$('#qreply').val($('#qreplyy'+idx).val());
	
		

		if (res == true) {
			document.frm.method = "post";
			document.frm.action = "${pageContext.request.contextPath}/QAdminReplyC"
			document.frm.submit();
		}
		
		
	}
	
	
</script>


<body onload="init();">

	<div class="mb-60"></div>

	<div class="row">
		<div class="col-md-12">
			<div class="sub-title"></div>
		</div>

		<form id="frm" name="frm">
			<input type="hidden" name="qidx" id="qidx"> <input
				type="hidden" name="qreply" id="qreply"> <input
				type="hidden" name="pronum" value="${pronum}">

		</form>
		<form name="form">
			<!-- Page Wrapper Start -->


			<input type="hidden" name="pronum" value="${pronum}">

			<c:forEach var="prov" begin="0" varStatus="status"
				items="${alistProI}">
				<div>
					<c:if test="${status.index eq 0}">
						<div
							style="float: left; width: 50%; text-align: right; padding-right: 2%;">
							<img src="displayFile?fileName=${prov.promain}" class="img-responsive" style="width:auto; height: 233px;">
						</div>
						<div
							style="float: right; width: 50%; text-align: left; padding-left: 2%;">
							<ul style="list-style: none;">

								<li><span style="width: 15%; display: inline-block;"><strong>상품명</strong></span>
									<input type="text" name="proname" style="border: none;"
									readonly value="${prov.proname}"></li>
								<li><span style="width: 15%; display: inline-block;"><strong>가격</strong></span>
									<input type="text" name="proprice" style="border: none;"
									readonly value="${prov.proprice}"></li>
								<li><span style="width: 15%; display: inline-block;"><strong>배송비</strong></span>
									<c:choose>
										<c:when test="${prov.proprice > 30000 }">
											<c:out value="무료"></c:out>
										</c:when>
										<c:otherwise>
											<input type="text" value="2500" size="4" readonly style="border: none;">원
										</c:otherwise>
									</c:choose></li>
								<li><span style="width: 15%; display: inline-block;"><strong>옵션</strong></span>
									<input type="hidden" id="pronum" name="pronum"
									value="${prov.pronum}"> <select id="proidx"
									name="proidx">
										<c:forEach var="provs" items="${alistProI}">
											<option value="${provs.proidx}">${provs.prosize}</option>
										</c:forEach>
								</select></li>
								<li><span style="width: 15%; display: inline-block;"><strong>수량</strong></span>
									<input type="hidden" name="proprice" id="price"
									value="${prov.proprice}"> <input type="text" name="cnt"
									value="1" size="3" maxlength="2" onchange="change();">
									<input type="button" value=" + " onclick="add();"> <input
									type="button" value=" - " onclick="del();"></li>
							</ul>
							<ul style="list-style: none;">
								<li><span style="width: 15%; display: inline-block;"><strong>금액</strong></span>
									<input type="text" name="sum" size="8" readonly	style="border: none;">원</li>
								<br>
								<li><span><input type="button"
										class="btn btn-common" id="buy" value="바로구매" /> <input
										type="button" class="btn btn-common" id="basket" value="장바구니" /></span></li>
							</ul>
						</div>
					</c:if>
				</div>
			</c:forEach>
			<input type="hidden" name="midx" id="midx" value="${sMidx}">


			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
		
			
			<div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a href="#info1" class="filter btn btn-common active"  name="info1" data-filter="all">
                  	상품상세 
                </a>
                <a href="#info2" class="filter btn btn-common"  data-filter=".branding">
                 	 상품정보 
                </a>
                <a href="#info3" class="filter btn btn-common"  data-filter=".marketing">
                  Review
                </a>
                <a href="#info4" class="filter btn btn-common"  data-filter=".planning">
                  Q&A 
                </a>
                
              </div>
			<div style="padding-top: 2%; padding-bottom: 2%;">
			<img src="displayFile?fileName=${prov.prosub1}" class="img-responsive" style="width:100%; height: auto;"> <br>
			<img src="displayFile?fileName=${prov.prosub2}" class="img-responsive" style="width:100%; height: auto;"> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
			</div>
			<div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a href="#info1" class="filter btn btn-common "   data-filter="all">
                  	상품상세 
                </a>
                <a href="#info2" class="filter btn btn-common active" name="info2"  data-filter=".branding">
                 	 상품정보 
                </a>
                <a href="#info3" class="filter btn btn-common "   data-filter=".marketing">
                  Review
                </a>
                <a href="#info4" class="filter btn btn-common"   data-filter=".planning">
                  Q&A 
                </a>
                
              </div>
			
			<div style="padding-top: 2%; padding-bottom: 2%;">
			<img src="displayFile?fileName=${prov.proinfo}" class="img-responsive" style="width:100%; height: auto;"> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
			</div>
			
			<div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a href="#info1" class="filter btn btn-common "   data-filter="all">
                  	상품상세 
                </a>
                <a href="#info2" class="filter btn btn-common "   data-filter=".branding">
                 	 상품정보 
                </a>
                <a href="#info3" class="filter btn btn-common active" name="info3"  data-filter=".marketing">
                  Review
                </a>
                <a href="#info4" class="filter btn btn-common"   data-filter=".planning">
                  Q&A 
                </a>
                
              </div>
			<div>
				<h1>Review</h1>
				
				<textarea name="rcontent" id="rcontent" class="text"
						cols="120" rows="6"></textarea>
			<input type="hidden" id="rfilename" name="rfilename">
				
				<div style="float: left; width:37%;" class="fileDrop">사진첨부</div>
				<div class='uploadedList'></div>
				<select class="form1-control input-lg" style="width:33%; height:56px;" name="rstar" id="rstar">
						<option value="5">★★★★★ 완전좋아요</option>
						<option value="4">★★★★ 좋아요</option>
						<option value="3">★★★ 보통이에요</option>
						<option value="2">★★ 그저 그래요</option>
						<option value="1">★ 별로에요</option>
				</select>
				<button class='btn std-btn btn-lg btn-filled' style="float:left; width:70%;" name="save" id="save">입력</button>
				</div>
				
				
				
				
				
			

		<br><br><br><br><br>
			<h3>상품평</h3>
			<div id=tbl></div>


			<div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a href="#info1" class="filter btn btn-common "   data-filter="all">
                  	상품상세 
                </a>
                <a href="#info2" class="filter btn btn-common "   data-filter=".branding">
                 	 상품정보 
                </a>
                <a href="#info3" class="filter btn btn-common "   data-filter=".marketing">
                  Review
                </a>
                <a href="#info4" class="filter btn btn-common active"  name="info4"  data-filter=".planning">
                  Q&A 
                </a>
                
              </div>
                
                <br>  <br>  <br>  <br>
			<div class="table-style1">
				<div style="text-align:center;" class="sub-title">
					<h1>Q&A</h1>
				</div>
				<div><button class='btn std-btn btn-filled' onclick="check();" >Q&A등록</button> </div>
				<div class="table-responsive mtb">
					<table class="table table-bordered table-1 ">
						<thead>
							<tr>
								<td>번호</td>
								<td>답변유무</td>
								<td width="50%">제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<c:choose>
									<c:when test="${ql.midx eq sMidx and sMidx != '1'}">
										<td></td>
									</c:when>

									<c:when test="${sMidx eq '1'}">
										<td></td>
									</c:when>

								 </c:choose>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ql" varStatus="status" items="${qlist}">
								<tr>
									<td>${status.index+1}</td>
									<td><c:choose>
											<c:when test="${ql.qreply_yn eq 'Y' }">
						답변완료
						</c:when>
											<c:otherwise>
						답변대기
						</c:otherwise>
										</c:choose></td>
									<td><a data-toggle="collapse"
										data-target="#demo-${status.index}" style="cursor: pointer;">
											<c:choose>
												<c:when test="${ql.qmdel_yn eq 'Y' }">
						삭제된 제목 입니다.
						</c:when>
												<c:otherwise>
						${ql.qsubject}
						</c:otherwise>
											</c:choose>

									</a>
										<div id="demo-${status.index}" class="collapse"
											style="margin-left: 10px;">

											<c:choose>
												<c:when test="${ql.qmdel_yn eq 'Y' }">
							삭제된 내용 입니다.
							</c:when>
												<c:otherwise>
							${ql.qcontent}
							</c:otherwise>
											</c:choose>

											<div style="background: lightgrey; padding: 10px;">
												<c:choose>
													<c:when test="${ql.qreply ne null }">
							관리자 답변 : ${ql.qreply}
							</c:when>
													<c:when test="${sMidx eq '1'}">

														<input type="text" name="qreply"
															id="qreplyy${status.index}">
														<input type="hidden" name="qidx" id="qidxx${status.index}"
															value="${ql.qidx}">

														<input type="button" value="답변"
															onclick="rply(${status.index})">

													</c:when>
													<c:otherwise>
							관리자 답변:
							</c:otherwise>
												</c:choose>

											</div>
										</div></td>
									<td>${ql.mname}</td>
									<td>${ql.qday}</td>
									<c:choose>
											<c:when test="${ql.midx eq sMidx and sMidx != '1'}">
												<td><a
													href="${pageContext.request.contextPath}/QdelteC?qidx=${ql.qidx}&pronum=${ql.pronum}">삭제</a></td>
											</c:when>

											<c:when test="${sMidx eq '1'}">
												<td><a
													href="${pageContext.request.contextPath}/QdelteAdminC?qidx=${ql.qidx}&pronum=${ql.pronum}">관리자삭제</a></td>
											</c:when>

										</c:choose>
								</tr>


							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
