package cafe.dao;

import java.sql.SQLException;

import cafe.dto.Product;
import cafe.dto.User;

public class UserRepository extends JDBConnection {
	
	/**
	 * 회원 등록
	 * @param user
	 * @return
	 */
	public int insert(User user) { 
		int result = 0;
		String sql = " INSERT INTO user (user_id, user_password, user_name, user_birth,  user_tel, user_address, user_regdate,) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, user.getId());
			psmt.setString(no++, user.getPassword());
			psmt.setString(no++, user.getName());
			psmt.setString(no++, user.getBirth());
			psmt.setString(no++, user.getTel());
			psmt.setString(no++, user.getAddress());
			psmt.setString(no++, user.getRegdate());
			
			result = psmt.executeUpdate();			// 회원 등록 요청
			
		} catch (SQLException e) {
			System.err.println("회원 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("회원 데이터 " + result + "개가 등록되었습니다.");
		return result;
	}
	
	
	/**
	 * 로그인을 위한 사용자 조회
	 * @param id
	 * @param pw
	 * @return
	 */
	public User login(String id, String pw) {
		
		String sql = " SELECT * "
				   + " FROM user "
				   + " WHERE user_id = ? "
				   + "   AND user_password = ? ";
		
		User user = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) {
				user = new User();
				user.setNo( rs.getString("user_no") );
				user.setId( rs.getString("user_id") );
				user.setPassword( rs.getString("user_password") );
				user.setName( rs.getString("user_name") );
				user.setBirth( rs.getString("user_birth") );
				user.setTel( rs.getString("user_Tel") );
				user.setAddress( rs.getString("user_address") );
				user.setRegdate( rs.getString("user_regdate"));
				user.setStamp( rs.getString("user_stamp"));
			}
			
		} catch (SQLException e) {
			System.err.println("사용자 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return user;
	}
	
	
	/**
	 * 회원 수정
	 * @param user
	 * @return
	 */
	public int update(User user) {
		int result = 0;
						
		String sql = " UPDATE user SET "
				+ " user_password= ? , user_name= ? , user_birth= ? , user_Tel= ? , user_address= ? "
				+ " WHERE user_id = ? ";
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, user.getPassword());
			psmt.setString(no++, user.getName());
			psmt.setString(no++, user.getBirth());
			psmt.setString(no++, user.getTel());
			psmt.setString(no++, user.getAddress());
			psmt.setString(no++, user.getId());
			result = psmt.executeUpdate();			// 회원 수정 요청
			
		} catch (SQLException e) {
			System.err.println("회원정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("회원정보 " + result + "명의 데이터가 수정되었습니다.");
		return result;
		

	}


	/**
	 * 회원 삭제
	 * @param id
	 * @return
	 */
	public int delete(String id) {
		int result = 0;
		
		String sql = " DELETE FROM user"
				   + " WHERE user_id = ? ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, id);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("삭제완료");
			e.printStackTrace();
		}
		
		return result;
	}

}

















