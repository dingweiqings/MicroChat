<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="by Kurt" errorPage="error.jsp"%>
     <%@ page import="kurt.qq.User" %>
     <%request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<title>请更改您的信息</title>
</head>
<body>
<script type="text/javascript">
function check(){
	var sourcePassword=document.form.sourcePassword.value;
	var newPassword=document.form.newPassword.value;
	var confirmPassword=document.form.confirmPassword.value;
if(sourcePassword.length==0||newPassword.length==0||confirmPassword.length==0){
		window.alert("请填写完整");
		return false;
		}
else{
	if(newPassword!=confirmPassword){
		window.alert("两次密码请填写一致")
	return false;
	}
	else
		return true;

}

	}
</script>
<center>
<br/><br/><br/><br/><br/>
<table>
<form  action="dealUpdate.jsp" name="form" onsubmit="return check()" method="post">
<tr><td>原密码：</td><td><input type='password' name='sourcePassword'></input></td><tr>
<tr><td>新密码：</td><td><input type='password' name='newPassword'></input></td><tr>
<tr><td>确认密码：</td><td><input type='password' name='confirmPassword'></input></td><tr>
<tr><td></td><td><input type="submit" value="提交"><input type="reset" value="重置"></td></tr>
</form>
</table>
</center>
</body>
</html>