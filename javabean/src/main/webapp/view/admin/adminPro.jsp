<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
 function writer() {
 
	 var res;
     res= confirm("상품을 등록하시겠습니까?");
	 
	 if(res==true){
		 document.frm.method="post";
		 document.frm.action="${pageContext.request.contextPath}/AProductInsertC";
		 document.frm.submit();
		
	       	}
 }
 

 </script>

<title>Insert title here</title>
</head>
<body>
<div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a href="${pageContext.request.contextPath}/AcntC" class="filter btn btn-common" data-filter="all">
                  	메인 
                </a>
                <a href="${pageContext.request.contextPath}/AMemberC" class="filter btn btn-common" data-filter=".branding">
                 	 회원관리 
                </a>
                <a href="${pageContext.request.contextPath}/AProductC" class="filter btn btn-common active" data-filter=".marketing">
               	   상품관리
                </a>
                <a href="${pageContext.request.contextPath}/AOrderaC" class="filter btn btn-common" data-filter=".planning">
               	        주문관리 
                </a>
                <a href="#" class="filter btn btn-common" data-filter=".research">
                 	 통계 
                </a>
                <a href="#" class="filter btn btn-common" data-filter=".research">
                 	 게시판관리 
                </a>
              </div>

<form name="frm" action="${pageContext.request.contextPath}/AProductSelectC">
<div class="table1-style1" style="float:right;">
              <div class="sub-title">
                <span><h3>상품검색</h3></span>
              </div>
              <div class="table1-responsive mtb">
                <table class="table1 table-bordered table1-1 ">
                  <thead>
                   <tr>
						<td>분류선택</td>
						<td>
						<select name="cidx">
								<option value="1">티셔츠</option>
								<option value="2">니트</option>
								<option value="3">블라우스</option>
								<option value="4">치마</option>
								<option value="5">청바지</option>
						</select>
						</td>
					</tr>
                  </thead>
                  <tbody>
                  <tr>
					<td>상품명</td>
					<td><input class="form-control" name="proname" id="proname" required="" type="text" ></td>
				  </tr>
					<tr>
						<td>분류선택</td>
						<td>
						<select name="proprice">
										<option value="0">전체</option>
										<option value="1">1만원</option>
										<option value="2">2만원</option>
										<option value="3">3만원</option>
										<option value="4">4만원</option>
										
						</select>
						</td>
					</tr>
					<tr>
					<td colspan=2>
						<button class="btn std-btn btn-lg btn-info" type="button" onclick="submit()" style="float:right">
						                  검색하기
						</button>
					</td>
					</tr>
                  </tbody>
                </table>
              </div>
            </div>
</form>

		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<button class="btn std-btn btn-lg btn-info" type="button" onclick="writer()" style="float:right">
		                  등록하기
		</button>

<div class="table-style3">
              <div class="sub-title">
                <span><h3>상품관리</h3></span>
              </div>
              <div class="table-responsive mtb">
                <table class="table table-hover">
                  <thead>
                    <tr>
		            <th>분류</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>가격(재고)</th>
					<th colspan=2></th>

                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="prov" items="${alist}">
					<tr>
					<td>
					
						<c:choose>
						<c:when test="${prov.cidx eq '1'}">
						티셔츠
						</c:when>
						<c:when test="${prov.cidx eq '2'}">
						니트
						</c:when>
						<c:when test="${prov.cidx eq '3'}">
						블라우스
						</c:when>
						<c:when test="${prov.cidx eq '4'}">
						치마
						</c:when>
						<c:otherwise>
						청바지
						</c:otherwise>
						</c:choose>
					
					</td>
					<td>${prov.proname}</td>
					<td>${prov.prosize}</td>
					<td>${prov.proprice} (${prov.procnt})</td>
					<td><a href="${pageContext.request.contextPath}/AProductModifyC?proidx=${prov.proidx}">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/AProductDeleteC?proidx=${prov.proidx}">삭제</a></td>
					</tr>
					
					</c:forEach>
					                  </tbody>
					                </table>
					
					              </div>
					            </div> 

</body>
</html>
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	
