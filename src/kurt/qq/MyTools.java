package kurt.qq;
import java.sql.*; 
import java.io.UnsupportedEncodingException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MyTools {
	String dbName="qq";
	String ip="localhost";
	static String dbUserName="root";
	static String dbPassword="root";
	Connection con=null;
	static String driverClass="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/qq";
	
	public static Connection getConnection(){
		Connection connection=null;
		try{
			Context ctx = new InitialContext();
					DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/qq");
				connection = ds.getConnection();
			} catch (Exception e) {
			e.printStackTrace();
			} 
		
		return connection;
	}
public static String toChinese(String str){
	if(str==null)str="";
	try{
		str=new String(str.getBytes("UTF-8"),"UTF-8");
	}
	catch(UnsupportedEncodingException e)
	{ 
		str="";
		e.printStackTrace();
	}
	
	return str;
	
	
}

public static int jdbcId(){//数据库操作，插入，更新，查询
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/qq";
	String username="root";
	String password="root";
	int num=0;
	String query="select count(*) from qq.users";
	try{
	Class.forName(driverClass);
	Connection con=DriverManager.getConnection(url,username,password);
	Statement state=con.createStatement();
      	ResultSet rs=state.executeQuery(query);
//System.out.println(rs.getRow());
 while(rs.next())
num=Integer.parseInt(rs.getString(1));
	rs.close();
	state.close();
	con.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return num+1;
}
public static int  jdbcCheckLogin(String name,String password){//数据库操插入
System.out.println(name);
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/qq?useUnicode=true&characterEncoding=utf-8";
	String sname="root";
	String spassword="root";
	int  flag=0;
	try{
	Class.forName(driverClass);
	Connection con=DriverManager.getConnection(url,sname,spassword);
	PreparedStatement pStmt=null;
	ResultSet rtn=null;
	//检查name是否在数据库中
	pStmt=con.prepareStatement("select count(*) from qq.users  where name=?");
	pStmt.setString(1, name);
	//System.out.println(name);
	rtn=pStmt.executeQuery();
	//System.out.println("b");
	while(rtn.next()){ 
	int count=Integer.parseInt(rtn.getString(1));
	//System.out.println(rtn.getString(1));
	//System.out.println(count);
	if(count==0)
		flag=-1;
	break;
	}
	
	
//统计为0
	
	if(flag!=-1){
	pStmt=con.prepareStatement
("select password from qq.users where name=?");
	pStmt.setString(1, name);
	rtn=pStmt.executeQuery();
while(rtn.next()){
  	if(rtn.getString(1).equals(password))
		flag=1;//通过
	else
			flag=0;//不匹配
  	break;
	}

	}
	rtn.close();
	pStmt.close();
	con.close();
	 
  	}
	
	catch(Exception e){
		e.printStackTrace();
	}
	return flag;
}
public static boolean jdbcCheck(String name){//数据库操插入
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/qq";
	String sname="root";
	String spassword="root";
	boolean flag=false;
	try{
	Class.forName(driverClass);
	Connection con=DriverManager.getConnection(url,sname,spassword);
	PreparedStatement pStmt=con.prepareStatement
("select name from qq.users");
	ResultSet rtn=pStmt.executeQuery();
	while (rtn.next()) {
  	if(rtn.getString(1).trim().equals(name)){
		flag = true;
		break;
		}
	}
	rtn.close();
	pStmt.close();
	con.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return flag;
}

public static int jdbcInsert(int id,String name,String password ,String mobilenumber,int age,String school,String email,
		String location,String homeland,String hobby){//数据库操插入
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/qq?useUnicode=true&characterEncoding=utf-8";
	String sname="root";
	String spassword="root";
	int rtn=0;
	try{
	Class.forName(driverClass);
	Connection con=DriverManager.getConnection(url,sname,spassword);
	PreparedStatement pStmt=con.prepareStatement
("insert into qq.users(id,name,password,mobilenumber,age,school,email,location,homeland,hobby) values(?,?,?,?,?,?,?,?,?,?)");
	pStmt.setLong(1,id);
pStmt.setString(2,name);
pStmt.setString(3, password);
pStmt.setString(4,mobilenumber);
pStmt.setLong(5, age);
pStmt.setString(6, school);
pStmt.setString(7, email);
pStmt.setString(8, location);
pStmt.setString(9, homeland);
pStmt.setString(10, hobby);
rtn=pStmt.executeUpdate();//更新成功返回插入的记录条数
	pStmt.close();
	con.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return rtn;
}
public static int jdbcDelete(String name){//数据库删除,成功返回影响的行数
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/qq";
	String sname="root";
	String spassword="root";
	int rtn=0;
	try{
	Class.forName(driverClass);
	Connection con=DriverManager.getConnection(url,sname,spassword);
	PreparedStatement pStmt=con.prepareStatement("delete from users where name=?");
pStmt.setString(1,name);
rtn=pStmt.executeUpdate();
if(rtn>=1){
PreparedStatement pStmta=con.prepareStatement("update qq.users set id=id-?");
pStmta.setLong(1, rtn);
pStmta.executeUpdate();
pStmta.close();
	}
	pStmt.close();
	
	con.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return rtn;
}

public static int jdbcUpdate(String password,String name){//数据库操修改
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/qq";
	String sname="root";
	String spassword="root";
	int rtn=0;
	try{
	Class.forName(driverClass);
	Connection con=DriverManager.getConnection(url,sname,spassword);
	PreparedStatement pStmt=con.prepareStatement
("update qq.users set password=? where name=?");
	pStmt.setString(1,password);
	pStmt.setString(2,name);
rtn=pStmt.executeUpdate();//更新成功返回1
	pStmt.close();
	con.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return rtn;
}

}