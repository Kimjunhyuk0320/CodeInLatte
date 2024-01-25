package cafe.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import cafe.dto.Coupon;

public class CouponRepository extends JDBConnection{


	   /**
	    * default 쿠폰 발행(등록)
	    * @param coupon
	    * @return
	    */
	   public int FreeCoupon(int userNo, String root) {
	      int result = 0;
	      
	      String sql = " INSERT INTO coupon (user_no, coupon_name, coupon_date, coupon_duedate, coupon_img, coupon_check) "
	               + " VALUES (?, ?, ?, ?, ?, ?) " ;   
	      
	      int no = 1;
	      try {
	         Date Date = new Date();

	         Calendar calendar = Calendar.getInstance();
	         calendar.setTime(Date);
	         Date couponDate = calendar.getTime();
	         
	         calendar.add(Calendar.DAY_OF_MONTH, 30);
	         Date couponDueDate = calendar.getTime();

	         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	         String formattedDate = dateFormat.format(couponDate);
	         String formattedDueDate = dateFormat.format(couponDueDate);

	           psmt = con.prepareStatement(sql);
	           psmt.setInt(no++, userNo);
	           psmt.setString(no++, "아메리카노 1잔 무료 교환권");
	           psmt.setString(no++, formattedDate);
	           psmt.setString(no++, formattedDueDate);
	           psmt.setString(no++, root+"\\static\\img\\coffee1.jpg");
	           psmt.setInt(no++, 0);
	         
	           System.out.println("formattedDate : " + formattedDate );
	         result = psmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         System.err.println("쿠폰 발행 중, 에러 발생!");
	         e.printStackTrace();
	      }
	      
	      System.out.println("쿠폰 " + result + "개가 발행되었습니다.");
	      return result;
	   }
	
	/**
	 * 쿠폰 목록
	 * @return
	 */
	public List<Coupon> couponlist() {
		
		ArrayList<Coupon> couponList = new ArrayList<Coupon>();
		
		String sql = " SELECT * FROM coupon ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	/**
	 * 사용자 보유 쿠폰 목록
	 * @return
	 */
	public List<Coupon> couponlist(String userNo) {
		
		ArrayList<Coupon> couponList = new ArrayList<Coupon>();
		
		String sql = " SELECT * FROM coupon WHERE user_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	/**
	 * 사용자 완료 쿠폰 목록
	 * @return
	 */
	public List<Coupon> couponCompletelist(int userNo, int couponCheck) {
		
		ArrayList<Coupon> couponList = new ArrayList<Coupon>();
		
		String sql = " SELECT * FROM coupon WHERE user_no = ? AND couponCheck = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, userNo);
			psmt.setInt(2, couponCheck);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	/**
	 * 사용자 완료 쿠폰 목록 불러오기
	 * @return
	 */
	public List<Coupon> couponCompletelist(int userNo) {
		
		ArrayList<Coupon> couponList = new ArrayList<Coupon>();
		
		String sql = " SELECT * "
					+ " FROM coupon "
					+ " WHERE user_no = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, userNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponDueDate(rs.getString("coupon_duedate"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	
	/**
	 * 쿠폰 번호 조회
	 * @param couponNo
	 * @return
	 */
	public Coupon couponSelect(String couponNo) {
		Coupon coupon = new Coupon();
		
		String sql = " SELECT * FROM coupon WHERE coupon_no = ? ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, couponNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));

			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회시, 에러 발생");
			e.printStackTrace();
		}
		
		return coupon;
	}
	
	/**
	 * 쿠폰 발행(등록)
	 * @param coupon
	 * @return
	 */
	public int couponGenerate(int userNo, Coupon coupon) {
		int result = 0;
		
		String sql = " INSERT INTO coupon (user_no, coupon_name, coupon_date, coupon_duedate, coupon_img, coupon_check) "
				   + " VALUES (?, ?, ?, ?, ?, ?) " ;	
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, userNo);
			psmt.setString(no++, coupon.getCouponName());
			psmt.setString(no++, coupon.getCouponDate());	
			psmt.setString(no++, coupon.getCouponDueDate());	
			psmt.setString(no++, coupon.getCouponImg());
			psmt.setInt(no++, coupon.getCouponCheck());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 발행 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰 " + result + "개가 발행되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 정보 수정
	 * @param coupon
	 * @return
	 */
	public int couponUpdate(Coupon coupon) {
		
		int result = 0;

		String sql = " UPDATE coupon "
				   + " SET coupon_no = ? "
				   + " , user_no = ? "
				   + " , coupon_name = ? "
				   + " , coupon_date = ? "
				   + " , coupon_img = ? "
				   + " , coupon_check = ? "
				   + " WHERE coupon_no = ? ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, coupon.getCouponNo());
			psmt.setInt(no++, coupon.getUserNo());
			psmt.setString(no++,coupon.getCouponName());
			psmt.setString(no++, coupon.getCouponDate());
			psmt.setString(no++, coupon.getCouponImg());
			psmt.setInt(no++, coupon.getCouponCheck());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰" + result + "개가 수정되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 정보 수정
	 * @param couponNo, couponCheck
	 * @return check 값 변경
	 */
	public int couponUpdate(int userNo, int couponNo, int couponCheck) {
		System.out.println(userNo);
		System.out.println(couponNo);
		System.out.println(couponCheck);
		int result = 0;

		String sql = " UPDATE coupon "
				   + " SET coupon_check = ? "
				   + " WHERE coupon_no = ? AND user_no = ? ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, couponCheck);
			psmt.setInt(no++, couponNo);
			psmt.setInt(no++, userNo);

			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰" + result + "개가 수정되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 삭제
	 * @param coupon
	 * @return
	 */
	public int couponDelete(String couponNo) {
		int result = 0;
		
		String sql = "DELETE FROM coupon "
				   + "WHERE coupon_no = ? ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, couponNo);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("쿠폰" + result + "개가 삭제되었습니다.");
		
		return result;
	}
	
	/**
	 * 발행 날짜 기준으로 최근에 생성한 쿠폰 정보 조회
	 * @return
	 */
	public List<Coupon> LatestCoupon(String userNo) {
			
		ArrayList<Coupon> couponList = new ArrayList<Coupon>();
			
		Coupon coupon = new Coupon();
		
		String sql = " SELECT * "
				   + " FROM coupon "
				   + " ORDER BY coupon_date DESC";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {

				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("coupon_no"));
				coupon.setCouponName(rs.getString("coupon_name"));
				coupon.setCouponDate(rs.getString("coupon_date"));
				coupon.setCouponImg(rs.getString("coupon_img"));
				coupon.setCouponCheck(rs.getInt("coupon_check"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 정보 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	
	public Coupon nonCompleCoupon(int userNo, int check) {
		Coupon coupon = new Coupon();
		
		String sql = " SELECT COUNT(*) "
				   + " FROM coupon "
				   + " WHERE user_no = ? AND coupon_check = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, userNo);
			psmt.setInt(2, check);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				coupon.setCount(rs.getInt("COUNT(*)"));
			}
			
		} catch (SQLException e) {
			System.err.println("쿠폰 카운팅 중, 에러 발생");
			e.printStackTrace();
		}
		return coupon;
		
	}
	
}