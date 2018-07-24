<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function check() {	
	  
	  var formname = document.frm;
	  
	  if (formname.mname1.value =="") {
		  alert("이름을 입력하세요.");
		  formname.mname1.focus();	  
		  return ;	  
	  } else if (formname.mmail1.value ==""){	
		  alert("E-Mail을 입력하세요.");
		  formname.mmail1.focus();	  
		  return ;
	  }
	  
	 
	  var res;
	  	res = confirm("아이디 찾기!");
	  
	  	if (res == true) {
	  		
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath()%>	/MemberFindC";
			formname.submit();
		}
		return;
	}

	function check1() {
		location.href = "<%=request.getContextPath()%>MemberLoginController"
	}
	
	function check2() {
		location.href = "<%=request.getContextPath()%>MemberJoinController"
	}
	
	 function check3() {	
	 	  
		  var formname = document.frm;
		  
		  if (formname.mid.value =="") {
			  alert("아이디를 입력하세요.");
			  formname.mid.focus();	  
			  return ;	  
		  }else if (formname.mname.value ==""){	
			  alert("이름을 입력하세요.");
			  formname.mname.focus();	  
			  return ;
		  }else if (formname.mmail.value ==""){	
			  alert("E-Mail을 입력하세요.");
			  formname.mmail.focus();	  
			  return ;
		  }
		 
		  var res;
		  	res = confirm("비밀번호 찾기!");
		  
		  	if (res == true) {
		  		
			   	formname.method ="post";
			   	formname.action ="<%=request.getContextPath()%>	/MemberFindPWdC";
				formname.submit();
			}
			return;
		}
	
</script>

</head>

<body>		
	<form name="frm">
		
		
<h2 align="center">아이디 찾기</h2>
<br>
<center>
<div>
					
<input class="form-control" id="mname1" name="mname1" maxlength="20" style="width: 230px; height: 30px;" required="" type="text" placeholder="이름을 입력하세요." data-error="" />

<input class="form-control" required="" placeholder="E-Mail 주소를 입력하세요." data-error="" type="text" name="mmail1" id="mmail1" style="width: 230px; height: 40px;" maxlength="20" />

<input class="form-control" required="" placeholder="아이디가 나타납니다." data-error="" type="text" style="width: 230px; height: 40px;" maxlength="20" value="${mf.mid}" />


<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check();" >아이디찾기</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check1();" >로그인</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check2();" >회원가입</button>
								
		
		<br>
		<br>
				 
<h2 align="center">비밀번호 찾기</h2>
<br>
<input class="form-control" type="text" name="mid" id="mid" style="width: 230px; height: 30px;" required="" size="20" maxlength="20" placeholder="아이디를 입력하세요." data-error=""/>
<input class="form-control" type="text" name="mname" id="mname" style="width: 230px; height: 30px;" required="" size="20" maxlength="20" placeholder="이름을 입력하세요." data-error="" />
<input class="form-control" type="text" name="mmail" id="mmail" style="width: 230px; height: 30px;" required="" size="20" maxlength="20" placeholder="E-Mail을 입력하세요." data-error="" />

<input class="form-control" required="" placeholder="비밀번호가 나타납니다." data-error="" type="text" style="width: 230px; height: 40px;" maxlength="20" value="${pf.mpwd}" />		
											
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check3();" >비밀번호찾기</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check1();" >로그인</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check2();" >회원가입</button>
		</div>
		</center>	
	</form>	
</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>