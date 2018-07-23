<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jb.jbean.domain.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
  <head>
 
    </head>
   
   <!-- meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Bootstrap UI Kit">
  <meta name="keywords" content="ui kit">
  <meta name="author" content="UIdeck">
  
  <!-- CSS Files -->
  <link rel="stylesheet" href="/resources/helium-ui-kit/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/helium-ui-kit/css/main.css">
  <link rel="stylesheet" href="/resources/helium-ui-kit/css/animate.css">
  <link rel="stylesheet" href="/resources/helium-ui-kit/css/owl.carousel.css">
  <link rel="stylesheet" href="/resources/helium-ui-kit/css/owl.theme.css">
  <link rel="stylesheet" href="/resources/helium-ui-kit/css/responsive.css">

  <!-- Fonts icons -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  
 <!-- jQuery first, then Tether, then Bootstrap JS. -->
  <script src="/resources/helium-ui-kit/js/jquery.min.js"></script>
  <script src="/resources/helium-ui-kit/js/tether.min.js"></script>
  <script src="/resources/helium-ui-kit/js/bootstrap.min.js"></script>
  <script src="/resources/helium-ui-kit/js/owl.carousel.min.js"></script>

  <script src="/resources/helium-ui-kit/js/form-validator.min.js"></script>
  <script src="/resources/helium-ui-kit/js/contact-form-script.js"></script>
  <script src="/resources/helium-ui-kit/js/main.js"></script>
  
  <!-- jQuery 최신버전-->
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
 </div>
  <!-- Page Wrapper Start -->
  	<div class="wrapper">
    <!-- Content Area Start -->
    <div id="content">
      <div class="container">
        <!-- row start -->
        <div class="row">
          <div class="col-md-12">