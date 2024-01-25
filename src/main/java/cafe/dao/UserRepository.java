package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import cafe.dto.PersistentLogin;
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
	 * 사용자 정보 조회
	 * @param userNo
	 * @return
	 */
	public User getUserById(String userId) {
		User user = new User();
		
		String sql = " SELECT * FROM user WHERE user_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
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
			System.err.println("사용자 조회시, 에러 발생");
			e.printStackTrace();
		}
		
		return user;
	}
	
	/**
	 * 사용자 정보 조회
	 * @param userTely
	 * @return
	 */
	public User getUserByTel(String userTel) {
		User user = new User();
		
		String sql = " SELECT * FROM user WHERE user_tel = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userTel);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
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
			System.err.println("사용자 조회시, 에러 발생");
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
			psmt.setString(no++, user.getUserId());
			
			
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
	
	/**
	 * 회원 삭제
	 * @param id
	 * @return
	 **/
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
	
	/**
	 * 스탬프 추가
	 * @param userNo
	 * @param stamp
	 * @return
	 */
	public int stampUp(String userNo, int stamp) {
		int result = 0;
		String sql = " UPDATE user SET "
				+ " user_stamp = ? "
				+ " WHERE user_no = ? ";
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, stamp);
			psmt.setString(no++, userNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("스탬프 추가 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("회원정보 " + result + "명의 스탬프가 추가되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 발행됨에 따라 스탬프 개수 초기화 DB 저장
	 * @param userNo
	 * @param stamp
	 * @return
	 */
	public int clearStamp(int userNo, int stampCount) {
		int result = 0;

		String sql = " UPDATE user "
				+ " SET user_stamp = ? "
				+ " WHERE user_id = ? ";
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, stampCount);
			psmt.setInt(no++, userNo);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("스탬프 추가 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("회원정보 " + result + "명의 스탬프 수가 변경되었습니다.");
		return result;
	}
	
	/**
	 * 사용자 정보 조회(coupon)
	 * @return
	 */
	public List<User> userlist(String userId) {
		
		ArrayList<User> userList = new ArrayList<User>();
		
		String sql = " SELECT * FROM user WHERE user_id = ? ";
		
		try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, userId);
				rs = psmt.executeQuery();
			
			while( rs.next() ) {
				User user = new User();
				
				user.setUserNo(rs.getInt("user_no"));
				user.setUserId(rs.getString("user_id"));
				user.setUserPW(rs.getString("user_pw"));
				user.setUserName(rs.getString("user_name"));
				user.setUserBirth(rs.getString("user_birth"));
				user.setUserAddress(rs.getString("user_address"));
				user.setUserTel(rs.getString("user_tel"));
				user.setUserRegdate(rs.getString("user_regdate"));
				user.setUserStamp(rs.getInt("user_stamp"));
				
				userList.add(user);
			}
			
		} catch (SQLException e) {
			System.err.println("상품 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return userList; 
	}

	/**
	 * userNo로 사용자 쿠폰 개수 ㅈ조회
	 * @param id
	 * @param pw
	 * @return
	 */
	public User couponCnt(String userNo) {
		
		String sql = " SELECT * "
				   + " FROM user "
				   + " WHERE user_no = ? ";
		
		User user = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userNo);
			
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
	 * 토큰 리프레쉬
	 * 
	 * @param userId
	 */
	public String refreshToken(String userId) {
		PersistentLogin persistentLogin = selectToken(userId);
		String token = null;
		if (persistentLogin == null) {
			// 토큰이 없는 경우, 삽입
			token = insertToken(userId);
		} else {
			// 토큰이 있는 경우, 갱신
			token = updateToken(userId);
		}
		return token;
	}

	/**
	 * 토큰 정보 조회
	 * 
	 * @param userId
	 * @return
	 */
	public PersistentLogin selectToken(String userId) {
		String sql = "SELECT * FROM persistent_logins WHERE user_id = ?";

		PersistentLogin persistentLogin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogin = new PersistentLogin();
				persistentLogin.setpNo(rs.getInt("p_no"));
				persistentLogin.setUserId(rs.getString("user_id"));
				persistentLogin.setToken(rs.getString("token"));
				persistentLogin.setDate(rs.getTimestamp("token"));
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogin;
	}

	/**
	 * 토큰 정보 조회 - 토큰으로
	 * 
	 * @param token
	 * @return
	 */
	public PersistentLogin selectTokenByToken(String token) {
		String sql = "SELECT * FROM persistent_logins WHERE token = ?";

		PersistentLogin persistentLogin = null;  
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);

			rs = psmt.executeQuery();
			if (rs.next()) {
				persistentLogin = new PersistentLogin();
				persistentLogin.setpNo(rs.getInt("p_no"));
				persistentLogin.setUserId(rs.getString("user_id"));
				persistentLogin.setToken(rs.getString("token"));
				persistentLogin.setDate(rs.getTimestamp("date")); // date 필드로 변경
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogin;
	}

	/**
	 * 자동 로그인 토큰 생성
	 * 
	 * @param userId
	 * @return
	 */
	public String insertToken(String userId) {
		int result = 0;
		String sql = "INSERT INTO persistent_logins (user_id, token) VALUES (?, ?)";
		String token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, token);

			result = psmt.executeUpdate(); // 퍼시스턴트 로그인 정보 등록 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개가 등록되었습니다.");
		return token;
	}

	/**
	 * 자동 로그인 토큰 갱신
	 * 
	 * @param userId
	 * @return
	 */
	public String updateToken(String userId) {
		int result = 0;
		String sql = "UPDATE persistent_logins SET token = ?, date = now() WHERE user_id = ?";
		String token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, userId);

			result = psmt.executeUpdate(); // 퍼시스턴트 로그인 정보 수정 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개의 데이터가 수정되었습니다.");
		return token;
	}

	/**
	 * 토큰 삭제 - 로그아웃 시, 자동 로그인 풀림
	 * 
	 * @param userId
	 * @return
	 */
	public int deleteToken(String userId) {
		int result = 0;
		String sql = "DELETE FROM persistent_logins WHERE user_id = ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);

			result = psmt.executeUpdate(); // 특정 사용자의 자동 로그인 정보 삭제 요청
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개의 데이터가 삭제되었습니다.");
		return result;
	}

	
}