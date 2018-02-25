<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="by Kurt" errorPage="error.jsp"
	import="kurt.qq.User" import="kurt.qq.MyTools,java.sql.*"%>

<html>
<head>
<title>register</title>
</head>
<body>

	<%
		/*  String name=request.getParameter("name");
		 out.println(name);
		 String password=request.getParameter("password");
		 out.println(password);  */
	%>
	<!-- 写入数据库 -->
	<jsp:useBean id="userBean" class="kurt.qq.User" scope="request">
		<!-- 声明bean实例 -->
		<jsp:setProperty name="userBean" property="*" />
	</jsp:useBean>
<%request.setCharacterEncoding("UTF-8");%>
	<%
	String sql="";
		String name = userBean.getName();
		String password = userBean.getPassword();
		String mobilenumber = userBean.getMobilenumber();
		int age = userBean.getAge();
		String  school=userBean.getSchool();
		String email=userBean.getEmail();
		/* 	out.println(userBean.getId());
		 out.println(userBean.getMobilenumber());
		 if(mobilenumber.length()>=1)
		 out.println("success");
		 else
		 out.println("fail"); */

		if (name.length() >= 1 && password.length() >= 1&& mobilenumber.length() >= 1 && age >= 1) {//用户名、密码、手机号、年龄均不能为空
			if (!MyTools.jdbcCheck(name)) {//不存在重复用户名
				int id = MyTools.jdbcId();
				int k = MyTools.jdbcInsert(id, userBean.getName(),
						userBean.getPassword(), userBean.getMobilenumber(),
						userBean.getAge(), userBean.getSchool(),
						userBean.getEmail(), userBean.getLocation(),
						userBean.getHomeland(), userBean.getHobby());
				Connection con=MyTools.getConnection();
				if(con!=null){
					PreparedStatement ps=con.prepareStatement(sql);
					
				}
				
				if (k == 1) {
					out.println("注册成功");
		response.sendRedirect("show.jsp?id=" + id + "&name="+ name + "&mobilenumber=" + mobilenumber+ "&age=" + Integer.toString(age) + "&school="+ userBean.getSchool() + "&email="+ userBean.getEmail() + "&location="+ userBean.getLocation() + "&homeland="+ userBean.getHomeland() + "&hobby="+ userBean.getHobby());
				}
				else 
					out.println("<center>未成功注册，请重新注册 <br/><a href='register.jsp'>重新注册</a></center>");
			} else
				out.println("<center>用户名已存在  <br/><a href='register.jsp'>重新注册</a></center>");

		}

		else {
			out.println("<center>加*号的未填满，请重新注册<br/><br/><a href='register.jsp'>重新注册</a></center>");
			

		}
	%>

</body>
</html>