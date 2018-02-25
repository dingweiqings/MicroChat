<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="by Kurt" errorPage="error.jsp"%>
     <%@ page import="kurt.qq.User,kurt.qq.MyTools" %>
<%request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=UTF-8");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>微聊你的世界</title>
<style type="text/css" >
body{
 background-image:url(./images/indexBackground.jpg);
 <!--./aaa（也就是当前jsp页面所属目录）下面的 aaa 目录。当然这个 aaa 后面的 / 可以省略
../表示从根目录下索引，
-->
 background-repeat:repeat;
 background-repeat:no-repeat;
 background-size:100%
 }
</style>
</head>
<body  onload=document.forma.name.focus()>
<br/><br/><br/><br/>

<script type="text/javascript">
function check(){
	var name=document.forma.name.value;
	var password=document.forma.password.value;

if(name.length==0||password.length==0){
		window.alert("请输入用户名或者密码");
		return false;
		}
else{
	return true;

}

	}
</script>
<center>
<h1>欢迎登录</h1><br/>

<table >
<tr><td>
<table >
<%request.setCharacterEncoding("utf-8"); %>
<form action="deal_login.jsp" name="forma" onsubmit=" return check();" method="post">
<tr><td>用户名：</td><td><input type="text" name="name" id="nameid"></td></tr>
<tr><td>密码：</td><td><input type="password" name="password" id="passwordid" ></td></tr>
<tr><td></td><td><input type="submit" name="submit" value="提交" >
<input type="reset" name="reset" value="重置" >
<a href="register.jsp">注册</a>
</td></tr>
</form>
</table>
</td></tr>
</table>
</center>
 
</body>
</html>