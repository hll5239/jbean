<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function check() {   
         
     var formname = document.frm;
     
    if (formname.mpwd.value ==""){   
        alert("비밀번호를 입력하세요.");
        formname.mpwd1.focus();     
        return ;
     }else if (formname.mpwd2.value ==""){   
        alert("비밀번호를 다시 입력하세요.");
        formname.mpwd2.focus();     
        return ;
     }else if (formname.mmail1.value ==""){   
        alert("E-Mail을 입력하세요.");
        formname.mmail1.focus();     
        return ;
     }
     var res;
        res = confirm("수정 하시겠습니까??");
     
        if (res == true) {
            formname.method ="post";
            formname.action ="<%=request.getContextPath() %>/MemberModifyActionController?midx=${Mone.midx}";
            formname.submit();  
        }
        
        return ;
   }
function check1() {
   location.href = "/"
   }
function check2(){
	location.href = "<%=request.getContextPath() %>/MemberDeleteController?midx=${Mone.midx}";
}
</script>

</head>

<body>
<form name="frm">
<h2 align="center">회원정보수정</h2>
<br>

<center>
<div>
<input class="form-control" id="mid" name="mid" maxlength="20" style="width: 450px; height: 30px;" required="" type="text" placeholder="ID" data-error="" disabled value = "${Mone.mid }" />

<input class="form-control" required="" placeholder="비밀번호" data-error="" type="password" name="mpwd" id="mpwd"style="width: 450px; height: 30px;" maxlength="20" />

<input class="form-control" required="" placeholder="비밀번호 확인" data-error="" type="password" name="mpwd2" id="mpwd2"style="width: 450px; height: 30px;" maxlength="20" />

<input class="form-control" name="mname" id="mname" required="" type="text" placeholder="이름" data-error="" style="width: 450px; height: 30px;" maxlength="20" disabled value = "${Mone.mname}"/>
</div>
<br>
<br>
<br>


<div style="position: absolute; left: 346px; top: 370px;" >
<input class="form-control" required="" placeholder="E-MAIL" data-error="" type="text" name ="mmail1"
  style="width: 270px; height: 30px;" value = "${Mone.mmail}"/>
</div>


<div style="position: absolute; right: 344px; top: 370px;" > 
<select class="form-control" name="mmail2" style="width: 170px; height: 30px;" />
<option value="naver.com" selected>@naver.com</option>
<option value="daum.net">@daum.net</option>
<option value="nate.com" >@nate.com</option>
<option value="google.com" >@gmail.com</option>
</select>
</div>

<div>
<input class="form-control" required="" type="text" placeholder="휴대폰" data-error="" name="mphone" id="mphone" style="width: 450px; height: 30px;" maxlength="20" value = "${Mone.mphone}"/>

<input class="form-control" required="" type="text" placeholder="우편번호" data-error="" name="mpost" id="mpost" style="width: 450px; height: 30px;" maxlength="6" value = "${Mone.mpost}"/>

<input class="form-control" required="" type="text" placeholder="주소1" data-error="" name="maddr1" id="maddr1" style="width: 450px; height: 30px;" maxlength="20" value = "${Mone.maddr1}"/>

<input class="form-control" required="" type="text" placeholder="주소2" data-error="" name="maddr2" id="maddr2" style="width: 450px; height: 30px;" maxlength="20" value = "${Mone.maddr2}"/>

<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check();">회원가입</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check1();">로그인</button>

</div>
</center>



</form>
</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>