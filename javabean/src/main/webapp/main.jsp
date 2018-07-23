<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jb.jbean.domain.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file = "WEB-INF/views/include/header.jsp"%>

<div class="wrapper">
    <!-- Content Area Start -->
    <div id="content">
      <!-- sliders -->
      <div id="sliders">
        <div class="full-width">
          <div class="page-header-title">
          </div>
          <!-- light slider -->
          <div id="light-slider" class="carousel slide">
            <div id="carousel-area">
              <div id="carousel-slider" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-slider" data-slide-to="1"></li>
                  <li data-target="#carousel-slider" data-slide-to="2"></li>
                </ol>
                <!-- 슬라이더 이미지 -->
                <div class="carousel-inner" role="listbox">
                  <div class="carousel-item active">
                    <img src="/resources/helium-ui-kit/img/slider/bg-1.jpg" alt="">
                  </div>
                  <div class="carousel-item">
                    <img src="/resources/helium-ui-kit/img/slider/bg-2.jpg" alt="">
                  </div>
                  <div class="carousel-item">
                    <img src="/resources/helium-ui-kit/img/slider/bg-3.jpg" alt="">
                  </div>
                  <!-- 슬라이더 이미지 끝 -->
                </div>
                <a class="carousel-control-prev" href="#carousel-slider" role="button" data-slide="prev">
                  <span class="carousel-control carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel-slider" role="button" data-slide="next">
                  <span class="carousel-control carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End sliders -->

	<div style="padding-top:2%;">
		<c:forEach var="prov" items="${alistProA}">
			<div  style="float:left; width:30%; text-align:center;">
				<div><a href="${request.contextPath}/ProInfoC?pronum=${prov.pronum}">
				${prov.promain}</a></div>
				<div>${prov.proname}, ${prov.proprice}</div>
			</div>
		</c:forEach>
	</div>
    </div>
    <!-- Content Area End -->
  </div>
  <!-- Page Wrapper End -->

<%@ include file = "WEB-INF/views/include/footer.jsp"%>	


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
</head>
<body>
</body>
</html>

 