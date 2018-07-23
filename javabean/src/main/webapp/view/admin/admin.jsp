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
   
<br><br>
<div id="counter" >
        <div class="container" >
          <h4 class="sub-title">회원</h4>
          <div class="row count-to-sec">
            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">총회원 수 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${mcnt}">${mcnt}(명)</h3>
              <hr class="width25-divider">
            </div>

            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">회원탈퇴 수 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${mdcnt}">${mdcnt}(명)</h3>
              <hr class="width25-divider">
            </div>

          </div>
        </div>
      </div>

<div id="counter" >
        <div class="container" >
          <h4 class="sub-title">답변</h4>
          <div class="row count-to-sec">
            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">답변안한 글 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${nrcnt}">${nrcnt}(개)</h3>
              <hr class="width25-divider">
            </div>
          </div>
        </div>
      </div>

<div id="counter" >
        <div class="container" >
          <h4 class="sub-title">상품</h4>
          <div class="row count-to-sec">
            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">입금대기 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${pbcnt}">${pbcnt}(명)</h3>
              <hr class="width25-divider">
            </div>
            
             <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">상품준비중 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${prcnt}">${prcnt}(개)</h3>
              <hr class="width25-divider">
            </div>
            
            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">상품취소 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${pccnt}">${pccnt}(개)</h3>
              <hr class="width25-divider">
            </div>
          </div>
        </div>
      </div>

<div id="counter" >
       <div class="container" style="float:right">
          <h4 class="sub-title">금액</h4>
          <div class="row count-to-sec">
            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">오늘 총 주문금액 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${noamount}">${noamount}(원)</h3>
              <hr class="width25-divider">
            </div>

            <div class="col-md-3 col-sm-6 count-one">
              <span class="icon">오늘 실 결제금액 </i></span>
              <h3 class="timer count-value" data-speed="1000" data-to="${npamount}">${npamount}(원)</h3>
              <hr class="width25-divider">
            </div>

           
          </div>
        </div>
      </div>
      
</body>
</html>
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	