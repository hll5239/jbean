<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">



function check() {	
	 	  
	  var formname = document.frm;
	  
	  if (formname.mid.value =="") {
		  alert("아이디를 입력하세요.");
		  formname.mid.focus();	  
		  return ;	  
	  } else if (formname.mpwd.value ==""){	
		  alert("비밀번호를 입력하세요.??");
		  formname.mpwd1.focus();	  
		  return ;
	  }else if (formname.mpwd2.value ==""){	
		  alert("비밀번호를 다시 입력하세요.??");
		  formname.mpwd2.focus();	  
		  return ;
	  }else if (formname.mname.value ==""){	
		  alert("이름을 입력하세요.??");
		  formname.mname.focus();	  
		  return ;
	  }

	  var res;
	  	res = confirm("가입 하시겠습니까??");
	  
	  	if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath() %>/MemberJoinActionController";
		   	formname.submit();  
	  	}
	  	return ;
	}
function check1() {
	location.href = "MemberLoginController"
}

</script>
</head>

<body>
<form name="frm">
<h2 align="center">회원가입</h2>

<center>
<div>
<input class="form-control" id="mid" name="mid" maxlength="20" style="width: 230px; height: 40px;" required="" type="text" placeholder="ID" data-error="" />




<input class="form-control" required="" placeholder="비밀번호" data-error="" type="password" name="mpwd" id="mpwd"style="width: 230px; height: 40px;" maxlength="20" />



<input class="form-control" required="" placeholder="비밀번호 확인" data-error="" type="password" name="mpwd2" id="mpwd2"style="width: 230px; height: 40px;" maxlength="20" />



<input class="form-control" name="mname" id="mname" required="" type="text" placeholder="이름" data-error="" style="width: 230px; height: 40px;" maxlength="20" />



<div class="col-md-3">
              <div class="row">
                <div class="col-sm-4">
                  <div class="form-group">
                   <input class="form-control" required="" placeholder="E-MAIL" data-error="" type="text" name ="mmail1"  style="width: 130px; height: 40px; vertical-align: bottom;" />
                    <div class="help-block with-errors"></div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <select class="form-control" name="mmail2" style="width: 130px; height: 40px; vertical-align: bottom;" >
					<option value="naver.com" selected>@naver.com</option>
					<option value="daum.net">@daum.net</option>
					<option value="nate.com" >@nate.com</option>
					<option value="google.com" >@gmail.com</option>
					</select>
                    <div class="help-block with-errors"></div>
                  </div>
                </div>

              </div>
          </div>




<input class="form-control" required="" type="text" placeholder="휴대폰" data-error="" name="mphone" id="mphone" style="width: 230px; height: 40px;" maxlength="20" />



<input class="form-control" required="" type="text" placeholder="우편번호" data-error="" name="mpost" id="mpost" style="width: 230px; height: 40px;" maxlength="6" />



<input class="form-control" required="" type="text" placeholder="주소1" data-error="" name="maddr1" id="maddr1" style="width: 230px; height: 40px;" maxlength="20" />


<input class="form-control" required="" type="text" placeholder="주소2" data-error="" name="maddr2" id="maddr2" style="width: 230px; height: 40px;" maxlength="20" />



<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check();">회원가입</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check1();">로그인</button>

</div>
</center>

</form>




</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>


