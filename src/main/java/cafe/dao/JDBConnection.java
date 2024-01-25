package cafe.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnection {
	public Connection con;				
	public Statement stmt;				
	public PreparedStatement psmt;		
	public ResultSet rs;				
	
	public JDBConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	 
			
//			String url = "jdbc:mysql://localhost:3306/Project?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String url = "jdbc:mysql://localhost:3306/project?user=root";
			String id = "root";
			String pw = "123456";
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.err.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
}

