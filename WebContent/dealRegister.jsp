<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="by Kurt" errorPage=""
	import="kurt.qq.User" import="kurt.qq.MyTools,java.sql.*"%>
<%
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
%>

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

	<%
		int id = MyTools.jdbcId();
		String name = userBean.getName();
		System.out.println(userBean.getName());
		String namea = request.getParameter("name");
		System.out.println(namea);
		String password = userBean.getPassword();
		String mobilenumber = userBean.getMobilenumber();
		int age = userBean.getAge();
		String school = userBean.getSchool();
		String email = userBean.getEmail();
		String location = userBean.getLocation();
		String homeland = userBean.getHomeland();
		String hobby = userBean.getHobby();
		String sql = "insert into qq.users(id,name,password,mobilenumber,age,school,email,location,homeland,hobby) values(?,?,?,?,?,?,?,?,?,?)";

		if (name.length() >= 1 && password.length() >= 1
				&& mobilenumber.length() >= 1 && age >= 1) {//用户名、密码、手机号、年龄均不能为空
			if (!MyTools.jdbcCheck(name)) {//不存在重复用户名

				int flag = 0;
				String driverClass = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/qq?useUnicode=true&characterEncoding=utf-8";
				String sname = "root";
				String spassword = "root";
				Connection con = null;
				try {
					Class.forName(driverClass);
					con = DriverManager
							.getConnection(url, sname, spassword);
				} catch (Exception e) {
					e.printStackTrace();
				}

				if (con != null) {
					PreparedStatement pStmt = con.prepareStatement(sql);
					pStmt.setLong(1, id);
					pStmt.setString(2, name);
					//System.out.println(name);
					pStmt.setString(3, password);
					pStmt.setString(4, mobilenumber);
					pStmt.setLong(5, age);
					pStmt.setString(6, school);
					pStmt.setString(7, email);
					pStmt.setString(8, location);
					pStmt.setString(9, homeland);
					pStmt.setString(10, hobby);
					flag = pStmt.executeUpdate();
					//System.out.println(flag);
					pStmt.close();
					con.close();
				}

				if (flag >= 1) {
					out.println("注册成功");
					response.sendRedirect("show.jsp?id=" + id );
					//response.sendRedirect("show.jsp?id="+id);

					//System.out.println(name);
				} else
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
</html>