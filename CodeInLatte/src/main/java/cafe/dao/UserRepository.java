package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String sql = " INSERT INTO user (user_no, user_id, user_pw, user_name, user_birth, user_address, user_tel, user_regdate, user_stamp) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, user.getUserNo());
			psmt.setString(no++, user.getUserId());
			psmt.setString(no++, user.getUserPW());
			psmt.setString(no++, user.getUserName());
			psmt.setString(no++, user.getUserBirth());
			psmt.setString(no++, user.getUserAddress());
			psmt.setString(no++, user.getUserTel());
			psmt.setString(no++, user.getUserRegdate());
			psmt.setInt(no++, user.getUserStamp());
			
			result = psmt.executeUpdate();			
			
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
				   + "   AND user_pw = ? ";
		
		User user = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) {
				user = new User();
				user.setUserNo( rs.getInt("user_no") );
				user.setUserId(rs.getString("user_id"));
				user.setUserPW(rs.getString("user_pw"));
				user.setUserName(rs.getString("user_name"));
				user.setUserBirth(rs.getString("user_birth"));
				user.setUserAddress(rs.getString("user_address"));
				user.setUserTel(rs.getString("user_tel"));
				user.setUserRegdate(rs.getString("user_regdate"));
				user.setUserStamp(rs.getInt("user_stamp"));
			}
			
		} catch (SQLException e) {
			System.err.println("사용자 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 수정 위한 사용자 조회
	 * @param id
	 * @return
	 */
	public User getUserById(String id) {
		
		String sql = " SELECT * "
				   + " FROM user "
				   + " WHERE id = ? ";
		
		User user = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) {
				user = new User();
				user.setUserNo( rs.getInt("user_no"));
				user.setUserId( rs.getString("user_id"));
				user.setUserPW( rs.getString("user_pw"));
				user.setUserName( rs.getString("user_name"));
				user.setUserBirth( rs.getString("user_birth"));
				user.setUserAddress( rs.getString("user_address"));
				user.setUserTel( rs.getString("user_tel"));
				user.setUserRegdate( rs.getString("user_regdate"));
				user.setUserStamp( rs.getInt("user_stamp"));
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
				+ " user_pw= ? , user_name= ? , user_birth= ? , user_Tel= ? , user_address= ? "
				+ " WHERE user_id = ? ";
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, user.getUserPW());
			psmt.setString(no++, user.getUserName());
			psmt.setString(no++, user.getUserBirth());
			psmt.setString(no++, user.getUserTel());
			psmt.setString(no++, user.getUserAddress());
//			psmt.setString(no++, user.getUserUpdate());
//			psmt.setInt(no++, user.getUserStamp());
			
			result = psmt.executeUpdate();
			
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
	public int delete(String userId) {
		int result = 0;
		
		String sql = " DELETE FROM user"
				   + " WHERE user_id = ? ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, userId);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("삭제완료");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<User> cartUserSelect(String userNo) {
		ArrayList<User> cartuser = new ArrayList<User>();
		
		String sql = " SELECT * FROM user "
				   + " WHERE user_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				
				user.setUserNo(rs.getInt("user_no"));
				user.setUserName(rs.getString("user_name"));
				user.setUserTel(rs.getString("user_tel"));
				user.setUserStamp(rs.getInt("user_stamp"));
				
				cartuser.add(user);
				
			}
		} catch (SQLException e) {
			System.err.println("유저 카트 조회 중, 에러 발생");
			e.printStackTrace();
		}
		
		return cartuser;
	}

}
















