<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check() {	
	 	  
	  var formname = document.frm;
	  
	  if (formname.mid.value =="") {
		  alert("아이디를 입력하세요.");
		  formname.mid.focus();	  
		  return ;	  
	  } else if (formname.mpwd.value ==""){	
		  alert("비밀번호를 입력하세요.");
		  formname.mpwd.focus();	  
		  return ;
	  }
	  var res;
	  	res = confirm("로그인 하시겠습니까?");
	  
	  	if (res == true) {
		   	formname.method ="post";
		   	formname.action ="<%=request.getContextPath()%>	/MemberLoginActionController";
			formname.submit();
		}
		return;
	}

	function check1() {
		location.href = "MemberJoinController"
	}
	
	function check2() {
		location.href = ""
	}
</script>
</head>
<body>
	<form name="frm">
		<table border=1 align="center" width="30%" height="300px">
			<tr>
				<td>ID</td>
				<td colspan=3><input type="text" name="mid" id="mid" size="20"
					maxlength="20" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan=3><input type="password" name="mpwd" id="mpwd"
					size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td colspan=4 align="center">
				<input type="button" name="button" value="로그인" onclick="javascript:check();" />
				<input type="button" name="button" value="회원가입" onclick="javascript:check1();" />
				<input type="button" name="button" value="아이디/비밀번호 찾기" onclick="javascript:check2();" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>