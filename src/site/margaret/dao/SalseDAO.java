package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.margaret.dto.SalseDTO;

public class SalseDAO extends JdbcDAO {
	private static SalseDAO _dao;
	
	private SalseDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new SalseDAO();
	}
	
	public static SalseDAO getDAO() {
		return _dao;
	}

	//매출 테이블의 모든 테이블 검색
	public List<SalseDTO> selectAllTotalSalesList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SalseDTO> salesList = new ArrayList<SalseDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from sales order by salesDate";
			
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				SalseDTO salse = new SalseDTO();
				salse.setSalesDate(rs.getString("sales_date"));
				salse.setOrderCount(rs.getInt("order_count"));
				salse.setOrderSalesTotal(rs.getInt("order_sales_total"));
				salse.setDeliveryChargeTotal(rs.getInt("delivery_charge_total"));
				salse.setSalesTotal(rs.getInt("sales_total"));
				salse.setRefundTotal(rs.getInt("refund_total"));
				salse.setNetSalesTotal(rs.getInt("net_saltotal"));
				salesList.add(salse);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllTotalSalesList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return salesList;
	}
	
	//당일 최초 주문 추가
	public int insertDaySales(SalseDTO salse) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		try {
			con= getConnection();
			String sql = "insert into salse values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, salse.getSalesDate());
			pstmt.setInt(2, salse.getOrderCount());
			pstmt.setInt(3, salse.getOrderSalesTotal());
			pstmt.setInt(4, salse.getDeliveryChargeTotal());
			pstmt.setInt(5, salse.getSalesTotal());
			pstmt.setInt(6, salse.getRefundTotal());
			pstmt.setInt(7, salse.getNetSalesTotal());
			
			
		} catch (SQLException e) {
			System.out.println("[에러]insertDaySales() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//매출 갱신
	public int updateDaySales(SalseDTO salse) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		try {
			con= getConnection();
			String sql = "update salse set oreder_count=?, order_sales_total=?, delivery_charge_total=?, sales_total=?, refund_total=?, net_sales_total=? where sales_date=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, salse.getOrderCount());
			pstmt.setInt(2, salse.getOrderSalesTotal());
			pstmt.setInt(3, salse.getDeliveryChargeTotal());
			pstmt.setInt(4, salse.getSalesTotal());
			pstmt.setInt(5, salse.getRefundTotal());
			pstmt.setInt(6, salse.getNetSalesTotal());
			pstmt.setString(7, salse.getSalesDate());
			
			
		} catch (SQLException e) {
			System.out.println("[에러]updateDaySales() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//기간검색
	public List<SalseDTO> selectPeriodsalesList(String startDate, String endDate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SalseDTO> salesList = new ArrayList<SalseDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select * from sales where sales_date between ? and ? order by sales_date desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				SalseDTO salse = new SalseDTO();
				salse.setSalesDate(rs.getString("sales_date"));
				salse.setOrderCount(rs.getInt("order_count"));
				salse.setOrderSalesTotal(rs.getInt("order_sales_total"));
				salse.setDeliveryChargeTotal(rs.getInt("delivery_charge_total"));
				salse.setSalesTotal(rs.getInt("sales_total"));
				salse.setRefundTotal(rs.getInt("refund_total"));
				salse.setNetSalesTotal(rs.getInt("net_saltotal"));
				salesList.add(salse);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectPeriodsalesList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return salesList;
	}
}

