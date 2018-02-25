<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="kurt.qq.*,java.util.LinkedList"%>
    <%request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登录结果</title>
</head>
<body>
<%
//如果application中无在线人员属性，声明一个
LinkedList<User>  list;
if((list=(LinkedList)application.getAttribute("users_online"))==null){
	list=new LinkedList<User>();
	application.setAttribute("users_online",list );
}
	
String name=request.getParameter("name");
String password=request.getParameter("password");
//System.out.println(name);


if(MyTools.jdbcCheckLogin(name,password)==1){
response.sendRedirect("chatIndex.jsp");
User temp=new User();
//temp.setId(1);
temp.setName(name);
temp.setPassword(password);
/*
temp.setMobilenumber(request.getParameter("mobilenumber"));
temp.setAge(0);
temp.setSchool(request.getParameter("school"));
temp.setSchool(request.getParameter("email"));
temp.setSchool(request.getParameter("location"));
temp.setSchool(request.getParameter("homeland"));
temp.setSchool(request.getParameter("hobby"));
*/
list.add(temp);
session=request.getSession();
session.setAttribute("name", name);
session.setAttribute("password", password);
}
else if(MyTools.jdbcCheckLogin(name,password)==-1)
	out.println("用户名不存在<br/><a href='index.jsp'>重新登录</a>");
else 
	out.println("用户名与密码不匹配<br/><a href='index.jsp'>重新登录</a>");
	
%>
</body>
</html>