package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.margaret.dto.ProductDTO;

public class ProductDAO extends JdbcDAO{
	public static ProductDAO _dao;
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ProductDAO();
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	// ��ǰ������ ���޹޾� PRODUCT ���̺� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int insertProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into product values(product_seq.nextval,?,?,?,?,?,?,sysdate,?)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getProductName());
			pstmt.setString(2, product.getCategory());
			pstmt.setString(3, product.getMainImage());
			pstmt.setString(4, product.getProductDetail());
			pstmt.setInt(5, product.getStock());
			pstmt.setInt(6, product.getProductPrice());
			pstmt.setString(7, product.getProductSize());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertProduct �޼ҵ��� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��ǰ������ ���޹޾� PRODUCT ���̺� ����� �ش� ��ǰ������ �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int updateProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update product set product_name=?, category=?, main_image=?, product_detail=?, stock=?, product_price=?, product_size=?, add_date=sysdate where product_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getProductName());
			pstmt.setString(2, product.getCategory());
			pstmt.setString(3, product.getMainImage());
			pstmt.setString(4, product.getProductDetail());
			pstmt.setInt(5, product.getStock());
			pstmt.setInt(6, product.getProductPrice());
			pstmt.setString(7, product.getProductSize());
			pstmt.setInt(8, product.getProductNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateProduct �޼ҵ��� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//PRODUCT ���̺� ����� ����� ��ȯ�ϴ� �޼ҵ�
	public List<ProductDTO> selecAllProduct(String product_name, String category, String product_size, String st_add_date, String end_add_date ) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select * from product";
			String whereSql = "";
			
			if(product_name != null && !product_name.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where UPPER(product_name) like '%'||UPPER('"+product_name+"')||'%'"; 
				}else {
					whereSql += " and UPPER(product_name) like '%'||UPPER('"+product_name+"')||'%'"; 
				}
			}
			
			if(category != null && !category.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where category = '"+category+"'"; 
				}else {
					whereSql += " and category = '"+category+"'"; 
				}
			}
			
			if(product_size != null && !product_size.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where product_size = '"+product_size+"'"; 
				}else {
					whereSql += " and product_size = '"+product_size+"'"; 
				}
			}
			
			if(st_add_date != null && !st_add_date.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where add_date >= "+"to_date('"+st_add_date+"')"; 
				}else {
					whereSql += " and add_date >="+"to_date('"+st_add_date+"')"; 
				}
			}

			if(end_add_date != null && !end_add_date.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where add_date < "+"to_date('"+end_add_date+"')+1"; 
				}else {
					whereSql += " and add_date < "+"to_date('"+end_add_date+"')+1"; 
				}
			}
			
			sql += whereSql+" order by product_no";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setProductNo(rs.getInt("product_no"));
				product.setProductName(rs.getString("product_name"));
				product.setCategory(rs.getString("category"));
				product.setMainImage(rs.getString("main_image"));
				product.setProductDetail(rs.getString("product_detail"));
				product.setStock(rs.getInt("stock"));
				product.setProductPrice(rs.getInt("product_price"));
				product.setAddDate(rs.getString("add_date"));
				product.setProductSize(rs.getString("product_size"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectProduct �޼ҵ��� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	//��ǰ��ȣ�� ���޹޾� PRODUCT ���̺� ����� �ش� ��ǰ��ȣ�� ��ǰ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public ProductDTO selectNoProduct(int productNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			
			String sql="select * from product where product_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product=new ProductDTO();
				product.setProductNo(rs.getInt("product_no"));
				product.setProductName(rs.getString("product_name"));
				product.setCategory(rs.getString("category"));
				product.setMainImage(rs.getString("main_image"));
				product.setProductDetail(rs.getString("product_detail"));
				product.setStock(rs.getInt("stock"));
				product.setProductPrice(rs.getInt("product_price"));
				product.setAddDate(rs.getString("add_date"));
				product.setProductSize(rs.getString("product_size"));
			}
		} catch (SQLException e) {
			System.out.println("[����]selectNoProduct �޼ҵ��� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	//��ǰ��ȣ�� ���޹޾� PRODUCT ���̺� ����� �ش� ��ǰ��ȣ�� ��ǰ������ �����ϴ� �޼ҵ�
	public int deleteProduct(int productNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from product where product_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]deleteProduct �޼ҵ��� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// ���߻��� �޼ҵ�
	public int checkDeleteProduct(String checkProductNo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from product where product_no in("+checkProductNo+")";
			pstmt=con.prepareStatement(sql);
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[����]checkDeleteProduct �޼ҵ��� SQL ����"+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	// �ֹ��� ��� ����
		public int updateProductStock(int productNo, int stock) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update product set stock=stock + ? where product_no = ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, stock);
				pstmt.setInt(2, productNo);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[����]updateProductStock �޼ҵ��� SQL ����"+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
}
