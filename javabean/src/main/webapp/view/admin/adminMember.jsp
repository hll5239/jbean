<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 
 <form name="searchform" action="${pageContext.request.contextPath}/AMemberCareC">
<div class="table1-style1" style="float:right">
              <div class="sub-title">
                <span><h3>회원검색</h3></span>
              </div>
              <div class="table1-responsive mtb">
                <table  class="table1 table-bordered table1-1 ">
                  <thead>
                   <tr>
						<td>검색조건</td>
						<td>
						<input type="radio" name="searchType"  value="Mid" checked>아이디 
						<input type="radio" name="searchType"  value="Mname">회원명
						<input type="radio" name="searchType"  value="Mmail">이메일
						<input type="radio" name="searchType"  value="Mphone">연락처
						</td>
						</tr>
                  </thead>
                  <tbody>
                  <tr>
					<td>입력</td>
					<td>
					<input class="form-control" name="keyword" id="keyword" required="" type="text" >
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
  	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div class="table-style3">
              <div class="sub-title">
                <span><h3>회원관리</h3></span>
              </div>
              <div class="table-responsive mtb">
                <table class="table table-hover">
                  <thead>
                    <tr>
                    <th>ID</th>
					<th>PW</th>
					<th>이름</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>주소</th>
					<th>등록일</th>
					<th>회원ip</th>
					<th>삭제유무</th>
					<th colspan=2></th>

                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="ml" items="${mlist}">
					<tr>
					<td>${ml.mid}</td>
					<td>${ml.mpwd}</td>
					<td>${ml.mname}</td>
					<td>${ml.mmail}</td>
					<td>${ml.mphone}</td>
					<td>${ml.mpost} ${ml.maddr1} ${ml.maddr2}</td>
					<td>${ml.mday}</td>
					<td>${ml.mip}</td>
					<td>${ml.mdel_yn}</td>
					<td><a href="${pageContext.request.contextPath}/AMemberModifyC?midx=${ml.midx}">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/AMemberDeleteC?midx=${ml.midx}">삭제</a></td>
					
					</tr>
					</c:forEach>
                  </tbody>
                </table>

              </div>
            </div>   


</body>
</html>
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	