<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {	
	 	  
	  var formname = document.frm;
	  
	  if (formname.mname.value =="") {
		  alert("이름을 입력하세요.");
		  formname.mname.focus();	  
		  return ;	  
	  } else if (formname.mmail.value ==""){	
		  alert("E-Mail을 입력하세요.");
		  formname.mmail.focus();	  
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
		location.href = "MemberLoginController"
	}
	
	function check2() {
		location.href = "MemberJoinController"
	}
	
	function check3() {	
	 	  
		  var formname = document.frm;
		  
		  if (formname.mid.value =="") {
			  alert("아이디를 입력하세요.");
			  formname.mid.focus();	  
			  return ;	  
		  } else if (formname.mname.value ==""){	
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
			   	formname.action ="<%=request.getContextPath()%>	/MemberFindC";
				formname.submit();
			}
			return;
		}
	function check4() {
		location.href = "MemberLoginController"
	}
	
	function check5() {
		location.href = "MemberJoinController"
	}
</script>

</head>

<body>
	<form name="frm">
		<table border=1 align="center" width="30%" height="300px">
			<tr>
				<td>이름</td>
				<td colspan=3><input type="text" name="mname" id="mname" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td colspan=3><input type="text" name="mmail" id="mmail" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan=4 align="center">
				<input type="button" name="button" value="아이디 찾기" onclick="javascript:check();" />
				<input type="button" name="button" value="로그인" onclick="javascript:check1();" />
				<input type="button" name="button" value="회원가입" onclick="javascript:check2();" />
				</td>
			</tr>
		</table>
		
		<input type="text" value="${mf.mf}">
		
		<table border=1 align="center" width="30%" height="300px">
			<tr>
				<td>아이디</td>
				<td colspan=3><input type="text" name="mid" id="mid" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan=3><input type="text" name="mname" id="mname" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td colspan=3><input type="text" name="mmail" id="mmail" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan=4 align="center">
				<input type="button" name="button" value="비밀번호 찾기" onclick="javascript:check3();" />
				<input type="button" name="button" value="로그인" onclick="javascript:check4();" />
				<input type="button" name="button" value="회원가입" onclick="javascript:check5();" />
				</td>
			</tr>
		</table>
		<input type="text" value="${pf.pf}">
	</form>	
</body>
</html>