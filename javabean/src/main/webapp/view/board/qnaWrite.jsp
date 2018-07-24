<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
function check() {
		 
		 var res;
	     res= confirm("글을 등록하겠습니까?");
		 
		 if(res==true){
			 document.frm.method="post";
			 document.frm.action="${pageContext.request.contextPath}/QnaWriteActionC";
			 document.frm.submit();
			
		       	}
	 }
	
</script>
<title>Insert title here</title>
</head>
<body>
<form name="frm">
<input type="hidden" name="proidx" value="${proidx}">
<input type="hidden" name="pronum" value="${pronum}">
<div style="text-align:center;"><h1>Q & A</h1></div>
<br><br>
<div class="form-group">
                    <i class="contact-icon fa fa-user"></i>
                    <select class="form-control" name="qsubject">
					<option value="상품문의">상품문의</option>
					<option value="배송문의">배송문의</option>
					<option value="사이즈문의">사이즈문의</option>
					<option value="재입고문의">재입고문의</option>
					<option value="기타">기타</option>
				</select>
                  </div>

<div class="col-sm-12">
                  <div class="form-group">
                    <textarea class="form-control" name="qcontent" id="qcontent" class="text" cols="100" rows="14"></textarea>
                    <div class="help-block with-errors"></div>
                  </div>
                  <div class="h3 text-center hidden" id="msgSubmit"></div>
                  <div class="clearfix"></div>
                </div>



<div>
<button class='btn std-btn btn-filled' onclick="check();" >등록</button>
<button class='btn std-btn btn-filled' onclick="history.back();" >이전페이지</button>
</div>
</form>
</body>

</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>