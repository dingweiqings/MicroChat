

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCDemo {
	static String url="jdbc:mysql://localhost:3306/first/test";
	public static void dispAll() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "root");
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select * from users");
			while (rs.next()) {
				System.out.println(rs.getString(1) + " " + rs.getString(2)
						+ " " + rs.getString(3) + " " + rs.getString(4));

			}
			rs.close();
			stmt.close();
			connection.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

		dispAll();
		System.out.println(checkUser("swk", "developer"));
		System.out.println(checkUser("tangseng", "CEO"));
		register(1005, "tangseng", "CEO", 300000);
		System.out.println(checkUser("tangseng", "CEO"));
	}

	private static boolean register(int id, String name, String title, double salary) {
		boolean flag = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					url, "root", "root");
			Statement stmt = connection.createStatement();
			// String
			// sql="select * from users where name='"+name+"' and title='"+title+"'";
			String sql = String.format(
					"insert into users values(%d,'%s','%s',%f)", id,name,title,salary);
			// System.out.println(sql);
			int rs = stmt.executeUpdate(sql);

			flag=true;
			
			stmt.close();
			connection.close();

		} catch (Exception e) {
		
		}
		return flag;

	}

	private static boolean checkUser(String name, String title) {

		boolean flag = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
					url, "root", "root");
			Statement stmt = connection.createStatement();
			// String
			// sql="select * from users where name='"+name+"' and title='"+title+"'";
			String sql = String.format(
					"select * from users where name='%s' and title='%s'", name,
					title);
			// System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				flag = true;
				break;
			}
			rs.close();
			stmt.close();
			connection.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
