package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cafe.dto.Admin;
import cafe.dto.Order;
import cafe.dto.User;
import cafe.dto.Product;
import cafe.dao.OrderRepository;
import cafe.dao.UserRepository;
import cafe.dao.ProductRepository;


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
			psmt.setInt(no++, admin.getManagerNo());
			psmt.setString(no++, admin.getManagerId());
			psmt.setString(no++, admin.getManagerPW());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("관리자 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("관리자 데이터 " + result + "개가 등록되었습니다.");
		return result;
	}
	
	/**
	 * 관리자 로그인 조회
	 * @param id
	 * @param PW
	 * @return
	 */
	public Admin login(String id, String pw) {
		
		String sql = " SELECT * "
				   + " FROM manager "
				   + " WHERE manager_id = ? "
				   + "   AND manager_pw = ? ";
		
		Admin admin = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) { 
				admin = new Admin();
				admin.setManagerNo(rs.getInt("manager_no"));
				admin.setManagerId(rs.getString("manager_id"));
				admin.setManagerPW(rs.getString("manager_pw"));
			}
			
		} catch (SQLException e) {
			System.err.println("관리자 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return admin;
	}
	
	// ----------------------------------------------------------------------------------
	/**
	 * 상품 주문하기
	 * @param
	 * @return
	 */
	public int productOrder(String userTel, String orderName, String orderCnt, String order_price, String order_number) {
		int result = 0;
		
		String sql = " INSERT INTO "
				   + " `order`( user_tel, order_name, order_cnt, order_price, order_number ) "
				   + " VALUES ( ?, ?, ?, ?, ? ) ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, userTel);
			psmt.setString(no++, orderName);
			psmt.setString(no++, orderCnt);
			psmt.setString(no++, order_price);
			psmt.setString(no++, order_number);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("상품 주문 중, 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 장바구니 추가
	 * @param
	 * @return
	 */
	public int cartAdd(String productNo, String userNo) {
		int result = 0;
		
		String sql = " INSERT INTO cart(user_no, product_no, cart_cnt) "
				   + " VALUES ( ?, ?, ? ) ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, userNo);
			psmt.setString(no++, productNo);
			psmt.setInt(no++, 1);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("장바구니 등록 중, 에러 발생");
			e.printStackTrace();
		}
		
		System.out.println("장바구니에" + result + "개가 등록되었습니다.");
		
		return result;
	}
	
}
	
	