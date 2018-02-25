<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="by Kurt" errorPage="error.jsp"%>
<%request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎注册</title>
<style type="text/css">
table{
border:1px;
text-align:center;
}

</style>

</head>
<a href="login.jsp" color="blue">登录</a>

<body background="./images/registerBackground.jpg">
	<center>
		<h1>Welcome use MicroChat</h1>

		<br /> <br />

		<table  >
			<form action="dealRegister.jsp" method="post" accept-charset="gbk">
				<tr>
					<td >*用户名：</td>
					<td><input type='text' name='name'></input></td>
				</tr>
				<tr>
					<td>*密码：</td>
					<td><input type='password' name='password'></input></td>
				</tr>
				<tr>
					<td>*手机号：</td>
					<td><input type='text' name='mobilenumber'></input></td>
				</tr>
				<tr>
					<td>*年龄：</td>
					<td><input type='text' name='age'></input></td>
				</tr>
				<tr>
					<td>学校：</td>
					<td><input type='text' name='school'></input></td>
				</tr>
				<tr>
					<td>电子邮箱：</td>
					<td><input type='text' name='email'></input></td>
				</tr>
				<tr>
					<td>所在地：</td>
					<td><input type='text' name='location'></input></td>
				</tr>
				<tr>
					<td>家乡：</td>
					<td><input type='text' name='homeland'></input></td>
				</tr>
				<tr>
					<td>兴趣爱好：</td>
					<td><input type='text' name='hobby'></input></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit"></input>&nbsp&nbsp
					<input type="reset"></input></td>
				</tr>
				<tr>
					<td>说明：1)用户名暂不支持中文</td></tr>
					<tr><td>2)加*的为必填</td>
				</tr>
				<tr>
				</tr>



			</form>
		</table>
		
	</center>
</body>
</html>