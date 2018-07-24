<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

</script>

<body>

<h1>내 게시물 조회</h1>
<br>
<br>
<br>
<%-- <input type="button" id="review" value="Review" onclick="location.href='${request.getContextPath}/MyReviewC'">
<input type="button" id="qna" value="QnA" onclick="location.href='${request.getContextPath}/MyQnaC'">
 --%>
 
<h4 style="color: gray;">Review</h4>
<table class="table22">
	<tr>
		<th>내용</th>
		<th style="width: 30%;">작성일</th>
	</tr>
	<c:forEach var="prorvo" items="${alistr}">
	<tr>
		<td>${prorvo.rcontent}</td>
		<td >${prorvo.rday}</td>
	</tr>
	</c:forEach>
</table>
<br>
<div class="table-style1">
				<h4 style="color: gray;">Q&A</h4>
				<div class="table-responsive mtb">
					<table class="table table-bordered table-1 ">
							<tr>
								<th>번호</th>
								<th>답변유무</th>
								<th width="50%">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th></th>
							</tr>
						<tbody>
							<c:forEach var="ql" varStatus="status" items="${alistq}">
								<tr>
									<td>${status.index+1}</td>
									<td><c:choose>
											<c:when test="${ql.qreply_yn eq 'Y' }">
						<strong>답변완료</strong>
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
									<td><c:choose>
											<c:when test="${ql.midx eq sMidx and sMidx != '1'}">
												<a
													href="${pageContext.request.contextPath}/QdelteC?qidx=${ql.qidx}&pronum=${ql.pronum}">삭제</a>
											</c:when>

											<c:when test="${sMidx eq '1'}">
												<a
													href="${pageContext.request.contextPath}/QdelteAdminC?qidx=${ql.qidx}&pronum=${ql.pronum}">관리자삭제</a>
											</c:when>

										</c:choose></td>
								</tr>


							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>


</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>	
