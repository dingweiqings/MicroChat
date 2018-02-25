<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="kurt.qq.MyTools,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
String name="";
session=request.getSession();
name=(String)session.getAttribute("name");
System.out.println(name);
if(name==null&&name.equals("")){
	System.out.println(1);	
	response.sendRedirect("login.jsp");
}
Connection con=MyTools.getConnection();
if(con!=null){
	PreparedStatement ps=con.prepareStatement("select  password from qq.users where name=?");
	ps.setString(1,name);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		String namequery=rs.getString(1);
		if(!namequery.equals(name)){
			response.sendRedirect("login.jsp");
			break;
		
		}
	}
	String newPassword=request.getParameter("newPassword"); 
	String sql=String.format("set password='%s'",name);
	MyTools.jdbcUpdate(name,sql);
}

%>
</body>
</html>