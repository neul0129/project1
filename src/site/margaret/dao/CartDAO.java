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

	//��ٱ��� �߰�
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
			System.out.println("[����]insertCountCart()�޼ҵ���  SQL ���� ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//��ǰ������ ���޹޾� ��ٱ��� ���� �����Ͽ� CART���̺� ���� 
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
			System.out.println("[����]updateCountCart()�޼ҵ���  SQL ���� ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��ٱ��� ��ȣ�� ���� �޾� �����Ͽ� REPLY���̺� ����
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
				System.out.println("[����]deleteCart()�޼ҵ���  SQL ���� ="+e.getMessage());
			}finally {
				close(con, pstmt);
			}
			return rows;
		}
	
		
	//�����ϸ� ��ٱ��� ������� dao ����� 
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
				System.out.println("[����]deleteAllCart()�޼ҵ���  SQL ���� ="+e.getMessage());
			}finally {
				close(con, pstmt);
			}
			return rows;
		}
		
	//���̵� ���޹޾� ��ٱ��� ��� 
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
			System.out.println("[����]selectCartList()�޼ҵ���  SQL ���� ="+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
	//��ٱ��� �� ���� 
	public int selectCartCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; //�Խñ��� ����
		
		try {
			con= getConnection();
			
			
			String sql="select count(*) from cart";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch (SQLException e) {
			System.out.println("[����]selectCartCount()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//��ٱ��� ��ȣ�� �޾Ƽ� �˻� 
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
			System.out.println("[����]selectcartNo()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	//CART_SEQ ������ ��ü�� ������(�ڵ� ������)�� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]selectNextCartNo() �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]searchSameProduct() �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]updateCart() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
}
