<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>


 <!-- ProList -->
            <div class="team-members mtb-50">
              <div class="row">
              
              <c:forEach var="prov" items="${alistProL}">
                <div class="col-sm-6 col-md-3">
                  <!-- Team Item Starts -->
                  <div class="team-item">
                    <figure class="team-profile">
                    <a href="${request.contextPath}/ProInfoC?pronum=${prov.pronum}"><img src="/resources/helium-ui-kit/img/team/team-04.jpg">
                       <figcaption class="our-team">
                    	</figcaption>
                   	</a>
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
<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	



 