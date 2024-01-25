package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cafe.dto.Order;

public class OrderRepository extends JDBConnection{

	/**
	 * 전체 주문 목록
	 * @return
	 */
	public List<Order> orderlist() {
		
		ArrayList<Order> orderList = new ArrayList<Order>();
		
		String sql = " SELECT * FROM `order` ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Order order = new Order();
				order.setOrderNo(rs.getInt("order_no"));
				order.setUserTel(rs.getString("user_tel"));
				order.setOrderName(rs.getString("order_name"));
				order.setOrderCnt(rs.getInt("order_cnt"));
				order.setOrderPrice(rs.getInt("order_price"));
				order.setOrderNumber(rs.getString("order_number"));
				order.setOrderDate(rs.getString("order_date"));
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.err.println("주문 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return orderList;
	}
	
	/**
	 * 주문 등록
	 * @param order
	 * @return
	 */
	public int orderInsert(Order order) { 
		int result = 0;
		String sql = " INSERT INTO `order` (order_no, user_tel, order_name, order_cnt, order_price, order_date, order_number ) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ? ) " ;				

		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(no++, order.getOrderNo());
			psmt.setString(no++, order.getUserTel());
			psmt.setString(no++, order.getOrderName());
			psmt.setInt(no++, order.getOrderCnt());
			psmt.setInt(no++, order.getOrderPrice());
			psmt.setString(no++, order.getOrderDate());
			psmt.setString(no++, order.getOrderNumber());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("주문 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("주문" + result + "개가 등록되었습니다.");
		return result;
	}
	
	/**
	 * 주문목록 조회
	 * @param Order
	 * @return
	 */
	public Order orderSelect(String orderNo) {
		Order order = new Order();
		
		String sql = " SELECT * FROM `order` WHERE order_no = ? ";
		
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
				order.setOrderNumber(rs.getString("order_number"));
			}
		} catch (SQLException e) {
			System.err.println("주문 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
	
	/**
	 * 주문 삭제
	 * @param orderNo
	 * @return
	 */
	public int delete(String orderNo) {
		int result = 0;
		
		String sql = " DELETE FROM `order` WHERE order_no = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, orderNo);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("주문 삭제 시, 에러 발생");
			e.printStackTrace();
		}
		return result;

	}
	
	/**
	 * 
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
	 * 주문번호 처리를 위한 사용자 번호로 조회
	 * @param orderNo
	 * @return
	 */
	public Order orderCompleteSelect(String orderNo) {
		Order order = new Order();
		
		String sql = " SELECT * FROM `order` "
				   + " WHERE user_tel = ? ";
		
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
				order.setOrderNumber(rs.getString("order_number"));
			}
		} catch (SQLException e) {
			System.err.println("상품 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return order;
	}
}