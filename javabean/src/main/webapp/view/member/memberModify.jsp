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
<table border=1 align="center" width="50%" height="600px">
<tr>
<td>ID</td>
<td colspan=3>
<input type="text" name="mid" id="mid" disabled="disabled" size="20" maxlength="20" value = "${Mone.mid } "/>
<!-- readonly="readonly" -->
</td>
</tr>
<tr>
<td>비밀번호</td>
<td colspan=3>
<input type="password" name="mpwd" id="mpwd" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>비밀번호 확인</td>
<td colspan=3>
<input type="password" name="mpwd2" id="mpwd2" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>이름</td>
<td colspan=3>
<input type="text" name="mname" id="mname" disabled="disabled" size="20" maxlength="20" value= "${Mone.mname}" />
</td>
</tr>
<tr>
<td>Email</td>
<td colspan=3>
<input type="text" name ="mmail1"  id="mmail1" size="20" disabled="disabled" value = "${Mone.mmail}" />
<br>
<br>
<input type="text" name ="mmail1"  id="mmail1" size="20" maxlength="20" />
@
<select name="mmail2">
<option value="naver.com" selected>naver.com</option>
<option value="daum.net">daum.net</option>
<option value="nate.com" >nate.com</option>
<option value="google.com" >gmail.com</option>
</select>

</tr>
<tr>
<td>휴대폰</td>
<td colspan=3>
<input type="text" name="mphone" id="mphone" size="20" maxlength="20"  value = "${Mone.mphone}" />
</td>
</tr>
<tr>
<td>우편번호</td>
<td colspan=3>
<input type="text" name="mpost" id="mpost" size="10" maxlength="6" value = "${Mone.mpost}" />
</td>
</tr>
<tr>
<td>주소1</td>
<td>
<input type="text" name="maddr1" id="maddr1" size="20" maxlength="20" value = "${Mone.maddr1}" />
</td>
</tr>
<tr>
<td>주소2</td>
<td>
<input type="text" name="maddr2" id="maddr2" size="20" maxlength="20" value = "${Mone.maddr2}" />
</td>
</tr>
<tr>
<td colspan=4 align="center">
<input type="button" name="button" value="수정완료" onclick="javascript:check();"/>
<input type="button" name="button" value="취소" onclick="javascript:check1();"/>
<input type="button" name="button" value="회원탈퇴" onclick="javascript:check2();"/>
</td>
</tr>
</table>

</form>
</body>
</html>

<%@ include file = "/WEB-INF/views/include/footer.jsp"%>