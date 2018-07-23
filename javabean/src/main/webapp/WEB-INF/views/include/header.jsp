<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jb.jbean.domain.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/material-kit/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/resources/material-kit/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Material Kit by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="/resources/material-kit/assets/css/material-kit.css?v=2.0.4" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/resources/material-kit/assets/demo/demo.css" rel="stylesheet" />
    </head>
    
      <!-- jQuery 2.1.4  이 부분이 있기 때문에 페이지에 include하면 jquery를 사용할 수 있음-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
  <body class="skin-blue sidebar-mini">
   <div class="wrapper">
      
  <header class="main-header">
   <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container" style="margin-right: auto; margin-left: auto; display:block;">
      <div class="navbar-translate" style="height: 40px;">
        <span>
        <a class="navbar-brand" href="/">Piece & Style</a>
          </span>
          <span style="float:right;">
	        <c:choose>
				<c:when test="${sMid eq null}">
				<a href="MemberLoginController" class="navbar-brand2">로그인</a> |
				<a href="MemberJoinController" class="navbar-brand2">회원가입</a> |
				<a href="/BoardListN" class="navbar-brand2">공지사항</a> |
				<a href="/BoardListF" class="navbar-brand2">FAQ</a>
				</c:when>
				<c:otherwise>
				<c:out value="${sMid}님 안녕하세요"></c:out>
				<a href="MemberLogoutC" class="navbar-brand2">로그아웃</a> |
				<a href="MemberModifyController" class="navbar-brand2">회원정보수정</a> |
				<a href="/MypageC" class="navbar-brand2">마이페이지</a> |
				<a href="/BoardListN" class="navbar-brand2">공지사항</a> |
				<a href="/BoardListF" class="navbar-brand2">FAQ</a>
				<c:if test="${sMidx eq 1 }">
					| <a href="${pageContext.request.contextPath}/AcntC" class="navbar-brand2">관리자페이지</a>
				</c:if>
				</c:otherwise>
			</c:choose>
        </span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <c:forEach var="prov" items="${alistCate}">
				<a style="color:inherit; padding:0.9375rem; font-weight:400; font-size:12px;"  href="${request.contextPath}/ProListC?cidx=${prov.cidx}" >
					<span>${prov.cname}</span>
				</a>
			</c:forEach>
          </li>
        </ul>
      </div>
    </div>
  </nav>
      </header>
      
      
       <!--   Core JS Files   -->
  <script src="/resources/material-kit/assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="/resources/material-kit/assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="/resources/material-kit/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="/resources/material-kit/assets/js/plugins/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="/resources/material-kit/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="/resources/material-kit/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--	Plugin for Sharrre btn -->
  <script src="/resources/material-kit/assets/js/plugins/jquery.sharrre.js" type="text/javascript"></script>
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="/resources/material-kit/assets/js/material-kit.js?v=2.0.4" type="text/javascript"></script>
