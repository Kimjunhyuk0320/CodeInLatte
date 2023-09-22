package cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cafe.dto.Product;

public class ProductRepository extends JDBConnection{
	
	/**
	 * 상품 목록
	 * @return
	 */
	public List<Product> list() {
		
		ArrayList<Product> productList = new ArrayList<Product>();
		
		String sql = " SELECT * FROM product ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Product product = new Product();
				product.setProductNo(rs.getInt("product_no"));
				product.setProductName(rs.getString("product_name"));
				product.setProductCat(rs.getString("product_cat"));
				product.setProductPrice(rs.getInt("product_price"));
				product.setProductCon(rs.getString("product_con"));
				product.setProductImg(rs.getString("product_img"));
				
				productList.add(product);
			}
		} catch (SQLException e) {
			System.err.println("상품 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return productList;
	}
	
	/**
	 * 상품 조회
	 * @param productNo
	 * @return
	 */
	public Product select(String productNo) {
		Product product = new Product();
		
		String sql = " SELECT * FROM product WHERE product_no = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productNo);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				product.setProductNo(rs.getInt("product_no"));
				product.setProductName(rs.getString("product_name"));
				product.setProductCat(rs.getString("product_cat"));
				product.setProductPrice(rs.getInt("product_price"));
				product.setProductCon(rs.getString("product_con"));
				product.setProductImg(rs.getString("product_img"));
				product.setProductRegdate(rs.getString("product_regdate"));

			}
		} catch (SQLException e) {
			System.err.println("상품 조회 시, 에러 발생");
			e.printStackTrace();
		}
		
		return product;
	}
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		
		String sql = " INSERT INTO product ( product_name, product_cat "
				   + " , product_price, product_con, product_img ) "
				   + " VALUES(?, ?, ?, ?, ?) ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, product.getProductName());
			psmt.setString(no++, product.getProductCat());
			psmt.setInt(no++, product.getProductPrice());
			psmt.setString(no++, product.getProductCon());
			psmt.setString(no++, product.getProductImg());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("상품 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("상품" + result + "개가 등록되었습니다.");
		return result;
	}
	
	/**
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {
		
		System.out.println(product);
		
		int result = 0;
		// [NEW] - file 컬럼 추가
		String sql = " UPDATE product "
				   + " SET product_name = ? "
				   + " , product_cat = ? "
				   + " , product_price = ? "
				   + " , product_con = ? "
				   + " , product_img = ? "
				   + " WHERE product_no = ? ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, product.getProductName());
			psmt.setString(no++, product.getProductCat());
			psmt.setInt(no++, product.getProductPrice());
			psmt.setString(no++, product.getProductCon());
			psmt.setString(no++, product.getProductImg());
			psmt.setInt(no++, product.getProductNo());
			
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("상품 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("상품" + result + "개가 수정되었습니다.");
		return result;
	}
	
	
	public int delete(String productNo) {
		int result = 0;
		
		String sql = "DELETE FROM product "
				   + "WHERE product_no = ? ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, productNo);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("상품 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		
		System.out.println("상품" + result + "개가 삭제되었습니다.");
		
		return result;
	}
	
}
