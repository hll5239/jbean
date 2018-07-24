<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "WEB-INF/views/include/header.jsp"%>
		
		


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

      <!-- End sliders -->
      

          
          
      <!-- ProList -->
            <div class="team-members mtb-50">
              <div class="row" >
              
              <c:forEach var="prov" items="${alistProA}">
                <div class="col-sm-6 col-md-3" style="padding-bottom:30px;">
                  <!-- Team Item Starts -->
                  <div class="team-item">
                    <figure class="team-profile">
                      <a href="${request.contextPath}/ProInfoC?pronum=${prov.pronum}"><img src="displayFile?fileName=${prov.promain}" class="img-responsive" style="width:auto; height: 300px;"></a>
                    </figure>
                    <div class="info">
                      <h2>
                        ${prov.proname}
                      </h2>
                      <p>
                        ${prov.proprice}
                      </p>
                    </div>
                  </div>
                  <!-- Team Item Ends -->
                </div>
                </c:forEach>
                
              </div>
            </div>
            <!-- End ProList -->

	
	

  <!-- Page Wrapper End -->
<%@ include file = "WEB-INF/views/include/footer.jsp"%>	



 