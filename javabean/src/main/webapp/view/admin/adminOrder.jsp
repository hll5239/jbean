<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function () {
	
	$("#name").click(function () {
		var i = 0;
		alert(i);
	});
	 
	
	  
	});
</script>



<title>Insert title here</title>
</head>
<body>
	
	<div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a href="${pageContext.request.contextPath}/AcntC" class="filter btn btn-common" data-filter="all">
                  	메인 
                </a>
                <a href="${pageContext.request.contextPath}/AMemberC" class="filter btn btn-common active" data-filter=".branding">
                 	 회원관리 
                </a>
                <a href="${pageContext.request.contextPath}/AProductC" class="filter btn btn-common" data-filter=".marketing">
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
              
<form name="frm" action="${pageContext.request.contextPath}/AOrderSelectC">
<div class="table1-style1" style="float:right;">
              <div class="sub-title">
                <span><h3>주문검색</h3></span>
              </div>
              <div class="table1-responsive mtb">
                <table class="table1 table-bordered table1-1 ">
                  <thead>
                    <tr>
						<td>주문상태</td>
						<td><select name="ooidx">
								<option value="1">전체상품</option>
								<option value="2">입금대기</option>
								<option value="3">입금완료 및 상품준비</option>
								<option value="4">배송중</option>
								<option value="5">배송완료</option>
								<option value="6">취소</option>
		
						</select></td>
				</tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>주문검색</td>
					<td>
						<select name="searchType">
								<option value="o.Oid">주문번호</option>
								<option value="o.Oday">주문일</option>
								<option value="m.Mid">주문자ID</option>
		
						</select>
						<input class="form-control" name="keyword" id="keyword" required="" type="text"  >
					</td>

				</tr>
				<tr>
				<td colspan=2>
					<button class="btn std-btn btn-lg btn-info" type="button" onclick="submit()" style="float:auto">
			               	   검색
					</button>
				</td>
				</tr>
                  </tbody>
                </table>
              </div>
            </div>
</form>


	<div class="table-style3">
              <div class="sub-title">
                <span><h3>주문관리</h3></span>
              </div>
              <div class="table-responsive mtb">
                <table class="table table-hover">
                  <thead>
                    <tr>
		            <th>주문일</th>
					<th>주문번호</th>
					<th>주문자ID</th>
					<th>결제금액</th>
					<th>결제상태</th>
					<th>배송상태</th>
					<th colspan=2></th>

                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="ord" items="${oaList}">

						<tr>
							<td>${ord.oday}</td>
							<td>${ord.oid}</td>
							<td>${ord.mid}</td>
							<td>${ord.pprice}</td>
							<td>${ord.p_nxy}</td>
							<td>${ord.d_nxczy}</td>
							<td><a href="${pageContext.request.contextPath}/AOrdermC?mid=${ord.mid}&oid=${ord.oid}">수정</a></td>
			
						</tr>
					</c:forEach>
                  </tbody>
                </table>

              </div>
            </div> 
	


</body>
</html>
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	