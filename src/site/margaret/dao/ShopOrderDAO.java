package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.margaret.dto.ShopOrderDTO;
import site.margaret.dto.shopOrderJoinDTO;


public class ShopOrderDAO extends JdbcDAO{
	public static ShopOrderDAO _dao;
	
	public ShopOrderDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ShopOrderDAO();
	}
	
	public static ShopOrderDAO getDAO() {
		return _dao;
	}
	
	//주문을 전달받아 SHOP_ORDER 테이블에 저장하고 저장행의 갯수를 반환하는 메소드
	public int InsertOrder(ShopOrderDTO order) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into shop_order values(?,?,?,?,sysdate,?,?,sysdate,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, order.getOrderNo());
			pstmt.setString(2, order.getId());
			pstmt.setInt(3, order.getProductNo());
			pstmt.setString(4, order.getOrderSeq());
			pstmt.setInt(5, order.getOrderStatus());
			pstmt.setInt(6, order.getPayNo());
			pstmt.setString(7, order.getRecipient());
			pstmt.setString(8, order.getDeZipcode());
			pstmt.setString(9, order.getDeAddress1());
			pstmt.setString(10, order.getDeAddress2());
			pstmt.setString(11, order.getDeMessage());
			pstmt.setString(12, order.getRePhone());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]InsertOrder의 SQL 메소드 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//주문 전체보기
	public List<shopOrderJoinDTO>selectAllOrder() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<shopOrderJoinDTO> orderList=new ArrayList<shopOrderJoinDTO>();
		try {
			con=getConnection();
			
			String sql = "SELECT A.*,B.* FROM (select * from shop_order where (order_no,product_no,order_seq) "
					+ "IN (select DISTINCT order_no,product_no, max(order_seq) OVER(PARTITION BY order_no,product_no) from shop_order)"
					+ " order by order_no,product_no,order_seq desc) A INNER JOIN product B ON A.product_no = B.product_no order by order_date desc";
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				shopOrderJoinDTO order=new shopOrderJoinDTO();
				order.setOrderNo(rs.getInt("order_no"));
				order.setId(rs.getString("id"));
				order.setProductNo(rs.getInt("product_no"));
				order.setOrderSeq(rs.getString("order_seq"));
				order.setOrderdate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setPayNo(rs.getInt("pay_no"));
				order.setPayDate(rs.getString("pay_date"));
				order.setRecipient(rs.getString("recipient"));
				order.setDeZipcode(rs.getString("de_zipcode"));
				order.setDeAddress1(rs.getString("de_address1"));
				order.setDeAddress2(rs.getString("de_address2"));
				order.setDeMessage(rs.getString("de_message"));
				order.setRePhone(rs.getString("re_phone"));
				order.setProductName(rs.getString("product_name"));
				order.setCategory(rs.getString("category"));
				order.setProductSize(rs.getString("product_size"));
				order.setMainImage(rs.getString("main_image"));
				order.setProductPrice(rs.getInt("product_price"));
				orderList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllOrder의 SQL 메소드 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orderList;
	}
	
	//ORDER_SEQ 시퀸스 객체의 다음값(자동 증가값)을 검색하여 반환하는 메소드
		public int selectNextOrderNo() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int nextNum=0;
			try {
				con=getConnection();
				
				String sql="select shop_order_seq.nextval from dual";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					nextNum=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNextOrderNo() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return nextNum;
		}
		
		public List<shopOrderJoinDTO>selectSearchOrder(String search , String status) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<shopOrderJoinDTO> orderList=new ArrayList<shopOrderJoinDTO>();
			try {
				con=getConnection();
				if(status == "" && search != "") {
					String sql = "SELECT A.*,B.* FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no where "+search+" like sysdate";
					pstmt=con.prepareStatement(sql);
				} else if(status != "" && search != "") {
					String sql = "SELECT A.*,B.* FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no where "+search+" like sysdate and order_status = "+status+"";
					pstmt=con.prepareStatement(sql);
				} else {
					String sql = "SELECT A.*,B.* FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no where order_status = "+status+" and order_date between sysdate-30 and sysdate";
					pstmt=con.prepareStatement(sql);
				}
				
					
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					shopOrderJoinDTO order=new shopOrderJoinDTO();
					order.setOrderNo(rs.getInt("order_no"));
					order.setId(rs.getString("id"));
					order.setProductNo(rs.getInt("product_no"));
					order.setOrderSeq(rs.getString("order_seq"));
					order.setOrderdate(rs.getString("order_date"));
					order.setOrderStatus(rs.getInt("order_status"));
					order.setPayNo(rs.getInt("pay_no"));
					order.setPayDate(rs.getString("pay_date"));
					order.setRecipient(rs.getString("recipient"));
					order.setDeZipcode(rs.getString("de_zipcode"));
					order.setDeAddress1(rs.getString("de_address1"));
					order.setDeAddress2(rs.getString("de_address2"));
					order.setDeMessage(rs.getString("de_message"));
					order.setRePhone(rs.getString("re_phone"));
					order.setProductName(rs.getString("product_name"));
					order.setCategory(rs.getString("category"));
					order.setProductSize(rs.getString("product_size"));
					order.setMainImage(rs.getString("main_image"));
					order.setProductPrice(rs.getInt("product_price"));
					
					orderList.add(order);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectSearchOrder의 SQL 메소드 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return orderList;
		}
		
		public List<shopOrderJoinDTO> selectPaymentComplete (int select ,String date) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<shopOrderJoinDTO> paymentcompleteList = new ArrayList<shopOrderJoinDTO>();
			
			try {
				con = getConnection();
				if(select == 1) {
					String sql = "SELECT * FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no where order_status>=2 and order_status <> 7 and order_date like to_date(?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, date);
				
				} else if(select==2) {
					String sql = "SELECT * FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no where order_status = 7 and order_date like to_date(?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, date);
					
				} else {
					String sql = "SELECT * FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no where order_status = 7 ) temp) where rn between ? and ?";
					pstmt = con.prepareStatement(sql);
				
				}
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					shopOrderJoinDTO paymentcomplete=new shopOrderJoinDTO();
					paymentcomplete.setOrderNo(rs.getInt("order_no"));
					paymentcomplete.setId(rs.getString("id"));
					paymentcomplete.setProductNo(rs.getInt("product_no"));
					paymentcomplete.setOrderSeq(rs.getString("order_seq"));
					paymentcomplete.setOrderdate(rs.getString("order_date"));
					paymentcomplete.setOrderStatus(rs.getInt("order_status"));
					paymentcomplete.setPayNo(rs.getInt("pay_no"));
					paymentcomplete.setPayDate(rs.getString("pay_date"));
					paymentcomplete.setRecipient(rs.getString("recipient"));
					paymentcomplete.setDeZipcode(rs.getString("de_zipcode"));
					paymentcomplete.setDeAddress1(rs.getString("de_address1"));
					paymentcomplete.setDeAddress2(rs.getString("de_address2"));
					paymentcomplete.setDeMessage(rs.getString("de_message"));
					paymentcomplete.setRePhone(rs.getString("re_phone"));
					paymentcomplete.setProductName(rs.getString("product_name"));
					paymentcomplete.setCategory(rs.getString("category"));
					paymentcomplete.setProductSize(rs.getString("product_size"));
					paymentcomplete.setMainImage(rs.getString("main_image"));
					paymentcomplete.setProductPrice(rs.getInt("product_price"));
					
					paymentcompleteList.add(paymentcomplete);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectPaymentComplete의 SQL 메소드 오류="+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return paymentcompleteList;
		}
		//마이페이지 주문내역 
public List<shopOrderJoinDTO> selectProductOrder(String id){
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	List<shopOrderJoinDTO> orderList=new ArrayList<shopOrderJoinDTO>();
	try {
		con=getConnection();
		String sql = "SELECT A.*,B.* FROM (select * from shop_order where (order_no,product_no,order_seq) "
				+ "IN (select DISTINCT order_no,product_no, max(order_seq) OVER(PARTITION BY order_no,product_no) from shop_order)"
				+ " order by order_no,product_no,order_seq desc) A INNER JOIN product B ON A.product_no = B.product_no where id = ? order by order_date desc";
				pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			shopOrderJoinDTO order=new shopOrderJoinDTO();
			order.setOrderNo(rs.getInt("order_no"));
			order.setId(rs.getString("id"));
			order.setProductNo(rs.getInt("product_no"));
			order.setOrderSeq(rs.getString("order_seq"));
			order.setOrderdate(rs.getString("order_date"));
			order.setOrderStatus(rs.getInt("order_status"));
			order.setPayNo(rs.getInt("pay_no"));
			order.setPayDate(rs.getString("pay_date"));
			order.setRecipient(rs.getString("recipient"));
			order.setDeZipcode(rs.getString("de_zipcode"));
			order.setDeAddress1(rs.getString("de_address1"));
			order.setDeAddress2(rs.getString("de_address2"));
			order.setDeMessage(rs.getString("de_message"));
			order.setRePhone(rs.getString("re_phone"));
			order.setProductName(rs.getString("product_name"));
			order.setCategory(rs.getString("category"));
			order.setProductSize(rs.getString("product_size"));
			order.setMainImage(rs.getString("main_image"));
			order.setProductPrice(rs.getInt("product_price"));
			
			orderList.add(order);
		}
	}catch(SQLException e){
		System.out.println("[에러]selectSearchOrder의 SQL 메소드 오류="+e.getMessage());
	}finally {
		close(con, pstmt, rs);
	}
	return orderList;
}
	//SHOP_ORDER 테이블에 저장된 목록을 반환하는 메소드
	public List<shopOrderJoinDTO> selectSearchAllOrder(String product_name, String id, String st_order_date, String end_order_date ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<shopOrderJoinDTO> selectOrderList=new ArrayList<shopOrderJoinDTO>();
		try {
			con=getConnection();
			
			// String sql="SELECT A.*,B.* FROM shop_order A INNER JOIN product B ON a.product_no = B.product_no";
			
			String sql =
			"SELECT A.*,B.* FROM (select * from shop_order where (order_no,product_no,order_seq) "
			+
			"IN (select DISTINCT order_no,product_no, max(order_seq) OVER(PARTITION BY order_no,product_no) from shop_order)"
			+
			" order by order_no,product_no,order_seq desc) A INNER JOIN product B ON A.product_no = B.product_no ";
			
			
			String whereSql = "";
			
			if(product_name != null && !product_name.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where UPPER(B.product_name) like '%'||UPPER('"+product_name+"')||'%'"; 
				}else {
					whereSql += " and UPPER(B.product_name) like '%'||UPPER('"+product_name+"')||'%'"; 
				}
			}
			
			if(id != null && !id.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where UPPER(A.id) like '%'||UPPER('"+id+"')||'%'";
				}else {
					whereSql += " and UPPER(A.id) like '%'||UPPER('"+id+"')||'%'"; 
				}
			}
			
			if(st_order_date != null && !st_order_date.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where A.order_date >= "+"to_date('"+st_order_date+"')"; 
				}else {
					whereSql += " and A.order_date >="+"to_date('"+st_order_date+"')"; 
				}
			}

			if(end_order_date != null && !end_order_date.equals("")) {
				if(whereSql.equals("")) {
					whereSql += " where A.order_date < "+"to_date('"+end_order_date+"')+1"; 
				}else {
					whereSql += " and A.order_date < "+"to_date('"+end_order_date+"')+1"; 
				}
			}
			
			sql += whereSql+" order by order_date desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				shopOrderJoinDTO order=new shopOrderJoinDTO();
				order.setOrderNo(rs.getInt("order_no"));
				order.setId(rs.getString("id"));
				order.setProductNo(rs.getInt("product_no"));
				order.setOrderSeq(rs.getString("order_seq"));
				order.setOrderdate(rs.getString("order_date"));
				order.setOrderStatus(rs.getInt("order_status"));
				order.setPayNo(rs.getInt("pay_no"));
				order.setPayDate(rs.getString("pay_date"));
				order.setRecipient(rs.getString("recipient"));
				order.setDeZipcode(rs.getString("de_zipcode"));
				order.setDeAddress1(rs.getString("de_address1"));
				order.setDeAddress2(rs.getString("de_address2"));
				order.setDeMessage(rs.getString("de_message"));
				order.setRePhone(rs.getString("re_phone"));
				order.setProductName(rs.getString("product_name"));
				order.setCategory(rs.getString("category"));
				order.setProductSize(rs.getString("product_size"));
				order.setMainImage(rs.getString("main_image"));
				order.setProductPrice(rs.getInt("product_price"));
				
				selectOrderList.add(order);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectSearchAllOrder 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return selectOrderList;
	}
	

	//주문상태 9로 업데이트 시 리뷰작성 불가
	public int updateOrderStatus(int productNo, int orderNo, int orderStatus) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update shop_order set order_status=? where order_no=?"
					+" and product_no = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, orderStatus);
			pstmt.setInt(2, orderNo);
			pstmt.setInt(3, productNo);
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[에러]updateOrderStatus 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}





