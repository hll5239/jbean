<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
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
		location.href = "MemberFindController"
	}
</script>
</head>
<body>
	<form name="frm">
		<h2 align="center">회원 로그인</h2>
		<br>
		<center>
			<div>


				<input class="form-control" id="mid" name="mid" maxlength="20"
					style="width: 420px; height: 40px;" required="" type="text"
					placeholder="ID" data-error="" />
				<tr>
					<input class="form-control" required="" placeholder="비밀번호"
						data-error="" type="password" name="mpwd" id="mpwd"
						style="width: 420px; height: 40px;" maxlength="20" />
				</tr>


<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check();">로그인</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check1();">회원가입</button>
<button class="btn std-btn btn-filled" type="button" name="button" onclick="javascript:check2();">아이디/비밀번호 찾기</button>



			</div>
		</center>
	</form>
</body>
</html>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>