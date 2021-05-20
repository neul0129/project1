package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.proxy.annotation.Pre;
import site.margaret.dto.CartDTO;
import site.margaret.dto.CartJoinDTO;

public class CartDAO extends JdbcDAO {
	private static CartDAO _dao;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CartDAO();
	}
	
	public static CartDAO getDAO() {
		return _dao;
	}

	//장바구니 추가
	public int insertCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql = "insert into cart values (?,?,?,?)"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cart.getCartNo());
			pstmt.setInt(2, cart.getProductNo());
			pstmt.setString(3, cart.getId());
			pstmt.setInt(4, cart.getCartQuantity());

			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[에러]insertCountCart()메소드의  SQL 오류 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//상품정보를 전달받아 장바구니 수량 변경하여 CART테이블에 저장 
	public int updateCountCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql = "update cart set cart_quantity=? where product_no=?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cart.getCartQuantity());
			pstmt.setInt(2, cart.getProductNo());
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[에러]updateCountCart()메소드의  SQL 오류 ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//장바구니 번호를 전달 받아 삭제하여 REPLY테이블에 저장
		public int deleteCart(int cartNo) {
			Connection con = null;
			PreparedStatement pstmt=null;
			int rows=0;
			
			try {
				con=getConnection();
				String sql = "delete from cart where cart_no=?"; 
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, cartNo);
				
				rows=pstmt.executeUpdate();
			}catch (SQLException e) {
				System.out.println("[에러]deleteCart()메소드의  SQL 오류 ="+e.getMessage());
			}finally {
				close(con, pstmt);
			}
			return rows;
		}
	
		
	//결제하면 장바구니 비워지는 dao 만들기 
		public int deleteAllCart(String id) {
			Connection con = null;
			PreparedStatement pstmt=null;
			int rows=0;
			
			try {
				con=getConnection();
				String sql = "delete from cart where id=?"; 
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rows=pstmt.executeUpdate();
			}catch (SQLException e) {
				System.out.println("[에러]deleteAllCart()메소드의  SQL 오류 ="+e.getMessage());
			}finally {
				close(con, pstmt);
			}
			return rows;
		}
		
	//아이디를 전달받아 장바구니 목록 
	public List<CartJoinDTO> selectCartList(String id){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<CartJoinDTO> cartList = new ArrayList<CartJoinDTO>();
		try {
			con=getConnection();
			String sql = "select cart_no,id,cart_quantity,product.product_no,product_name,category"
					+ ",product_size,main_image,product_detail,stock,product_price"
					+ ",add_date from product join cart on"
					+ " product.product_no=cart.product_no where id =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartJoinDTO cart = new CartJoinDTO();
				cart.setCartNo(rs.getInt("cart_no"));
				cart.setId(rs.getString("id"));
				cart.setCartQuantity(rs.getInt("cart_quantity"));
				cart.setProductNo(rs.getInt("product_no"));
				cart.setProductName(rs.getString("product_name"));
				cart.setCategory(rs.getString("category"));
				cart.setProductSize(rs.getString("product_size"));
				cart.setMainImage(rs.getString("main_image"));
				cart.setProductDetail(rs.getString("product_detail"));
				cart.setStock(rs.getInt("stock"));
				cart.setProductPrice(rs.getInt("product_price"));
				cart.setAddDate(rs.getString("add_date"));
				cartList.add(cart);
			}
		}catch(SQLException e){
			System.out.println("[에러]selectCartList()메소드의  SQL 오류 ="+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
	//장바구니 총 개수 
	public int selectCartCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; //게시글의 개수
		
		try {
			con= getConnection();
			
			
			String sql="select count(*) from cart";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch (SQLException e) {
			System.out.println("[에러]selectCartCount()메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//장바구니 번호를 받아서 검색 
	public CartDTO selectcartNo(int cartNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartDTO cart = null;
		try {
			con= getConnection();
			String sql = "select*from cart where cart_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
					
			rs=pstmt.executeQuery();
					
			if(rs.next()) {
				cart=new CartDTO();
				cart.setCartNo(rs.getInt("cartNo"));
				cart.setProductNo(rs.getInt("productNo"));
				cart.setId(rs.getString("id"));
				cart.setCartQuantity(rs.getInt("cartQuantity"));
						
			}
		}catch (Exception e) {
			System.out.println("[에러]selectcartNo()메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	//CART_SEQ 시퀸스 객체의 다음값(자동 증가값)을 검색하여 반환하는 메소드
	public int selectNextCartNo() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select cart_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextCartNo() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNum;
	}
	
	public CartDTO searchSameProduct(int productNo, String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartDTO cart = null;
		
		try {
			con=getConnection();
			
			String sql="select * from cart where product_no= "+productNo+" and upper(id)=upper(?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cart = new CartDTO();
				cart.setCartNo(rs.getInt("cart_no"));
				cart.setProductNo(rs.getInt("product_no"));
				cart.setId(rs.getString("id"));
				cart.setCartQuantity(rs.getInt("cart_quantity"));
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]searchSameProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	public int updateCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		
		try {
			con = getConnection();
			String sql = "update cart set cart_quantity = cart_quantity+? where product_no=?";
			
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, cart.getCartQuantity());
			pstmt.setInt(2, cart.getProductNo());
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]updateCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
}
