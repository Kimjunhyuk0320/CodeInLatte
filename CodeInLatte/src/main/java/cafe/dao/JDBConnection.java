package cafe.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnection {

	public Connection con;					// 연결된 드라이버에 SQL을 요청할 객체를 생성하는 클래스
	public Statement stmt;					// SQL 실행 요청을 하는 클래스
	public PreparedStatement psmt;			// Statement 에어서 ? 파라미터 확장기능을 추가로 제공하는 클래스
	public ResultSet rs;					// SQL 실행 결과를 받아오는 클래스
	
	// 기본 생성자
	public JDBConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://127.0.0.1:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
			String id = "joeun";
			String pw = "12345678";
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		JDBConnection jdbc = new JDBConnection();
	}
}
