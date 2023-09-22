package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cafe.dto.Admin;

public class AdminRepository extends JDBConnection {

	/**
	 * 관리자 등록
	 * @param admin
	 * @return
	 */
	public int insert(Admin admin) { 
		int result = 0;
		String sql = " INSERT INTO manager (manager_no, manager_id, manager_pw) "
				   + " VALUES ( ?, ?, ?) " ;				

		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, admin.getMangerNo());
			psmt.setString(no++, admin.getMangerId());
			psmt.setString(no++, admin.getManaerPw());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("관리자 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("관리자 데이터 " + result + "개가 등록되었습니다.");
		return result;
	}
	

	/**
	 * 주문목록 조회
	 * @param Order
	 * @return
	 */
	public Admin orderSelect(String orderNo) {
		Admin order = new Admin();
		
		String sql = " SELECT * FROM order WHERE order_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, orderNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				order.setOrderNo(rs.getInt("order_no"));
				order.setUserTel(rs.getString("user_tel"));
				order.setOrderName(rs.getString("order_name"));
				order.setOrderCnt(rs.getInt("order_cnt"));
				order.setOrderPrice(rs.getInt("order_price"));
				order.setOrderDate(rs.getString("order_date"));

			}
		} catch (SQLException e) {
			System.err.println("상품 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
	
	/**
	 * 쿠폰 발행
	 * @param 
	 * @return
	 */
	public int generate(Admin admin) {
		
		int result = 0;
		// [NEW] - file 컬럼 추가
		String sql = " INSERT INTO coupon (coupon_no, user_no, coupon_name, coupon_date, coupon_img, coupon_check) "
				   + " VALUES (?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, admin.getCouponNo());
			psmt.setInt(no++, admin.getUserNo());
			psmt.setString(no++, admin.getCouponName());
			psmt.setString(no++, admin.getCouponDate());	
			psmt.setString(no++, admin.getCouponImg());	
			psmt.setInt(no++, admin.getCouponCheck());	
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("쿠폰 발행 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("쿠폰 " + result + "개가 발행되었습니다.");
		return result;
	}
	
	/**
	 * 쿠폰 목록 조회
	 * @param CouponNo
	 * @return
	 */

	public List<Admin> list() {
		
		ArrayList<Admin> couponList = new ArrayList<Admin>();
		
		String sql = " SELECT * FROM coupon ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Admin coupon = new Admin();
				coupon.setUserNo(rs.getInt("user_no"));
				coupon.setCouponNo(rs.getInt("couponNo"));
				coupon.setCouponName(rs.getString("couponName"));
				coupon.setCouponDate(rs.getString("couponDate"));
				coupon.setCouponImg(rs.getString("couponImg"));
				coupon.setCouponCheck(rs.getInt("couponCheck"));
				
				couponList.add(coupon);
			}
		} catch (SQLException e) {
			System.err.println("쿠폰 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return couponList;
	}
	
	
//	public Admin couponSelect(String CouponNo) {
//		Admin coupon = new Admin();
//		
//		String sql = " SELECT * FROM order WHERE order_no = ? ";
//		
//		try {
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, CouponNo);
//			rs = psmt.executeQuery();
//			
//			while(rs.next()) {
//				
//				coupon.setUserNo(rs.getInt("user_no"));
//				coupon.setCouponNo(rs.getInt("couponNo"));
//				coupon.setCouponName(rs.getString("couponName"));
//				coupon.setCouponDate(rs.getString("couponDate"));
//				coupon.setCouponImg(rs.getString("couponImg"));
//				coupon.setCouponCheck(rs.getInt("couponCheck"));
//
//			}
//		} catch (SQLException e) {
//			System.err.println("쿠폰 목록 조회시, 에러 발생");
//			e.printStackTrace();
//		}
//		
//		return coupon;
//	}
}
