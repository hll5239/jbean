<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form name="frm">
<table border=1 align="center" width="50%" height="600px">
<tr>
<td>ID</td>
<td colspan=3>
<input type="text" name="memberId" id="Mid" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>비밀번호</td>
<td colspan=3>
<input type="password" name="memberPassword" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>비밀번호 확인</td>
<td colspan=3>
<input type="password" name="memberPassword2" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>이름</td>
<td colspan=3>
<input type="text" name="memberName" id="Mname" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>E-Mail</td>
<td colspan=3>
<input type="text" name="memberEmail" id="Mmail" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>휴대폰</td>
<td colspan=3>
<input type="text" name="memberPhone" id="Mphone" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>주소</td>
<td colspan=3>
<input type="text" name="memberPost" id="Mpost" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>
<input type="text" name="memberaddr1" id="Maddr1" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td colspan=4 align="center">
<input type="button" name="button" value="회원가입" />
</td>
</tr>
</table>
</form>
</body>
</html>