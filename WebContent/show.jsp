<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="by Kurt" errorPage=""%>
     <%@ page import="kurt.qq.*,java.sql.*,java.lang.*" %>
   <%request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看注册结果</title>
</head>
<body>
	<center>
	<h1>已注册成功</h1>
	<h2>请牢记密码</h2>
		<table>
<%
String idRequest=request.getParameter("id");
int id=0;
//out.println(idRequest); 
String name = "";
//System.out.println(userBean.getName());
//String namea = request.getParameter("name");
//System.out.println(namea);
String password ="";
String mobilenumber = "";
int age = 0;
String school = "";
String email = "";
String location = "";
String homeland = "";
String hobby = "";

if(idRequest!=null&&!idRequest.equals("")){
 id=Integer.parseInt(idRequest);
String sql="select * from qq.users where id=?";
Connection con=MyTools.getConnection();
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	name=rs.getString(2);
	password=rs.getString(3);
	mobilenumber=rs.getString(4);
	age=Integer.parseInt(rs.getString(5));
	school=rs.getString(6);
	email=rs.getString(7);
	location=rs.getString(8);
	homeland=rs.getString(9);
	hobby=rs.getString(10);
} 
}
else
	response.sendRedirect("register.jsp");
%>
<%/* ;
String name="";
String password=""; */%>
		  <%request.setCharacterEncoding("utf-8"); %>
		  
<tr><td >第&nbsp&nbsp&nbsp<%out.println(id);  %></script>&nbsp&nbsp&nbsp位</td></tr>
<tr><td>用户名：<%out.println(name);%></td></tr>
<tr><td>手机号：<%out.println(mobilenumber);%></td></tr>
<tr><td>年龄：<%out.println(age);%></td></tr>
<tr><td>学校：<%out.println(school);%></td></tr>
<tr><td>电子邮箱：<%out.println(email);%></td></tr>
<tr><td>所在地：<%out.println(location);%></td></tr>
<tr><td>家乡：<%out.println(homeland);%></td></tr>
<tr><td>兴趣爱好：<%out.println(hobby);%></td></tr>
<tr><td><a href="index.jsp" ><font color="red">马上登录</font></a></td></tr>
</table>

	</center>
</body>
</html>